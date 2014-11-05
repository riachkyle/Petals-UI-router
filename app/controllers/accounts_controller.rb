class AccountsController < ApplicationController

  respond_to :json

  def index
    @accounts = Account.all
    respond_with @accounts, each_serializer: AccountSerializer
  end

  def create
  	@account = Account.new(account_params)
  	if @account.save
  		render json: @account, status: :created
  	end
  end

  def destroy
    @account = Account.find(params[:id])
    if @account.destroy
      render json: @account, status: :ok
    else
      render json: @account.errors, status: :internal_server_error
    end
  end

  def update
    @account = Account.find(params[:id])
    if @account.update_attributes(account_params)
      render json: @account, status: :accepted
    else
      render json: @account.errors, status: :internal_server_error
    end
  end

  private

  def account_params
  	params.require(:account).permit(:owner_name, :ig_account, :engagement)
  end


end

