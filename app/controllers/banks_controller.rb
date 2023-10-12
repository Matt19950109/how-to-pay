class BanksController < ApplicationController
  before_action :set_bank, only:[:edit, :update, :show]

  def new
    @bank = Bank.new
  end

  def create
    @bank = Bank.new(bank_params)
    if @bank.save
      redirect_to spendings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    bank = Bank.find(params[:id])
    bank.destroy
    redirect_to spendings_path
  end

  def edit
  end

  def update
    if @bank.update(bank_params)
      redirect_to bank_path(@bank.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @settlements = @bank.settlements
  end

  private
  def bank_params
    params.require(:bank).permit(:amount_price, :name).merge(user_id: current_user.id)
  end

  def set_bank
    @bank = Bank.find(params[:id])
  end


end
