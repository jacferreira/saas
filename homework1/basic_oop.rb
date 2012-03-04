class Dessert

  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  attr_accessor :name
  attr_accessor :calories

  def healthy?
    return @calories < 200 ? true : false
  end

  def delicious?
    return self.is_a?(Dessert)
  end
end

class JellyBean < Dessert

  def initialize(name, calories, flavor)
    @name = name
    @calories = calories
    @flavor = flavor
  end

  attr_accessor :flavor

  def delicious?
    if @flavor == "black licorice"
      return false
    else
      return super
    end
  end
end
