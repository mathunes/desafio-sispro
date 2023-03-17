require_relative "../../lib/models/enrollment"

RSpec.describe Enrollment do
    let(:student_code) { "100" }
    let(:discipline_code) { "SEN00209" }
    let(:grade) { "82" }

    describe ".initialize" do
        it "set and get enrollment attributes" do
            enrollment = described_class.new(student_code, discipline_code, grade)
            expect(enrollment.student_code).to eq(student_code)
            expect(enrollment.discipline_code).to eq(discipline_code)
            expect(enrollment.grade).to eq(grade)
        end
    end
end