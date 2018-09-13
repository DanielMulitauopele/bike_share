class ConditionsController < ApplicationController
    CATEGORY = {temp:   [40..49.999, 50..59.999, 60..69.999, 70..79.999, 80..89.999, 90..99.999, 100..110],
                precip: [0..0.4999, 0.5..0.999, 1..1.4999, 1.5..1.999, 2..2.4999, 2.5..2.999, 3..3.4999, 3.5..3.999],
                wind:   [0..3.999, 4..7.999, 8..11.999, 12..15.999, 16..19.999, 20..24],
                vis:    [0..3.999, 4..7.999, 8..11.999, 12..15.999, 16..19.999, 20..24]}
  def index
    @conditions = Condition.all
  end

  def show
    @condition = Condition.find(params[:id])
  end

  def dashboard
    @stats = {}
    CATEGORY.each do |category_name, category_bins|
      @stats[category_name] = {}

      category_bins.each do |bin|
        max = Trip.max_by(bin, category_name)
        min = Trip.min_by(bin, category_name)
        avg = Trip.avg_by(bin, category_name)

        @stats[category_name][bin.to_s] = {}
        @stats[category_name][bin.to_s][:max] = {date: max.start_date.strftime("%F"), count: max.count} unless max.nil?
        @stats[category_name][bin.to_s][:max] ||= {date: "No Result", count: 0}
        @stats[category_name][bin.to_s][:min] = {date: min.start_date.strftime("%F"), count: min.count} unless min.nil?
        @stats[category_name][bin.to_s][:min] ||= {date: "No Result", count: 0}
        @stats[category_name][bin.to_s][:avg] = {count: avg} unless avg.nil?
        @stats[category_name][bin.to_s][:avg] ||= {count: 0}
      end
    end
  end
end
