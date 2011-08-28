class SalesInvoicesController < ApplicationController
  def index
    @sales_invoices = SalesInvoice.all
  end

  def show
    @sales_invoice = SalesInvoice.find(params[:id])
  end

  def new
    @sales_invoice = SalesInvoice.new
  end

  def create
    @sales_invoice = SalesInvoice.new(params[:sales_invoice])
    if @sales_invoice.save
      redirect_to @sales_invoice, notice: 'Sales invoice successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
    @sales_invoice = SalesInvoice.find(params[:id])
  end

  def update
    @sales_invoice = SalesInvoice.find(params[:id])
    if @sales_invoice.update_attributes(params[:sales_invoice])
      redirect_to @sales_invoice, notice: 'Sales invoice successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @sales_invoice = SalesInvoice.find(params[:id])
    @sales_invoice.destroy
    redirect_to sales_invoices_path, notice: 'Sales invoice successfully deleted.'
  end
end
