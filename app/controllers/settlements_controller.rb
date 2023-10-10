class SettlementsController < ApplicationController
  def new
    @settlement = Settlement.new
    @banks = current_user.banks.all
  end

  def create
    @settlement = Settlement.new(settlement_params)
    @banks = current_user.banks.all
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
    @settlement = Settlement.find(params[:id])
  end

  def update
    @settlement = Settlement.find(params[:id])
    if @settlement.update(settlement_params)
      redirect_to settlement_path(@settlement.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @settlement = Settlement.find(params[:id])
  end

  private
  def settlement_params
    params.require(:settlement).permit(:payment, :bank_id).merge(user_id: current_user.id)
  end
end
