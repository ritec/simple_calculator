class CalculatorsController < ApplicationController

  def index
  end

  def calculate
    if params[:calculators][:value].present? && !flag_input(params[:calculators][:value])
      @equation = params[:calculators][:value]
      @solution = @equation.calculate
    else
      flash.now[:error] = "Please enter an equation using only +, -, /, * and digits."
    end
  end

  private

  def flag_input(input)
    input !~ /^[\d+*\/-]+$/
  end

end
