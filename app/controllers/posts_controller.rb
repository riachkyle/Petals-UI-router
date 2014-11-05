class PostsController < ApplicationController

	respond_to :json

	def index
		@posts = Post.all
		respond_with @posts, each_serializer: PostSerializer
	end

	def create
		@post = Post.new(post_params)

     # if there is an image, process image before save
    if params[:imageData]
      decode_image
      @post.pic = @awesome
      logger.debug @post
    end

		if @post.save
			render json: @post, status: :created
		else
			render json: @post.errors, status: :unprocessable_entity
		end
	end

	def destroy
		@post = Post.find(params[:id])
		if @post.destroy
			render json: @post, status: :ok
		end
	end

	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(post_params)
			render json: @post, status: :accepted
		else
			render json: @post.errors, status: :not_acceptable
		end
	end

	protected

	def post_params
		params.require(:post).permit(:caption, :pic, :location, :release_date, :imageContent, :imageData, :imagePath)
	end

  def decode_image
    # decode base64 string
    Rails.logger.info 'decoding now'
    decoded_data = Base64.decode64(params[:imageData]) # json parameter set in directive scope
    # create 'file' understandable by Paperclip
    data = StringIO.new(decoded_data)
    data.class_eval do
      attr_accessor :content_type, :original_filename, :pic_file_name
    end

    # set file properties
    data.content_type = params[:imageContent] # json parameter set in directive scope
    data.original_filename = params[:imagePath] # json parameter set in directive scope

    # update hash, I had to set @up to persist the hash so I can pass it for saving
    # since set_params returns a new hash everytime it is called (and must be used to explicitly list which params are allowed otherwise it throws an exception)
    #@up[:pic] = data # user Icon is the model attribute that i defined as an attachment using paperclip generator
    @awesome = data
  end


end
