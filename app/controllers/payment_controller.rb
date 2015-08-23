class PaymentController < ApplicationController
  def index
  end

  def pay
		payment = Simplify::Payment.create({
		   amount: '50',
		   token: params['simplifyToken'],
		   description: 'Simplify Rails Example',
		   currency: 'USD'})

		@message = payment['paymentStatus']
  end

end
