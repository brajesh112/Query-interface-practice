class Form < ApplicationRecord
	 attr_accessor :type_of_form
	 enum :role, [:user, :admin, :jury]
	validates :user_name, uniqueness: true, presence: true, format: {with: /\A[a-zA-Z]+[1-9]+\z/}
	validates :name, :email ,presence: true, uniqueness: true
	validates :age, comparison: {less_than: 30, greater_than: 18}, if: -> {self.role != "admin"} 
	validates :password, length: {minimum: 8},  format: {with: /\A[a-z]+[A-Z]+[!@#$%^&*()]+\z/}, confirmation: true
	# validates :password_confirmation, presence: true
	validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/}
	validates :user_name, length: {minimum: 5}, if: :check_type 
	validates :age, comparison: {greater_than: 30,message: "You are not authorised to be admin"}, if: [:check_type, :check_role] 
	before_validation do self.name = user_name if name.nil? 
	end
	# after_rollback :rollbacked, on: :create
  after_validation do puts "After validation" end 
 	before_save do puts "before save" end
  around_save :around
  # def rollbacked 
	# byebug
	# 	puts "after_rollback" 
	# end

	# def after_rollback(*arg, &block)
	# 	byebug
	# end

  def around 
  	# puts "before around"
  	yield
  	puts "after around"
  end
	# before_create do puts "before create" end
	 around_create :create_around 
	 
	 def create_around
	 	
	 yield
	 	puts "around create" 
	 end
	# after_create do puts "after_create" end
	after_save do puts "after save" end
	after_commit do puts "after_commit" end
	

	around_update :update_around
	
	def update_around
	 	yield
	 		puts "after_update"
	  end
	
	around_destroy :destroy_around
	
	def destroy_around
	 yield	
	 puts "after_destroy"
	  end
 

	def check_type
		 if type_of_form == "advance" || type_of_form.nil?
		 	 self.user_name = self.name + "_#{Form.last.id+1}"
		 end
	end

	 def check_role
	 	role == "admin"
	 end



end