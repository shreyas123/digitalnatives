class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def create
		status = params[:user].delete(:status)
		u = User.new(params[:user])
		u.status = status
		if u.save
			respond_to do |format|
				format.html { redirect_to :index, notice: 'Brand was successfully created.' }
	        	format.json { render json: u, status: :created }
	        	format.js { render js: "$('#users_list').append('<br/>#{u.name}');"}
	        end
		else
			respond_to do |format| 
				format.html { render action: "index" }
	        	format.json { render json: u.errors.full_messages, status: :unprocessable_entity }
	        	format.js { render js: "$('#errors').html('#{u.errors.full_messages}')", status: :unprocessable_entity}
	        end
		end
	end
end
