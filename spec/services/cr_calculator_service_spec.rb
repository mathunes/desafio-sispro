require_relative "../../lib/services/cr_calculator_service"
require_relative "../../lib/models/discipline"
require_relative "../../lib/models/enrollment"
require_relative "../../lib/models/student"

RSpec.describe CrCalculatorService do
    describe ".calculate_cr_by_register_clustered" do
        let(:discipline_1) { Discipline.new("SEN00209", "20171", "60", "4") }
        let(:discipline_2) { Discipline.new("MPS00012", "20181", "30", "56") }
        let(:discipline_3) { Discipline.new("SGE00014", "20171", "30", "4") }

        let(:enrollment_1) { Enrollment.new("100", "SEN00209", "82") }
        let(:enrollment_2) { Enrollment.new("100", "MPS00012", "90") }
        let(:enrollment_3) { Enrollment.new("100", "SGE00014", "0") }

        let(:student) { Student.new("100") }

        let(:registers_1) { [[discipline_1, enrollment_1, student]] }
        let(:registers_2) { [[discipline_1, enrollment_1, student], [discipline_2, enrollment_2, student]] }
        let(:registers_3) { [[discipline_3, enrollment_3, student]] }

        let(:registers_cluster_1) { { student.student_code => registers_1 } }
        let(:registers_cluster_2) { { student.student_code => registers_2 } }
        let(:registers_cluster_3) { { student.student_code => registers_3 } }

        context "when gives one register clustered with one enrollment" do
            it "calculate cr" do
                # ((82 * 60)) / (60) = 82
                expect(82).to eq(described_class.calculate_cr_by_register_clustered(registers_cluster_1["100"]))
            end
        end

        context "when gives one register clustered with two enrollment" do
            it "calculate cr" do
                # ((82 * 60) + (90 * 30)) / (60 + 30) = 84
                expect(84).to eq(described_class.calculate_cr_by_register_clustered(registers_cluster_2["100"]))
            end
        end

        context "when gives one register clustered with 0 grades in enrollments" do
            it "calculate cr" do
                # ((0 * 60)) / (60) = 0
                expect(0).to eq(described_class.calculate_cr_by_register_clustered(registers_cluster_3["100"]))
            end
        end
    end
end