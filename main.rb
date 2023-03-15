require_relative 'lib/services/file_service'

file_path = ARGV[0]

if file_path != nil
    if FileService.file_exist?(file_path)
        if FileService.is_csv_file?(file_path)
            file_content = FileService.read_file(file_path)
            if FileService.is_csv_file_formatted?(file_content)
                puts file_content
            end
        end
    end
end