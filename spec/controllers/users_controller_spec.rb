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
end