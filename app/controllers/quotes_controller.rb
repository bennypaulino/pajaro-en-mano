class QuotesController < ApplicationController
  def index
    @quote = Quote.order("RANDOM()").first
  end

  def create
    @quote = Quote.create(quote_params)
    if @quote.invalid?
      flash[:error] = '<strong>No se podia guardar,</strong> el frase ingresado es inválido.'
    end
    redirect_to root_path
  end

  def sobre
  end

  private

  def quote_params
    params.require(:quote).permit(:saying, :author, :country)
  end

end
