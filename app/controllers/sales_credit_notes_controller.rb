class SalesCreditNotesController < ApplicationController
  def index
    @sales_credit_notes = SalesCreditNote.all
  end

  def show
    @sales_credit_note = SalesCreditNote.find(params[:id])
  end

  def new
    @sales_credit_note = SalesCreditNote.new
  end

  def create
    @sales_credit_note = SalesCreditNote.new(params[:sales_credit_note])
    if @sales_credit_note.save
      redirect_to @sales_credit_note, notice: 'Sales credit_note successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
    @sales_credit_note = SalesCreditNote.find(params[:id])
  end

  def update
    @sales_credit_note = SalesCreditNote.find(params[:id])
    if @sales_credit_note.update_attributes(params[:sales_credit_note])
      redirect_to @sales_credit_note, notice: 'Sales credit_note successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @sales_credit_note = SalesCreditNote.find(params[:id])
    @sales_credit_note.destroy
    redirect_to sales_credit_notes_path, notice: 'Sales credit_note successfully deleted.'
  end
end
