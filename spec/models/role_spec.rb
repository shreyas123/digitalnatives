require 'spec_helper'

describe Role do 
	describe '#associations' do 
		it { should have_many :permission_roles }
		it { should have_many :permissions }
		it { should have_many :users }
	end

	describe '#by_start_name' do 
		before do 
			FactoryGirl.create :role, name: 'Shreyas'
			FactoryGirl.create :role, name: 'Test'
			FactoryGirl.create :role, name: 'Test1'
			FactoryGirl.create :role, name: 'Digital'
		end
		it 'returns roles with a beginning character in params' do 
			expect(Role.all.length).to eq 4
			expect(Role.by_start_name('S').length).to eq 1
		end
	end
end