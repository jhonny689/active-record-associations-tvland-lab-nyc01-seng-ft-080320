class Show < ActiveRecord::Base
    has_many :characters
    has_many :actors, through: :characters
    belongs_to :network

    def actors_list
        self.actors.map do |actor|
            actor.full_name
        end
    end
    
    def build_network(call_letters:)
        self.network = Network.create(call_letters: call_letters)
    end
end