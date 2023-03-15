class FileService
    CSV_HEADER = "MATRICULA,COD_DISCIPLINA,COD_CURSO,NOTA,CARGA_HORARIA,ANO_SEMESTRE"

    def self.read_file(file_path)
        File.read(file_path)
    end

    def self.file_exist?(file_path)
        if File.exist?(file_path)
            true
        else
            puts "File does not exist."
            false
        end
    end

    def self.is_csv_file?(file_path)
        if File.extname(file_path) == ".csv"
            true
        else
            puts "File does not csv."
            false
        end
    end

    def self.is_csv_file_formatted?(file_content)
        csv_header = file_content.split("\n")[0].strip
        if csv_header == CSV_HEADER
            true
        else
            puts "The CSV file is not in the expected format."
            false
        end
    end
end  