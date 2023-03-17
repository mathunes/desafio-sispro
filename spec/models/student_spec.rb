require_relative "../../lib/models/student"

RSpec.describe Student do
    describe ".initialize" do
        it "set and get student attribute" do
            student = described_class.new("100")
            expect(student.student_code).to eq("100")
        end
    end
end