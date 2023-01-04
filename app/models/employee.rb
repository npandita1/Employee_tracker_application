class Employee < ApplicationRecord
  
    ## Validations
    validates :name, presence: true, length: { minimum: 2, maximum: 50 }
    validates :username, presence: true, length: { minimum: 2, maximum: 50 }, uniqueness: { case_sensitive: false }
  
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :invitable, :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable,
           :trackable, :confirmable, :lockable, :timeoutable

    ## Associations       
    has_many :teams
    has_many :projects, through: :teams
    belongs_to :division
    belongs_to :master_role
    belongs_to :designation
    has_one_attached :image
    # has_many_attached :pictures
    # has_rich_text :body
         
end
