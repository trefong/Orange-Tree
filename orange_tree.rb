class OrangeTree

  attr_accessor :age, :height
  attr_reader :oranges

  def initialize(age = 0, height, num_oranges)
    @age = age
    @height = height
    @oranges = []
    num_oranges.times do
      @oranges << Orange.new
    end

  end

  def pass_growing_season
    @oranges = []
    @age += 1
    if self.mature?
      rand(100..300).times do
        @oranges << Orange.new
      end
    end

    if @height < 25
      @height += 2.5
    end

  end

  # Returns true if the tree is old enough to bear fruit (6), false otherwise
  def mature?
    @age >= 6
  end

  # Returns +true+ if there are any oranges on the tree, +false+ otherwise
  def has_oranges?
    @oranges.size > 0
  end

  # Returns an Orange if there are any
  # Raises a NoOrangesError otherwise
  def pick_an_orange
    raise NoOrangesError, "This tree has no oranges" unless self.has_oranges?

    # orange-picking logic goes here
    @oranges.pop

  end

  def dead?
    @age >= 100
  end

end
