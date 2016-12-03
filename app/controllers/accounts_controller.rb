class AccountsController < ApplicationController



  def index
    # @customer = Customer.includes(:accounts).find_by_twitter_id(params["twitter_id"])
    #
    # return {errors: "Not found"}, :status => 404 if @customer.nil?
    #
    # @accounts = @customer.accounts
    #
    # respond_to do |format|
    #   format.json {render :json => @accounts}
    #   format.html {render "index"}
    # end
    # @user = current_user
    #
    # return {errors: "Not found"}, :status => 404 if @user.nil?
    #
    # @accounts = @user.accounts
    #
    # respond_to do |format|
    #   format.json {render :json => @accounts}
    #   format.html {render "index"}
    #
    if current_user.nil?
        uid = params[:twitter_id]

        identity = Identity.where(:uid => uid).first
        @user = identity.user
    else
      @user = current_user
    end
    @accounts = @user.accounts
    respond_to do |format|
      format.json {render :json => @accounts}
      format.html {render "index"}
    end
  end

  def balance
    p params[:twitter_id]
    identity = Identity.find(:uid => params[:twitter_id])
    @user = identity.user unless @user.nil?

    @accounts = @user.accounts

    respond_to do |format|
      format.json {render :json => @accounts}
      format.html {render "index"}
    end
  end
end
