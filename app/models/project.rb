class Project < ApplicationRecord

   ## Validations
   validates :name, presence: true, length: { minimum: 2, maximum: 50 }, uniqueness: { case_sensitive: false }
   validates :description, presence: true, length: { minimum: 6, maximum: 400 } 
   
   ## Associations
   has_many :teams, dependent: :destroy
   has_many :employees, through: :teams

end   