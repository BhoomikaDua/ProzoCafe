class ApplicationController < ActionController::Base
  before_action :ensure_user_logged_in

  def ensure_user_logged_in
    unless current_user
      flash[:error] = "Please Login With Appropraite Credentials to Access the Page"
      redirect_to "/"
    end
  end

  def current_user
    @current_user ||= fetch_current_user
  end

  def fetch_current_user
    current_user_id = session[:current_user_id]
    if current_user_id
      @current_user =  User.find(current_user_id)
    else
      nil
    end
  end

end
