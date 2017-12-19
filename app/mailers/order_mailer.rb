class OrderMailer < ApplicationMailer
  default from: 'Daniel Kliuchnikov <klchnkvv@gmail.com>'

  def received(order)
    @order = order

    mail to: @order.email, subject: 'Your Bookshelf Inc. Store Order Confirmation.'
  end

  def shipped(order)
    @order = order

    mail to: @order.email, subject: 'Your Bookshelf Inc. Store Order Was Shipped.'
  end
end
