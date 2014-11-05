class PostSerializer < ActiveModel::Serializer
  attributes :id, :caption, :location, :release_date, :pic, :medium_pic

  def medium_pic
  	object.pic(:medium)
  end
  
end
