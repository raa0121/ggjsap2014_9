require 'json'

class Event
  def initialize(json)
    @json = json
  end
  def getCardsData
    data = JSON.parse(@json)
    data['data']['cards']
  end
  def getCardsData(json)
    data = JSON.parse(json)
    data['data']['cards']
  end
end
