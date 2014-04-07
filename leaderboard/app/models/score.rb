class Score < ActiveRecord::Base
	validates :points, presence: true

  belongs_to :team

  scope :sorted, lambda{ order("points DESC")}
  scope :member_points_for_month, lambda {|start_date, end_date, team_id|
    where("created_at >= ? AND created_at <= ? AND team_id = ?", start_date, end_date, team_id)
  }
  scope :all_points_for_month, lambda {|start_date, end_date|
    where("created_at >= ? AND created_at <= ?", start_date, end_date)
  }
	rails_admin do
	  field :points do
	    label "Points"
	  end

	  field :team do
	  	label "Team Member"
    end

    field :created_at do
      visible true
    end
    field :updated_at do
      visible true
    end

    edit do
      field :created_at do
        hide
      end

      field :updated_at do
        hide
      end
    end
	end
end
