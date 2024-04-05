class GoodnessValidator < ActiveModel::Validator
  # def validate(record)
  #   if record.name.start_with? 'X' #== "Evil"
  #     record.errors.add :base, "This person is evil"
  #   end
  # end
end

class Record < ApplicationRecord


	# validate :validate
	#  def validate
 #    if name.start_with? 'X' #== "Evil"
 #      errors.add :base, "This person is evil"
 #    end
 #  end
  #   validates_each :name, :email do |record, attr, value|
  #   record.errors.add(attr, 'must start with upper case') if value =~ /\A[[:lower:]]/
  # end
	# validates_with GoodnessValidator
	 validates :name, presence: true, length: {minimum: 3}#inclusion: { in: %w(small medium large)} #,uniqueness: {scope: :marks}
	# validates :marks, comparison: {less_than: 100, message: "marks are more than 100"}#,on: :account_setup
	# validates :email, confirmation: {case_sensitive: false}
	# validates :email_confirmation, presence: {strict: true}
	# validates :terms, acceptance: { accept: [1, true]}
end

