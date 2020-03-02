class StripeService
  include Rails.application.routes.url_helpers

  DEFAULT_CURRENCY = 'usd'.freeze
  
  def initialize(user)
      @email = user.email
      @key = Rails.application.credentials.stripe[Rails.env.to_sym][:secret_key]
      @plan = user.affiliate_plan.stripe_code
      @user = user

      Stripe.api_key = @key 
  end

  def call
    create_charge(find_customer)
  end
  
  def find_customer
  if @user.stripe_code
    retrieve_customer(@user.stripe_code)
  else
    create_customer
  end
  end

  def retrieve_customer(stripe_token)
    Stripe::Customer.retrieve(stripe_token) 
  end

  def retrieve_coupon(id)
    Stripe::Coupon.retrieve(id)
  end 

  def create_customer
    customer = Stripe::Customer.create(
      name: @user.full_name,
      email: @email, 
      coupon: "IH1tci7f"  #NEED TO REMOVE 
    )
    @user.update(stripe_code: customer.id)
    customer
  end

  def create_charge(customer)
    Stripe::Charge.create(
      customer: customer.id,
      amount: order_amount,
      description: customer.email,
      currency: DEFAULT_CURRENCY
    
    )
  end

  def create_session
      session = Stripe::Checkout::Session.create(
          customer: find_customer,
          payment_method_types: ['card'],
          subscription_data: {
              items: [{
              plan: @plan,
              }],
          },
          success_url: affiliate_url(@user.id),
          cancel_url: partners_plans_url
      )
  end 

  def order_amount
    Order.find_by(id: order).amount
  end
end