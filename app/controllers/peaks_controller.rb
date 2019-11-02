class PeaksController < ApplicationController
  def index
    signals = PeakDetectionService.run(
      data: reading_collection.pluck(:value),
      threshold: index_params[:threshold].to_f
    )

    render json: { signals: signals }, status: :ok
  end

  private

  def reading_collection
    collection = Reading
    collection = collection.date_range(build_date_range_filters) if params[:date_range]
    collection
  end

  def build_date_range_filters
    index_params[:date_range].to_h.symbolize_keys
  end

  def index_params
    params.permit(:threshold, date_range: [:start_date, :end_date])
  end
end
