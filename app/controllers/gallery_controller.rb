class GalleryController < ApplicationController
  
  def index
    @fruits = Store.all
  end

  def search
    keyword="%" + params[:search].to_s + "%"
    @fruits = Store.find_by_sql ["Select * from stores WHERE name like ?  or description like ?",keyword,keyword]
  end
  
  def checkout

  	if request.post?
  	amount = session[:total_price]
    ActiveMerchant::Billing::Base.mode = :test

# Create a new credit card object
    credit_card = ActiveMerchant::Billing::CreditCard.new(
      :number     => params[:number],
      :month      => params[:month],
      :year       => params[:year],
      :first_name => params[:first_name],
      :last_name  => params[:last_name],
      :verification_value  => params[:verification_value]
    )


  if credit_card.valid?
    # Create a gateway object to the TrustCommerce service
    gateway = ActiveMerchant::Billing::TrustCommerceGateway.new(
      :login    => 'TestMerchant',
      :password => 'password'
    )

  response = gateway.authorize(amount.to_i, credit_card)
   puts "=========="
   puts response.inspect
  if response.success?
    # Capture the money
    #Triger the mailer
    session[:cart_id]=nil
    session[:cart_amount]=nil
    gateway.capture(amount.to_i, response.authorization)
    redirect_to :action=>:purchase_complete
  end
  else
    flash[:notice] = "Invalid credit card. Give proper inputs"
    render :action=>:checkout
  end
 end
end
end
