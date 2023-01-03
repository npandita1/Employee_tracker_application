class Team < ApplicationRecord

   ## Associations
   belongs_to :employee
   belongs_to :project

end   