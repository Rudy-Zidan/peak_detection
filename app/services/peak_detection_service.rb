class PeakDetectionService < ApplicationService
  def initialize(data:, threshold:)
    @data = data
    @threshold = threshold
  end

  def run
    return [] if @data.nil? || @data.empty?

    z_scores = ZScoreCalculator.calculate(list: @data)
    z_scores.map do |z_score|
      z_score > @threshold ? 1 : 0
    end
  end
end
