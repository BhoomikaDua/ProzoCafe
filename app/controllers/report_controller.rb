class ReportController < ApplicationController
  def index
  end

  def create
    start_date = params[:start_date]
    end_date = params[:end_date]
    @invoices = Invoice.where(['created_at >= ? and created_at <= ?',start_date.to_s, end_date.to_s])
    if(@invoices.count == 0)
      flash[:error] = "No invoices found within the range, Showing All Invoices!"
      redirect_to categories_path
    else
      render :template => "invoices/index"
    end

  end
end
