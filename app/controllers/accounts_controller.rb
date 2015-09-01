class AccountsController < ApplicationController
  before_action :set_account, only: [:show]

  def index
    @accounts = Account.all
  end

  def show
  end

  def new
    @account = Account.new
    @account.users.build
  end

  def create
    @account = Account.new(account_params)
    respond_to do |format|
      if @account.save
        format.html{ redirect_to accounts_path, notice: 'Account created.' }
      else
        format.html {redirect_to accounts_path, notice: 'Account Not Created.'}
      end
    end
  end

  private
    def set_account
      @account = Account.find(params[:id])
    end

    def account_params
      params.require(:account).permit(:name, users_attributes: [:id, :name, :email, :password, :password_confirmation, :role, :account_id])
    end
end
