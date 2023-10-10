class SpendingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @banks = current_user.banks.all
    @bank_count = current_user.banks.count
  end
end
