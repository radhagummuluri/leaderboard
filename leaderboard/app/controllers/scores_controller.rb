class ScoresController < ApplicationController
  def index
    start_date = "2014-04-07 16:43:58"
    end_date = "2014-04-07 16:47:58"
    @scores = Hash.new()
    @points = Score.all_points_for_month(start_date,end_date)
    @teams = Team.all

    if(!@points.empty?)
      @points= @points.group("team_id").sum("points")
      @teams.each  do |n|
        if @points[n.id] != nil
          @scores[n.name] = @points[n.id]
        else
          @scores[n.name] = 0
        end
      end
      @scores = @scores.sort_by{|name, points| points}.reverse
    end
  end
end
