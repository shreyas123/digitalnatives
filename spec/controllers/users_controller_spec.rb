require "spec_helper"

describe UsersController do 
	describe '#index' do 
		let!(:user) { FactoryGirl.create :user }
		subject(:request) { get :index }

		it {should be_success}

		it 'should make a get request and assigns @users' do 
			request
			expect(assigns(:users)).to eq [user]
		end
	end

	describe '#create' do 
		let(:role) { FactoryGirl.create :role }
		subject(:request) { post :create, user: {name: 'test', role_id: role.id, status: Faker::Name.name}, format: 'js'}

		it { should be_success }

		it 'should create new user' do 
			expect{request}.to change(User,:count)
		end

		describe 'errors' do 
			subject(:request) { post :create, user: {role_id: role.id, status: Faker::Name.name}, format: 'js'}

			it { should_not be_success }			
			it 'should return errors when user cannot be created' do 
				expect{request}.to_not change(User,:count)
				expect(request.body).to include("Name can't be blank")
			end
		end
	end
end