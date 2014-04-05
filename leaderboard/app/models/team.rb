class Team < ActiveRecord::Base
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true

	has_many :scores, dependent: :destroy

	rails_admin do
	  field :name do
	    label "Name"
	  end
	  
	  field :email do
	    label "Email Address"
	  end
	end
end
