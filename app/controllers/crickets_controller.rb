class CricketsController < ApplicationController
	def index
		if params[:query].present?
			@cricketers = Cricket.where(id: params[:query])
		else
			@cricketers = Cricket.all
		end
	end

	def show
		@cricketer = Cricket.find(params[:id])
	end

	def edit
		@cricketer = Cricket.find(params[:id])
		if @cricketer.addresses.empty?
			@cricketer.addresses.build
		end
 end

 	def update
 		@cricketer = Cricket.find(params[:id])
 		if params[:cricket][:picture].present?
 			uploaded_file = params[:cricket][:picture]
		  File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
		    file.write(uploaded_file.read)
		  end
 		end
 		if @cricketer.update(cricket_params)
 			redirect_to cricket_path(@cricketer)
 		else
 			render "edit" 
 		end
 	end

 	def new
 		@cricketer = Cricket.new
 		2.times{@cricketer.addresses.build}
 	end

 	def create
 		@cricketer = Cricket.new(cricket_params)
 		if params[:cricket][:picture].present?
 			uploaded_file = params[:cricket][:picture]
		  File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
		    file.write(uploaded_file.read)
		  end
 		end

 		if @cricketer.save 
 		 redirect_to cricket_path(@cricketer)
 		else
 			render :new 
 		end
 	end

 	def destroy
 		@cricketer = Cricket.find(params[:id])
 		@cricketer.destroy
 		redirect_to root_path
 	end

 	 private
    def cricket_params
       params.require(:cricket).permit!
      #(:name, :age, :country, :matches_played, :runs_scored, :wickets_taken, :role, :highest_score, :best_bowling, :captain, :retired, :addresses, addresses_attributes:[:id, :house, :street, :landmark, :city, :state, :country, :pincode, :_destroy], phone_numbers: [])
    end
end


