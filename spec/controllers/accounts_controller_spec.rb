require 'rails_helper'

RSpec.describe AccountsController, :type => :controller do

	let :valid_attributes do
		{
			owner_name: 'starbucks',
			ig_account: 'starbucks'
		}
	end

	describe "GET #index endpoint" do
		let :account1 do
			Account.create! valid_attributes
		end
		let :account2 do
			Account.create! valid_attributes
		end

		before do
			get :index, format: :json
		end

		it "should succeed" do
			expect(response).to be_success
		end

		it "should assign @accounts to be all of the accounts" do
			expect(assigns(:accounts)).to_json include(account1, account2)
		end
	end

	describe "POST #create API endpoint" do
		describe "successful create request" do
			it "it should create a new Account into the DB" do
				expect do
					post :create, account: valid_attributes, format: :json
				end.to change(Account, :count).by(1)
			end
			it "should respond with a success status and render back account as JSON" do
				post :create, account: valid_attributes, format: :json
				expect(response.status).to be(201)

				response_hash = JSON.parse(response.body)
				expect(response_hash["id"]).to eq(Account.last.id)
			end
		end
	end

	describe "DELETE #destroy API endpoint" do
		before do
		  @account = Account.create! valid_attributes
		end

		it "should delete a record from the database" do
		  expect do
		    delete :destroy, id: @account.id, format: :json
		  end.to change(Account, :count).by(-1)
		end

		it "should render back ok status code" do
			delete :destroy, id: @account.id, format: :json
	        expect(response.status).to eq(200)
        end
	end

	describe "PATCH #update API endpoint" do
		let :new_json do
			{
				owner_name: 'Shawnye',
				ig_account: 'Shawnye.swag',
				engagement: 90
			}
		end

		before do
			@account = Account.create! valid_attributes
		end

		describe "successful" do
			it "should be able to udpate an account" do
				patch :update, id: @account.id, account: new_json, format: :json
				expect(@account.reload.engagement).to eq(90)
				expect(response.status).to eq(202)
				hash = JSON.parse(response.body)
				expect(hash["owner_name"]).to eq('Shawnye')
			end
		end

		describe "errors" do
			it "should give back an error" do
				# expect(response.status).to eq(500)
			end
		end
	end

end




