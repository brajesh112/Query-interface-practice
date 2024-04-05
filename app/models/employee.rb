class Employee < ApplicationRecord
belongs_to :ceo, class_name:"Employee", optional: true
belongs_to :manager, class_name:"Employee", optional: true
has_many :managers, class_name: "Employee", foreign_key: :ceo_id
has_many :workers, class_name:"Employee",foreign_key: :manager_id
end
