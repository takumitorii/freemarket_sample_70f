class PurchaseController < ApplicationController
  require 'payjp'

  def index
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = "sk_test_826df327589dd88b0db93ac4"
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = "sk_test_826df327589dd88b0db93ac4"
    Payjp::Charge.create(
    :amount => 13500, #仮置きです、productのpriceを表示します
    :customer => card.customer_id,
    :currency => 'jpy',
  )
  redirect_to action: 'done'
  end

end