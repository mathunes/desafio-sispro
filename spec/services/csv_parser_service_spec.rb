require_relative "../../lib/services/csv_parser_service"

RSpec.describe CsvParserService do
    describe ".row_to_objects" do
        let(:valid_row) { "100,SEN00209,4,82,60,20171" }
        let(:invalid_row) { "100,SEN00209,4,,60,20171" }

        context "when row is valid" do
            it "return objects" do
                discipline, enrollment, student = described_class.row_to_objects(valid_row)
                expect(discipline).to be_instance_of(Discipline)
                expect(enrollment).to be_instance_of(Enrollment)
                expect(student).to be_instance_of(Student)

                expect(discipline.discipline_code).to eq("SEN00209")
                expect(discipline.year_semester).to eq("20171")
                expect(discipline.credit_hours).to eq("60")
                expect(discipline.course_code).to eq("4")

                expect(enrollment.student_code).to eq("100")
                expect(enrollment.discipline_code).to eq("SEN00209")
                expect(enrollment.grade).to eq("82")

                expect(student.student_code).to eq("100")
            end
        end

        context "when row has null column" do
            it "throw exception" do
                expect{described_class.row_to_objects(invalid_row)}.to raise_error(ArgumentError)
                expect{described_class.row_to_objects(invalid_row)}.to raise_error.with_message("row with nil value: " + invalid_row)
            end
        end
    end
end