class CrCalculatorService
    def self.calculate_cr_by_register_clustered(register)
        total_credit_hours = calculate_total_credit_hours(register)
        sum_of_multiplication_grade_credit_hours = calculate_sum_of_multiplication_grade_credit_hours(register)

        sum_of_multiplication_grade_credit_hours / total_credit_hours
    end

    def self.calculate_total_credit_hours(register)
        register.reduce(0) { |sum, discipline_cursed| sum + discipline_cursed[0].credit_hours.to_i }        
    end

    def self.calculate_sum_of_multiplication_grade_credit_hours(register)
        register.reduce(0) { |sum, discipline_cursed| sum + (discipline_cursed[1].grade.to_i * discipline_cursed[0].credit_hours.to_i) }
    end
end