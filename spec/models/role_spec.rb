require 'spec_helper'

describe Role do 
	describe '#associations' do 
		it { should have_many :permissions }
	end
end