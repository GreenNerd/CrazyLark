class GetMac < ActiveRecord::Base
  # before_create :clock
  # validates :mac, presence: true, length: { maximum: 6 }
  # def clock
  #   coming = Time.now.to_a[2] * 60 + Time.now.to_a[1]
  #   id_corperation = find_corperation
  #   ids_employees = find_employee   
  #   times = TimeSet.find_by(corperation_id: id_corperation[0])
  #   create_first_day_record

  #   for i in 0..ids_employees.length - 1
  #     if coming < times.start * 60
  #       break
  #     elsif coming < times.arrive * 60
  #       record_come(ids_employees[i][0])
  #     elsif coming < times.late * 60
  #       record_late(ids_employees[i][0])
  #     elsif coming < times.run * 60
  #       record_absence(ids_employees[i][0]) 
  #     elsif coming < times.leave * 60
  #       record_not_absence(ids_employees[i][0])
  #     elsif coming < times.finish * 60
  #       record_leave(ids_employees[i][0])
  #     else
  #       record_overtime(ids_employees[i][0])
  #     end
  #   end
  # end

  # def find_corperation
  #   if Corperation.where(mac: params["mac"])
  #     Corperation.where(mac: params["mac"]).ids       
  #   end
  # end

  # def find_employee
  #   goodboys = []
  #   n = 0
  #   while params[(n+1).to_s]
  #     mac_address = /\w+:\w+:\w+:\w+:\w+/.match(params[(n+1).to_s]).to_s
  #     if Employee.where(mac: mac_address)
  #       goodboys[n] = Employee.where(mac: mac_address).ids
  #       n += 1
  #     end
  #   end
  #   goodboys
  # end

  # def create_first_day_record
  #   for i in 0..ids_employees.length - 1
  #     if record = Record.where(employee_id: ids_employees[i][0])
  #       if record.last.date != Date.today  
  #         Record.create(employee_id: ids_employees[i][0],date: Date.today) 
  #       end
  #     else
  #         Record.create(employee_id: ids_employees[i][0],date: Date.today)
  #     end
  #   end
  # end

  private

  def record_come(id)
    record = Record.where(employee_id: id)
    if record.last.date == Date.today
      if record.status.nil?
        record.last.update(status: "normal")
      end
    else
      Record.create(employee_id: id,date: Date.today,status: "normal")
    end
  end

  def record_late(id)
    record = Record.where(employee_id: id)
     if record.last.date == Date.today
      if record.status.nil?
        record.last.update(status: "late")
      end
    else
      Record.create(employe_eid: id,date: Date.today,status: "late")
    end     
  end

  def record_absence(id)
    record = Record.where(employee_id: id)
    if record.last.date == Date.today
      if record.status.nil?
        record.last.update(status: "absence")
      end
    else
      Record.create(employee_id: id,date: Date.today,status: "absence")
    end       
  end

  def record_not_absence(id)
    record = Record.where(employee_id:  id)
    if record.last.date == Date.today
      if record.pm_status.nil?
        record.last.update(pm_status: "flag")
      end
    else
      Record.create(employee_id: id,date: Date.today,pm_status: "flag")
    end
  end

  def record_leave
    record = Record.where(employee_id: id)
    if record.last.date == Date.today
      record.last.update(pm_status: "normal")
    else
      Record.create(employee_id: id,date: Date.today,pm_status: "normal")
    end
  end

end
