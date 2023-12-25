require "redis"
require "ipaddr"
require "zlib"
require "open-uri"
class Geolocation
  class << self

    def download_data
      url = "https://ipinfo.io/data/free/country.csv.gz?token=#{ENV['IP_INFO_TOKEN']}"
      file_path = Rails.root.join("public/country.json.gz").to_s
      URI.open(url) do |remote_file|
        File.open(file_path, "wb") do |file|
          file.write(remote_file.read)
        end
      end
    end
    def load_data

      # URL에서 파일 다운로드


      data = []
      # 다운로드한 파일 처리
      Zlib::GzipReader.open(file_path) do |gz|
        gz.each_line do |line|
          record = JSON.parse(line)
          data << record
        end
      end
      puts "data read done"

    end
  end
end