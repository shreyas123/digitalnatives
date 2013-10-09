require 'spec_helper'

describe Permission do 
	describe '#associations' do 
		it { should have_many :permission_users }
		it { should have_many :users }
		it { should have_many :permission_roles }
		it { should have_many :roles }
	end
end