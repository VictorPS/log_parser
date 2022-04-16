class PageVisit
  attr_reader :webpage, :device_ip

  def initialize(webpage:, device_ip:)
    @webpage = webpage
    @device_ip = device_ip
  end
end
