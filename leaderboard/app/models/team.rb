class Team < ActiveRecord::Base
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true, uniqueness: true

	has_many :scores, dependent: :destroy

	def name
		"#{first_name} #{last_name}"
	end

	rails_admin do
		field :first_name do
		end

		field :last_name do
		end

		field :email do
			label "Email Address"
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
