class SettlementsController < ApplicationController
  before_action :set_settlement, only:[:edit, :update, :show]
  before_action :set_bank_all, only:[:new, :create, :edit, :update]

  def new
    @settlement = Settlement.new
  end

  def create
    @settlement = Settlement.new(settlement_params)
    if @settlement.save
      redirect_to spendings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    settlement = Settlement.find(params[:id])
    settlement.destroy
    redirect_to spendings_path
  end

  def edit
  end

  def update
    if @settlement.update(settlement_params)
      redirect_to settlement_path(@settlement.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
  end

  private
  def settlement_params
    params.require(:settlement).permit(:payment, :bank_id).merge(user_id: current_user.id)
  end

  def set_settlement
    @settlement = Settlement.find(params[:id])
  end

  def set_bank_all
    @banks = current_user.banks.all
  end
end
