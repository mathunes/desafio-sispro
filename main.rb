require_relative 'lib/services/file_service'
require_relative 'lib/services/cr_calculator_service'

file_path = ARGV[0]

if file_path.nil?
    puts "Please provide the path to a CSV file as an argument."
    exit
end

if FileService.file_exist?(file_path)
    if FileService.is_csv_file?(file_path)
        begin
            file_content = FileService.read_file(file_path)
        rescue => e
            puts e.message
            exit
        end

        if FileService.is_csv_file_formatted?(file_content)
            cr_by_students = []
            cr_by_courses = []

            registers_clustered_by_student_code = FileService.cluster_registers_by_student_code(file_content)

            registers_clustered_by_student_code.each do |student_code, cluster|
                cr_by_student = {student_code => CrCalculator.calculate_cr_by_register_clustered(cluster)}
                cr_by_students << cr_by_student
            end

            registers_clustered_by_course_code = FileService.cluster_registers_by_course_code(file_content)

            registers_clustered_by_course_code.each do |course_code, cluster|
                cr_by_course = {course_code => CrCalculator.calculate_cr_by_register_clustered(cluster)}
                cr_by_courses << cr_by_course
            end

            puts cr_by_students.to_s
            puts "=========="
            puts cr_by_courses.to_s
        end
    end
end