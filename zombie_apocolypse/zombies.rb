class Zombie

# CLASS Variables
  @@horde = []
  @@plague_level = 10
  @@max_speed = 5
  @@max_strength = 8
  @@default_speed = 1
  @@default_strength = 3

  attr_reader :strength, :speed

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

  def self.new_day

      some_die_off
      spawn
      increase_plague_level

  end

  def self.increase_plague_level

    @@plague_level += rand(@@horde.count)

  end

  def self.some_die_off

    rand(0..10).times do

      @@horde.delete_at(rand(@@horde.count))

    end
  end

  def self.deadliest_zombie

    zombie_strength_plus_speed = []
    @@horde.each do |zombie|
      zombie_strength_plus_speed << (zombie.strength + zombie.speed)
    end

    @@horde[zombie_strength_plus_speed.index(zombie_strength_plus_speed.max)]

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

  def encounter

    if outrun_zombie? == true
      return "RUN RUN RUN....You Escaped!!"
    elsif survive_attack == true
      return "YOU SURVIVED!!"
    else
      new_zombie = Zombie.new(rand(@@max_speed), rand(@@max_strength))
      @@horde << new_zombie
      return "Plague!!! You are now a Zombie!"
    end
  end

  def outrun_zombie?
    my_speed = rand(@@max_speed)
    if my_speed > @speed
      return true
    else  return false
    end
  end

  def survive_attack
    if rand(@@max_strength) > @strength
      return true
    else return false
    end
  end

end


# TEST OUTPUT
# p Zombie.spawn
# p Zombie.all
# p Zombie.all.count
#
# p Zombie.spawn
# p Zombie.spawn
#
# puts "**"
#
# Zombie.new_day
# Zombie.new_day
#
# Zombie.all.inspect
#
# zombie1 = Zombie.all[0]
# zombie2 = Zombie.all[1]
# zombie3 = Zombie.all[2]
#
# puts zombie1.encounter
# puts zombie2.encounter
# puts zombie3.encounter
# puts "***"
#
# Zombie.all.inspect
# Zombie.all.count
Zombie.new_day
# Zombie.all.count
#
# puts "***"
# puts zombie1.encounter
# puts zombie2.encounter
# puts zombie3.encounter
# puts "***"

Zombie.spawn
Zombie.spawn
Zombie.spawn
p Zombie.all.count
#
# puts Zombie.increase_plague_level.inspect
# p Zombie.all.count

p Zombie.deadliest_zombie
