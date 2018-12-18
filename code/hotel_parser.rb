require "yaml"
class HotelParser
  # Implement a method parse the contents of a YAML file and return
  # an object whose values are accessible using the [] operator or method calls
  #
  # Note: Use of the YAML library is fine (encouraged, even) but please don't
  #       use any third-party gems that enable the required functionality.

  # Creates accessor so hotels can be accessed using . notation
  attr_accessor  :hotels

  def initialize(yaml_data)
    # Initializes empty hotel array for each HotelParser Instance
      @hotels = []
    # Parses through data and creates a new hotel object from yaml data
    yaml_data["hotels"].each do |hotel|
      @hotel = Hotel.new(hotel)
      # Pushes newly created hotel into HotelParser hotel Array
      @hotels << @hotel
    end
  end

  def [](key)
    # defines [] method so can access hotels using [] notation
    if key == "hotels"
      # HotelParser instance returns hotels array when called with ["hotels"] method
      self.hotels
    end

  end


  def self.parse(filename)
    # Loads YAML file and imports data
    data = YAML.load(File.open(filename))
    # Initialize new HotelParser Object with data
    HotelParser.new(data)
  end
end

class Hotel
  # Creates accessor so rooms can be accessed using . notation
  attr_accessor :rooms

  def initialize(hotel_data)
    # Initializes empty room array for each Hotel Instance
    @rooms = []
    @name = hotel_data["name"]
    # Parses through data and creates a new room object from yaml data
    hotel_data["rooms"].each do |room|
      # Pushes newly created room into Hotel room Array
      @rooms << Room.new(room)
    end
  end

  def [](key)
    # defines [] method so can access rooms using [] notation
    if key == "rooms"
      # Hotel instance returns rooms array when called with ["rooms"] method
      self.rooms
    end
  end


end

class Room
  # Creates accessor so amenities can be accessed using . notation
  attr_accessor :amenities
  def initialize(room_data)
    # Initializes empty amenities array for each Room Instance
    @amenities = []
    @name = room_data["name"]
    room_data["amenities"].each do |amenity|
      # Pushes Amenties data into amenties array
      @amenities << amenity
    end
  end
  # defines [] method so can access amenties using [] notation
  def [](key)
      # room instance returns amenties array when called with ["amenties"] method
    if key == "amenities"
      self.amenities
    end
  end
end
