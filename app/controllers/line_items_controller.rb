class LineItemsController < ApplicationController
  def new
    @line_item = parent_resource.line_items.build
  end

  def create
    @line_item = LineItem.new(params[:line_item])
    if @line_item.save
      redirect_to @line_item.invoice, notice: 'Line item successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
    @line_item = LineItem.find(params[:id])
  end

  def update
    @line_item = LineItem.find(params[:id])
    if @line_item.update_attributes(params[:line_item])
      redirect_to @line_item.invoice, notice: 'Line item successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to @line_item.invoice, notice: 'Line item successfully destroyed.'
  end

  def parent_resource
    @parent_resource ||= PurchaseInvoice.find(params[:purchase_invoice_id])
  end
end