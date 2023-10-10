class SpendingsController < ApplicationController
  before_action :authenticate_user!
  def index
    # 銀行名登録関連
    @banks = current_user.banks.all
    @bank_count = current_user.banks.count
  end
end
