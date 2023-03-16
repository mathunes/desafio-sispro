class CsvParseService
    def self.row_to_objects(row)
        student_code = row.split(",")[0]
        discipline_code = row.split(",")[1]
        course_code = row.split(",")[2]
        grade = row.split(",")[3]
        credit_hours = row.split(",")[4]
        year_semester = row.split(",")[5]
        
        discipline = Discipline.new(discipline_code, year_semester, credit_hours, course_code)
        enrollment = Enrollment.new(student_code, discipline_code, grade)
        student = Student.new(student_code)

        [discipline, enrollment, student]
    end
end