# see INTERNALS.md for comment symbols
module HotelBeds
  module Parser
    class AvailableModalityGrouper
      attr_accessor :requested_rooms, :response_rooms
      private :requested_rooms=, :response_rooms=

      def initialize(requested_rooms, response_rooms)
        self.requested_rooms = requested_rooms
        self.response_rooms = response_rooms
        freeze
      end

      def groups
        combinations = build_combinations(room_options_grouped_by_occupants)
        unique_combinations(expand_combinations(combinations))
      end

      private
      def unique_combinations(combinations)
        combinations.uniq { |r| r.sort_by(&:id).map(&:id) }
      end

      def expand_combinations(combinations)
        combinations.map do |rooms|
          rooms.each_with_object(Array.new) do |room, result|
            # get an array of all the child ages
            child_ages = requested_rooms_child_ages_by_occupants.fetch(occupant_key(room))
            1.upto(room.room_count) do |i|
              result << room.dup.tap do |r|
                r.room_count = 1
                r.child_ages = child_ages.pop
              end
            end
          end
        end
      end

      # returns an array of room combinations for all rooms
      def build_combinations(combinations)
        head, *rest = combinations
        Array(head).product(*rest)
      end

      # returns a array of arrays, each contains available rooms for a given
      # room occupancy
      def room_options_grouped_by_occupants
        requested_room_count_by_occupants.each_with_object(Array.new) do |(key, count), result|
          result << response_rooms_by_occupants.fetch(key).select do |room|
            room.room_count == count
          end
        end
      rescue KeyError => e
        Array.new
      end

      # returns a hash of OK => [Integer]
      def requested_rooms_child_ages_by_occupants
        requested_rooms.each_with_object(Hash.new) do |room, result|
          key = occupant_key(room)
          result[key] ||= Array.new
          result[key] += room.child_ages
        end
      end

      # returns a hash of OK => [RR]
      def requested_rooms_by_occupants
        requested_rooms.each_with_object(Hash.new) do |room, result|
          key = occupant_key(room)
          result[key] ||= Array.new
          result[key] << room
        end
      end

      # returns a hash of OK => 1 (count)
      def requested_room_count_by_occupants
        requested_rooms_by_occupants.each_with_object(Hash.new) do |(key, rooms), result|
          result[key] = rooms.size
        end
      end

      # returns a hash of OK => [AvailableRoom, AvailableRoom, AvailableRoom]
      def response_rooms_by_occupants
        response_rooms.each_with_object(Hash.new) do |room, result|
          key = occupant_key(room)
          result[key] ||= Array.new
          result[key].push(room)
        end
      end

      # returns an OK for a given room
      def occupant_key(room)
        {
          adult_count: room.adult_count,
          child_count: room.child_count
        }
      end
    end
  end
end
