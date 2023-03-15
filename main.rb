require_relative 'lib/services/file_service'

file_path = ARGV[0]

if file_path.nil?
    puts "Please provide the path to a CSV file as an argument."
    exit
end

if FileService.file_exist?(file_path)
    if FileService.is_csv_file?(file_path)
        begin
            file_content = FileService.read_file(file_path)
        rescue => e
            puts e.message
            exit
        end
        
        if FileService.is_csv_file_formatted?(file_content)
            puts file_content
        end
    end
end