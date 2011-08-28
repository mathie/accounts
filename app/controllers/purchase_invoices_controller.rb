class PurchaseInvoicesController < ApplicationController
  def index
    @purchase_invoices = PurchaseInvoice.all
  end

  def show
    @purchase_invoice = PurchaseInvoice.find(params[:id])
  end

  def new
    @purchase_invoice = PurchaseInvoice.new
  end

  def create
    @purchase_invoice = PurchaseInvoice.new(params[:purchase_invoice])
    if @purchase_invoice.save
      redirect_to @purchase_invoice, notice: 'Purchase invoice successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
    @purchase_invoice = PurchaseInvoice.find(params[:id])
  end

  def update
    @purchase_invoice = PurchaseInvoice.find(params[:id])
    if @purchase_invoice.update_attributes(params[:purchase_invoice])
      redirect_to @purchase_invoice, notice: 'Purchase invoice successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @purchase_invoice = PurchaseInvoice.find(params[:id])
    @purchase_invoice.destroy
    redirect_to purchase_invoices_path, notice: 'Purchase invoice successfully deleted.'
  end
end
