class QuotesController < ApplicationController
  before_action :set_quote, only: [ :show, :edit, :update, :destroy ]

  def index
    @quotes = Quote.all
  end

  def Show
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)

    if @quote.save
      redirect_to quotes_path, notice: "Quote was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def ediit
  end

  def update
    if @quote.update(quote_params)
      redirect_to quotes_path, notice: "Quote was suffessfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quote.destroy
    redirect_to quotes_path, notice: "Quote was successfully destroyed."
  end

  private

  def set_quote
    @quote= Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:name)
  end
end
