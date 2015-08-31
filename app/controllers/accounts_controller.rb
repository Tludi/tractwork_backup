class AccountsController < ApplicationController
  before_action :set_account, only: []
  
  def index
    @accounts = Account.all
  end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    respond_to do |format|
      if @account.save
        format.html{ redirect_to @account, notice: 'Account creation.' }
      else
        redirect_to accounts_path
      end
    end
  end

  private
    def set_account
      @account = Account.find(params[:id])
    end

    def account_params
      params[:account].permit(:name)
    end
end
