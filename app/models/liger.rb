class Liger < ActiveRecord::Base
  COLORS = [
    'rainbow',
    'sparkly',
    'shiny',
    'brown'
  ]

  SEXES = [
    'M',
    'F',
    '?'
  ]
  validates :color, inclusion: { in: COLORS }
  validates :sex, inclusion: { in: SEXES }
  validates :birth_date, :name, presence: true

  has_many :liger_rental_requests, dependent: :destroy

  def age
    Time.now.year - birth_date.year
  end
end
