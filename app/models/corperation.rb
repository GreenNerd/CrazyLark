class Corperation < ActiveRecord::Base
  has_many :departments, dependent: :destroy
  has_many :users
  has_many :calendars
  # has_one :time_sets
  validates :name, presence: true, length: { maximum: 16 }
  
  def create_new_days
    day = Date.new(2016,1,1)
    365.times do 
      if day.sunday?||day.saturday?
        holiday = true
      else
        holiday = false
      end
      Calendar.create(day: day,
                               month: day.month,
                               start: 8,
                               arrive: 9,
                               late: 10,
                               run: 4,
                               leave: 5,
                               finish: 6,
                               holiday: holiday,
                               dayoff: false,
                               corperation_id: self.id)
    end 
  end

  def create_times
    time = TimeSet.new(start: 8, arrive: 9,late: 10,run: 4,leave: 5,finish: 6,corperation_id: self.id)
    time.save
  end

end
