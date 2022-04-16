class PageVisit
  attr_reader :webpage, :device_ip

  def initialize(webpage:, device_ip:)
    @webpage = webpage
    @device_ip = device_ip
  end

  # Overwriting the #eql? and #hash methods so different PageVisit objects
  # are removed when using Array#uniq method
  def eql?(other)
    webpage == other.webpage &&
      device_ip == other.device_ip
  end

  def hash
    [webpage, device_ip].hash
  end
end
