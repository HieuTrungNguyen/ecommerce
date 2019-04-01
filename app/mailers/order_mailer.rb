class OrderMailer < ApplicationMailer

  def create_order current_user, order
    @user = current_user
    @order = order

    mail to: @user.mail, subject: "Create Order"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.cancel_order.subject
  #
  def cancel_order current_user, order
    @user = current_user
    @order = order

    mail to: @user.email, subject: "Cancel Order"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.approve_order.subject
  #
  def approve_order order
    @order = order
    @user = @order.user

    mail to: @user.mail, subject: "Approve Order"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.reject_order.subject
  #
  def reject_order order
    @order = order
    @user = @order.user

    mail to: @user.email, subject: "Reject Order"
  end
end
