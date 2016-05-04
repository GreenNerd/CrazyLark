class Employee < ActiveRecord::Base
  belongs_to :department
  validates :mobile, presence: true, uniqueness: true
  validates :name, presence: true, length: { maximum: 16 }
  validates :mac, presence: true, length: { is:14 }
                          
end
 