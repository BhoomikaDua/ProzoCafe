class HomeController < ApplicationController

  def index
    render "index"
    return;

    if current_user
      redirect_to todos_path
    else
      #render "index"
    end
  end

end
