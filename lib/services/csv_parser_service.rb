class CsvParserService
    def self.row_to_objects(row)
        begin
            row.split(",").each do |field|
                if field.nil? || field.empty?
                    raise ArgumentError
                end
            end
    
            student_code, discipline_code, course_code, grade, credit_hours, year_semester = row.split(",")
    
            discipline = Discipline.new(discipline_code, year_semester, credit_hours, course_code)
            enrollment = Enrollment.new(student_code, discipline_code, grade)
            student = Student.new(student_code)
    
            [discipline, enrollment, student]    
        rescue ArgumentError => e
            raise ArgumentError, "row with nil value: " + row
        end
    end
end