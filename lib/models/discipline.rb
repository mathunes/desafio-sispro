class Discipline
    attr_accessor :discipline_code, :year_semester, :credit_hours, :course_code
    
    def initialize(discipline_code, year_semester, credit_hours, course_code)
        @discipline_code = discipline_code
        @year_semester = year_semester
        @credit_hours = credit_hours
        @course_code = course_code
    end
end  