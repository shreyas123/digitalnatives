require 'spec_helper'

describe User do 
	describe '#associations' do 
		it { should belong_to :role }
		it { should have_many :permission_users }
		it { should have_many :permissions }
	end
end