class Api::V1::FactsController < ApplicationController
skip_before_action :authorized, only: [:create]
  def index
    @facts = Fact.all
    render json: @facts
  end

  def create
    @fact = Fact.create(fact_params)
    if @fact.valid?
      render json: {fact: FactSerializer.new(@fact)}, status: :created
    else
      render json: {error: 'failed to create fact'}, status: :not_acceptable
    end
  end

  private

  def fact_params
    params.permit(:description, :source, :verified)
  end
end
