require_relative '../../lib/view/console_view'

RSpec.describe ConsoleView do
    describe ".show_students_cr" do
        let(:cr_by_students) { { 100 => 63, 101 => 82 } }

        context "when given a students hash" do
            it "show students CR" do
                expect { described_class.show_students_cr(cr_by_students) }
                .to output("------- O CR dos alunos é: --------\n100  -  63\n101  -  82\n-----------------------------------\n")
                .to_stdout
            end
        end
    end

    describe ".show_courses_cr" do
        let(:cr_by_courses) { { 4 => 49, 56 => 67 } }

        context "when given a course hash" do
            it "show courses CR" do
                expect { described_class.show_courses_cr(cr_by_courses) }
                .to output("----- Média de CR dos cursos ------\n4    -  49\n56   -  67\n-----------------------------------\n")
                .to_stdout
            end
        end
    end
end