class BanksController < ApplicationController

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
    @bank = Bank.find(params[:id])
  end

  def update
    @bank = Bank.find(params[:id])
    if @bank.update(bank_params)
      redirect_to bank_path(@bank.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @bank = Bank.find(params[:id])
  end

  private
  def bank_params
    params.require(:bank).permit(:amount_price, :name).merge(user_id: current_user.id)
  end


end
