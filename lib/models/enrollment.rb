class Enrollment
    attr_accessor :student, :discipline, :grade
    
    def initialize(student, discipline, grade)
        @student = student
        @discipline = discipline
        @grade = grade
    end
end