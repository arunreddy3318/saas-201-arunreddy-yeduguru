require_relative './Department' 
class Application
   attr_accessor :departments

  def initialize
    self.departments = []
     ['EEE', 'MECH', 'CSE', 'CIVIL'].each do |dept| 
     	self.departments<<Department.new(dept)
    end
  end

  def enroll(student_name,student_department)
    department = self.departments.detect { |dept| dept.name == student_department }
   return department.enroll(student_name,student_department)
  end
  def change_dept(student_name, student_department)
    if(departments[0].total.include?(student_name))
    departments[0].change_dept(student_name,student_department)
    end
    if(departments[1].total.include?(student_name))
    departments[1].change_dept(student_name,student_department)
    end
    if(departments[2].total.include?(student_name))
     departments[2].change_dept(student_name,student_department)
    end
    if(departments[3].total.include?(student_name))
    departments[3].change_dept(student_name,student_department)
    end
    department = self.departments.detect { |dept| dept.name == student_department }
    department.enroll(student_name,student_department)
  end

  def change_section(student_name, section)
    s=""
    if(departments[0].total.include?(student_name))
     s+=departments[0].change_section(student_name,section)
    end
    if(departments[1].total.include?(student_name))
     s+=departments[1].change_section(student_name,section)
    end
    if(departments[2].total.include?(student_name))
     s+=departments[2].change_section(student_name,section)
    end
    if(departments[3].total.include?(student_name))
    s+=departments[3].change_section(student_name,section)
    end
    return s
  end

  def department_view(student_dept)
    if(student_dept=="EEE")
     return departments[0].department_view()
     end
     if(student_dept=="MECH")
      return departments[1].department_view()
     end
     if(student_dept=="CSE")
     return departments[2].department_view()
     end
     if(student_dept=="CIVIL")
     return departments[3].department_view()
     end
  end

  def section_view(student_dept, section)
     if(student_dept=="EEE")
      return departments[0].section_view(student_dept,section)
     end
     if(student_dept=="MECH")
      return departments[1].section_view(student_dept,section)
     end
     if(student_dept=="CSE")
     return  departments[2].section_view(student_dept,section)
     end
     if(student_dept=="CIVIL")
      return departments[3].section_view(student_dept,section)
     end
  end

  def student_details(student_name)
    st=""
    if(departments[0].total.include?(student_name))
    st+=departments[0].student_details(student_name)
    end
    if(departments[1].total.include?(student_name))
     st+=departments[1].student_details(student_name)
    end
    if(departments[2].total.include?(student_name))
     st+=departments[2].student_details(student_name)
    end
    if(departments[3].total.include?(student_name))
     st+=departments[3].student_details(student_name)
    end
    return st
  end
end
