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
    @settlements = current_user.settlements.all
  end

  def create
    @spending = Spending.new(spending_params)
    @settlements = current_user.settlements.all
    if @spending.save
      redirect_to spendings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    spending = Spending.find(params[:id])
    spending.destroy
    redirect_to spendings_path
  end

  def edit
    @spending = Spending.find(params[:id])
    @settlements = current_user.settlements.all
  end

  def update
    @spending = Spending.find(params[:id])
    @settlements = current_user.settlements.all
    if @spending.update(spending_params)
      redirect_to spending_path(@spending.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @spending = Spending.find(params[:id])
    @banks = current_user.banks.all
    @settlements = current_user.settlements.all
  end

  private
  def spending_params
    params.require(:spending).permit(:price, :item_name, :category_id, :start_time, :settlement_id).merge(user_id: current_user.id)
  end
end
