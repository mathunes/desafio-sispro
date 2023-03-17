require_relative "../../lib/models/discipline"

RSpec.describe Discipline do
    let(:discipline_code) { "SEN00209" }
    let(:year_semester) { "20171" }
    let(:credit_hours) { "60" }
    let(:course_code) { "4" }

    describe ".initilize" do
        it "get and set discipline attributes" do
            discipline = described_class.new(discipline_code, year_semester, credit_hours, course_code)
            expect(discipline.discipline_code).to eq(discipline_code)
            expect(discipline.year_semester).to eq(year_semester)
            expect(discipline.credit_hours).to eq(credit_hours)
            expect(discipline.course_code).to eq(course_code)
        end
    end
end