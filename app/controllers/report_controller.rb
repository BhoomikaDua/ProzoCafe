class ReportController < ApplicationController
  def index
  end

  def create
    start_date = params[:start_date]
    end_date = params[:end_date]
    date_range = "#{start_date} - #{end_date}"
    @invoices = Invoice.where(['created_at >= ? and created_at <= ?',start_date.to_s, end_date.to_s])

    if(start_date == '' || end_date == '')
      flash[:error] = "Empty Date Fields!"
      redirect_back(fallback_location: "invoices/index")
    elsif(@invoices.count == 0)
      flash[:error] = "No invoices found between #{date_range}"
      redirect_back(fallback_location: "invoices/index")
    else
      flash[:success] = "Invoices between #{date_range}"
      render :template => "invoices/index"
    end

  end
end
