
class Contact < ActiveRecord::Base
  
  validates :Name, presence: true
  validates :Email, presence: true
  validates :Comments, presence: true
  
end