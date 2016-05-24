class Corperation < ActiveRecord::Base
  has_many :departments, dependent: :destroy
  has_many :users
  has_many :calendars
  has_one :time_sets
  validates :name, presence: true, length: { maximum: 16 }

  def create_times
    time = TimeSet.new(start: 8, arrive: 9,late: 10,run: 4,leave: 5,finish: 6,corperation_id: self.id)
    time.save
  end

end
