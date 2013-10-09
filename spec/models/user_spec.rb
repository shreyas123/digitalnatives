require 'spec_helper'

describe User do 
	describe '#associations' do 
		it { should belong_to :role }
		it { should have_many :permission_users }
		it { should have_many :permission_roles }
	end

	describe '#validations' do 
		it {should validate_presence_of :name }
	end

	describe 'permissions' do 
		let(:user) { FactoryGirl.create :user, role: role }
		let(:role) { FactoryGirl.create :role }
		let(:permission) { FactoryGirl.create :permission }
		let!(:user_permission) { FactoryGirl.create :permission_user, user: user, permission: permission }
		let(:role_specific_permission) { FactoryGirl.create :permission }
		let!(:role_permission) { FactoryGirl.create :permission_role, permission: role_specific_permission, role: role }

		it 'should return all the permission defined via roles and via own permissions' do 
			expect(user.permissions.length).to eq 2
			user.permissions.should =~ [permission, role_specific_permission]
		end

		describe 'uniq' do 
			before do 
				FactoryGirl.create :permission_role, permission: permission, role: role
			end
			it 'should return uniq permissions' do 
				expect(user.permissions.length).to eq 2
				user.permissions.should =~ [permission, role_specific_permission]
			end
		end
	end
end