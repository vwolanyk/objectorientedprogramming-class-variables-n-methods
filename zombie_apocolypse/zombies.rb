class Zombie

# CLASS Variables
  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3

#         CLASS METHODS

  def self.all
    @@horde
  end

  def self.spawn

    num_spawned = rand(@@plague_level)
    num_spawned.times do
      new_zombie = Zombie.new(rand(@@max_speed), rand(@@max_strength))
      @@horde << new_zombie
    end

  end

#         INSTANCE METHODS

  # Initialize Zombie Method
  def initialize(speed, strength)

      if speed > @@max_speed
        @speed = @@default_speed
      else @speed = speed
      end

      if strength > @@max_strength
        @strength = @@default_strength
      else
        @strength = strength
      end
  end



end

p Zombie.spawn
p Zombie.all
