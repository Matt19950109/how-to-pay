class SpendingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_spending, only:[:edit, :update, :show]
  before_action :set_settlement_all, except:[:destroy]

  def index
    # 銀行名登録関連
    @banks = current_user.banks.all
    @bank_count = current_user.banks.count

    # 決済方法関連
    @settlement_count = current_user.settlements.count

    # 支出管理関連
    @spendings = current_user.spendings.all
    #@spendings_sum = current_user.spendings.where(start_time: [Date.today.all_month]).sum(:price)
    @this_month_bank = current_user.spendings.where(start_time: [Date.today.all_month]).joins(settlement: :bank).group("name").sum(:price)
    @this_month_payment = current_user.spendings.where(start_time: [Date.today.all_month]).joins(:settlement).group("settlements.payment").sum(:price)
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

  def destroy
    spending = Spending.find(params[:id])
    spending.destroy
    redirect_to spendings_path
  end

  def edit
  end

  def update
    if @spending.update(spending_params)
      redirect_to spending_path(@spending.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @banks = current_user.banks.all
  end

  private
  def spending_params
    params.require(:spending).permit(:price, :item_name, :category_id, :start_time, :settlement_id, :image).merge(user_id: current_user.id)
  end

  def set_spending
    @spending = Spending.find(params[:id])
  end

  def set_settlement_all
    @settlements = current_user.settlements.all
  end
end
