class LogParser
  attr_reader :log_path

  def initialize(log_path)
    @log_path = log_path
  end

  def ordered_list
    visits = Hash.new(0)

    File.readlines(log_path).each do |line|
      webpage, _device_ip = line.split(' ')
      visits[webpage] += 1
    end

    visits.sort_by { |_k, v| -v }
  end
end
