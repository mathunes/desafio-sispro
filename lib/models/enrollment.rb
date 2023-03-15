class Enrollment
    attr_accessor :student_code, :discipline_code, :grade
    
    def initialize(student_code, discipline_code, grade)
        @student_code = student_code
        @discipline_code = discipline_code
        @grade = grade
    end
end