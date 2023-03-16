class ConsoleView
    def self.show_students_cr(cr_by_students)
        puts "------- O CR dos alunos é: --------"
        cr_by_students.each do |student_code, student_cr|
            printf("%-4d - %3d\n", student_code, student_cr)
        end
        puts "-----------------------------------"
    end

    def self.show_courses_cr(cr_by_courses)
        puts "----- Média de CR dos cursos ------"
        cr_by_courses.each do |course_code, course_cr|
            printf("%-4d - %3d\n", course_code, course_cr)
        end
        puts "-----------------------------------"
    end
end