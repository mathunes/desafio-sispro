require_relative "../../lib/services/file_service"

RSpec.describe FileService do
    let(:valid_file_path_1) { "spec/services/assets/test.csv" }
    let(:valid_file_path_2) { "spec/services/assets/test2.csv" }
    let(:invalid_file_path_1) { "spec/services/noassets/test.txt" }

    describe ".read_file" do        
        let(:expected_content) { "MATRICULA,COD_DISCIPLINA,COD_CURSO,NOTA,CARGA_HORARIA,ANO_SEMESTRE\r\n100,SEN00209,4,82,60,20171" }

        context "when file exists" do
            it "return file content as string" do
                expect(expected_content).to eq(described_class.read_file(valid_file_path_1))
            end
        end

        context "when file does not exists" do
            it "raises an error" do
                expect{described_class.read_file(invalid_file_path_1)}.to raise_error(Errno::ENOENT)
            end
        end
    end

    describe ".file_exist?" do
        context "when file exists" do
            it "return true" do
                expect(described_class.file_exist?(valid_file_path_1)).to eq(true)
            end
        end

        context "when file does not exists" do
            it "return false" do
                expect(described_class.file_exist?(invalid_file_path_1)).to eq(false)
            end
        end
    end

    describe ".is_csv_file?" do
        context "when is csv" do
            it "return true" do
                expect(described_class.is_csv_file?(valid_file_path_1)).to eq(true)
            end
        end

        context "when is not csv" do
            it "return false" do
                expect(described_class.is_csv_file?(invalid_file_path_1)).to eq(false)
            end
        end
    end

    describe ".is_csv_file_formatted?" do
        context "when csv is formatted" do
            it "return true" do
                expect(described_class.is_csv_file_formatted?(described_class.read_file(valid_file_path_1))).to eq(true)
            end
        end

        context "when csv is not formatted" do
            it "return false" do
                expect(described_class.is_csv_file_formatted?(described_class.read_file(valid_file_path_2))).to eq(false)
            end
        end
    end

    describe ".cluster_registers_by_student_code" do
        let(:valid_file_content) { "MATRICULA,COD_DISCIPLINA,COD_CURSO,NOTA,CARGA_HORARIA,ANO_SEMESTRE\r\n100,SEN00209,4,82,60,20171\r\n101,SEN00209,4,90,60,20171" }
        let(:expected_clusters) { {
            "100" => [[Discipline.new("SEN00209", "20171", "60", "4"), Enrollment.new("100", "SEN00209", "82"), Student.new("100")]],
            "101" => [[Discipline.new("SEN00209", "20171", "60", "4"), Enrollment.new("101", "SEN00209", "90"), Student.new("101")]]
        } }

        context "when file content is valid" do
            it "clusters the registers by student code" do
                expect(described_class.cluster_registers_by_student_code(valid_file_content).keys).to eq(expected_clusters.keys)

                expect(described_class.cluster_registers_by_student_code(valid_file_content)["100"][0][0].discipline_code).to eq(expected_clusters["100"][0][0].discipline_code)
                expect(described_class.cluster_registers_by_student_code(valid_file_content)["100"][0][2].student_code).to eq(expected_clusters["100"][0][2].student_code)

                expect(described_class.cluster_registers_by_student_code(valid_file_content)["101"][0][0].discipline_code).to eq(expected_clusters["101"][0][0].discipline_code)
                expect(described_class.cluster_registers_by_student_code(valid_file_content)["101"][0][2].student_code).to eq(expected_clusters["101"][0][2].student_code)
            end
        end
    end

    describe ".cluster_registers_by_course_code" do
        let(:valid_file_content) { "MATRICULA,COD_DISCIPLINA,COD_CURSO,NOTA,CARGA_HORARIA,ANO_SEMESTRE\r\n100,SEN00209,4,82,60,20171\r\n101,SEN00345,5,90,60,20171\r\n102,SEN00209,4,70,60,20172\r\n103,SEN00456,5,85,60,20172" }
        let(:expected_clusters) { {
            "4" => [[Discipline.new("SEN00209", "20171", "60", "4"), Enrollment.new("100", "SEN00209", "82"), Student.new("100")]],
            "5" => [[Discipline.new("SEN00345", "20171", "60", "5"), Enrollment.new("101", "SEN00345", "90"), Student.new("101")]]
        } }

        context "when file content is valid" do
            it "clusters the registers by course code" do
                expect(described_class.cluster_registers_by_course_code(valid_file_content).keys).to eq(expected_clusters.keys)

                expect(described_class.cluster_registers_by_course_code(valid_file_content)["4"][0][0].discipline_code).to eq(expected_clusters["4"][0][0].discipline_code)
                expect(described_class.cluster_registers_by_course_code(valid_file_content)["4"][0][2].student_code).to eq(expected_clusters["4"][0][2].student_code)

                expect(described_class.cluster_registers_by_course_code(valid_file_content)["5"][0][0].discipline_code).to eq(expected_clusters["5"][0][0].discipline_code)
                expect(described_class.cluster_registers_by_course_code(valid_file_content)["5"][0][2].student_code).to eq(expected_clusters["5"][0][2].student_code)
            end
        end
    end
end