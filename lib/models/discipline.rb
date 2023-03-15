class Discipline
    attr_accessor :discipline_code, :year_semester, :workload
    
    def initialize(discipline_code, year_semester, workload)
        @discipline_code = discipline_code
        @year_semester = year_semester
        @workload = workload
    end
end  