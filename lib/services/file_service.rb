require_relative "../models/discipline"
require_relative "../models/enrollment"
require_relative "../models/student"

class FileService
    CSV_HEADER = "MATRICULA,COD_DISCIPLINA,COD_CURSO,NOTA,CARGA_HORARIA,ANO_SEMESTRE"

    def self.read_file(file_path)
        begin
            file = File.open(file_path, "r")
            file.read
        rescue IOError
            raise "An error occurred while reading the file."
        ensure
            file.close if file
        end
    end

    def self.file_exist?(file_path)
        if File.exist?(file_path)
            true
        else
            puts "File does not exist."
            false
        end
    end

    def self.is_csv_file?(file_path)
        if File.extname(file_path) == ".csv"
            true
        else
            puts "File does not csv."
            false
        end
    end

    def self.is_csv_file_formatted?(file_content)
        csv_header = file_content.split("\n")[0].strip

        if csv_header == CSV_HEADER
            true
        else
            puts "The CSV file is not in the expected format."
            false
        end
    end

    def self.cluster_students_by_student_code(file_content)
        rows = {}
        
        file_content_array = file_content.split("\n").drop(1)

        file_content_array.each do |file_content_array_item|
            student_code = file_content_array_item.split(",")[0]
            discipline_code = file_content_array_item.split(",")[1]
            course_code = file_content_array_item.split(",")[2]
            grade = file_content_array_item.split(",")[3]
            credit_hours = file_content_array_item.split(",")[4]
            year_semester = file_content_array_item.split(",")[5]
            
            discipline = Discipline.new(discipline_code, year_semester, credit_hours, course_code)
            enrollment = Enrollment.new(student_code, discipline_code, grade)
            student = Student.new(student_code)

            if !rows.has_key?(student_code)
                rows[student_code] = []
            end
            rows[student_code] << [discipline, enrollment, student]
        end

        puts rows
    end
end  