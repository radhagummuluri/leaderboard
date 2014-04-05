class Score < ActiveRecord::Base
	validates :points, presence: true

	belongs_to :team

	rails_admin do
	  field :points do
	    label "Points"
	  end

	  field :team do
	  	label "Team Member"
	  end

	end
end
