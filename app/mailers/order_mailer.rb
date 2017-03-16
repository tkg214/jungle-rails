class OrderMailer < ApplicationMailer

  default from: 'no-reply@jungle.com'

 def order_confirm(order)
   @order = order
   mail(to: @order.email, subject: "Order Confirmation - Order ID #{@order.id}")
 end

end
