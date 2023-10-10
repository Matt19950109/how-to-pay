class SpendingsController < ApplicationController
  before_action :authenticate_user!
  def index
    # 銀行名登録関連
    @banks = current_user.banks.all
    @bank_count = current_user.banks.count

    # 決済方法関連
    @settlements = current_user.settlements.all
    @settlement_count = current_user.settlements.count
  end
end
