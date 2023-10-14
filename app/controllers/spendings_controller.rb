class SpendingsController < ApplicationController
  before_action :authenticate_user!
  def index
    # 銀行名登録関連
    @banks = current_user.banks.all
    @bank_count = current_user.banks.count

    # 決済方法関連
    @settlements = current_user.settlements.all
    @settlement_count = current_user.settlements.count

    # 支出管理関連
    @spendings = current_user.spendings.all
  end

  def new
    @spending = Spending.new
  end

  def create
    @spending = Spending.new(spending_params)
    if @spending.save
      redirect_to spendings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def spending_params
    params.require(:spending).permit(:price, :item_name, :category_id, :start_time, :settlement_id).merge(user_id: current_user.id)
  end
end
