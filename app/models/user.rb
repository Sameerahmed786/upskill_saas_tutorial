class User < ApplicationRecord
    #Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :trackable, :validatable
    belongs_to :plan
    #has_one :profile
    
    # Whitelist this so we can grab info from the pro form
  attr_accessor :stripe_card_token

  def save_with_subscription
    # We need to check if they pass the devise validation
    if valid?
      # This is the line where stripe actually charges the customer
      customer = Stripe::Customer.create(description: email, plan: plan_id, card: stripe_card_token)
      self.stripe_customer_token = customer.id
      save!
    end
  end
end