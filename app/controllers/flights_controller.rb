class FlightsController < ApplicationController
  def index
    @airports = Airport.all.map { |a| [ a.code, a.id ] }
    @dates = Flight.pluck(:departure_time).map { |dt| dt.to_date }.uniq.sort
    @num_passengers = (1..4).to_a

    if params[:departure_airport].present? && params[:arrival_airport].present? && params[:date].present?
      @flights = Flight.where(
        departure_airport_id: params[:departure_airport],
        arrival_airport_id: params[:arrival_airport]
      ).where("DATE(departure_time) = ?", params[:date])
    else
      @flights = []
    end
  end
end
