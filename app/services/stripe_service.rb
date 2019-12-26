class StripeService
    DEFAULT_CURRENCY = 'usd'.freeze
    
    def initialize(user)
        @email = user.email
        @key = Rails.application.credentials.stripe[Rails.env.to_sym][:secret_key]
        @plan = AffiliatePlan.find(user.affiliate_plans_id).stripe_code
        binding.pry
        @user = user
        binding.pry

        Stripe.api_key = @key 
    end
  
    def call
      create_charge(find_customer)
    end
    
    def find_customer
    if user.stripe_token
      retrieve_customer(user.stripe_token)
    else
      create_customer
    end
    end
  
    def retrieve_customer(stripe_token)
      Stripe::Customer.retrieve(stripe_token) 
    end
  
    def create_customer
      customer = Stripe::Customer.create(
        email: stripe_email,
        source: stripe_token
      )
      user.update(stripe_token: customer.id)
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
            customer_email: @email,
            payment_method_types: ['card'],
            subscription_data: {
                items: [{
                plan: @plan,
                }],
            },
            success_url: 'http://www.localhost:3000',
            cancel_url: 'https://www.google.com'
        )
    end 
  
    def order_amount
      Order.find_by(id: order).amount
    end
  end