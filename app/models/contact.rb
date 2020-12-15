
class Contact < ActiveRecord::Base
  #Contact form validations
  validates :Name, presence: true
  validates :Email, presence: true
  validates :Comments, presence: true
end