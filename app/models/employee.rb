class Employee < ActiveRecord::Base
  belongs_to :department
  has_many :records , dependent: :destroy
  validates :mobile, presence: true, uniqueness: true
  validates :name, presence: true, length: { maximum: 16 }
  validates :mac, presence: true, length: { is:17 }

  def employee_record
    @arr = []
    i = 0
    Record.where(employee_id:self.id).each do |z|
      if z.date.month == params[:month] && z.date.year == params[:year]
        if z.status == 'normal' && z.pm_status == 'normal'
          @arr[i] = [z.date,'normal']
        elsif z.status == 'late'
          @arr[i] = [z.date,'late']
        elsif z.status == 'absence'  #+absence+
          @arr[i] = [z.date,'absence']
        elsif z.status == 'normal' && z.pm_status == 'flag'
          @arr[i] = [z.date,'leave']
        end
        i += 1
      end
  end                    
end
 