class PurchaseCreditNotesController < ApplicationController
  def index
    @purchase_credit_notes = PurchaseCreditNote.all
  end

  def show
    @purchase_credit_note = PurchaseCreditNote.find(params[:id])
  end

  def new
    @purchase_credit_note = PurchaseCreditNote.new
  end

  def create
    @purchase_credit_note = PurchaseCreditNote.new(params[:purchase_credit_note])
    if @purchase_credit_note.save
      redirect_to @purchase_credit_note, notice: 'Purchase credit_note successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
    @purchase_credit_note = PurchaseCreditNote.find(params[:id])
  end

  def update
    @purchase_credit_note = PurchaseCreditNote.find(params[:id])
    if @purchase_credit_note.update_attributes(params[:purchase_credit_note])
      redirect_to @purchase_credit_note, notice: 'Purchase credit_note successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @purchase_credit_note = PurchaseCreditNote.find(params[:id])
    @purchase_credit_note.destroy
    redirect_to purchase_credit_notes_path, notice: 'Purchase credit_note successfully deleted.'
  end
end
