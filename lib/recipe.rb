class Recipe
  attr_reader :name, :description, :prep_time, :difficulty
  def initialize(args = {})
    @name = args[:name]
    @description = args[:description]
    @prep_time = args[:prep_time] || "?"
    # @done = args[:done] || false
    args[:done] ? @done = args[:done] : @done = false
    @difficulty = args[:difficulty]
  end

  def mark_done!
    @done = true
  end

  def done?
    if @done == "false" || @done == false
      return false
    else
      return true
    end
  end
end

# class Recipe
#   attr_reader :name, :description
#   def initialize(name: "", description: "", prep_time: 0)
#     @name = name
#     @description = description
#     @prep_time = prep_time
#   end
# end