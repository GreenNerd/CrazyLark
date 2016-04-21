class GetMac < ActiveRecord::Base
  before_create :clock

  def clock
    coming = Time.now.to_a[2] * 60 + Time.now.to_a[1]
    id_corperation = find_corperation
    ids_employees = find_employee   
    times = TimeSet.find_by(corperation_id: id_corperation[0])


    if coming < times.start * 60
      
    elsif coming < times.arrive * 60
      record_come
    elsif coming < times.late * 60
      record_late
    else coming > times.late * 60
      record_absence 
    end
  end

  def find_corperation
    Corperation.where(mac: params["mac"]).ids 
  end

  def find_employee
    goodboys = []
    n = 0
    while params[(n+1).to_s]
      mac_address = /\w+:\w+:\w+:\w+:\w+/.match(params[(n+1).to_s]).to_s
      goodboys[n] = Employee.where(mac: mac_address).ids
      n++
    end
  end

  def record_come
    
  end

  def record_late
    
  end

  def record_absence
       
  end
  # find_employee.record_xxxxxxx!!!

end
