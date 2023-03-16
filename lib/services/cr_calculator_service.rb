class CrCalculator
    def self.calculate_cr_by_register_clustered(register)
        total_credit_hours = 0
        sum_of_multiplication_grade_credit_hours = 0

        register.each do |discipline_cursed|
            discipline = discipline_cursed[0]
            enrollment = discipline_cursed[1]
            student = discipline_cursed[2]

            total_credit_hours += discipline.credit_hours.to_i

            sum_of_multiplication_grade_credit_hours += enrollment.grade.to_i * discipline.credit_hours.to_i
        end

        sum_of_multiplication_grade_credit_hours / total_credit_hours
    end
end