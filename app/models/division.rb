class Division < ApplicationRecord

   ## Validations
   validates :name, presence: true, length: { minimum: 2, maximum: 50 }, uniqueness: { case_sensitive: false }

   ## Associations 
   has_many :employees 

end    