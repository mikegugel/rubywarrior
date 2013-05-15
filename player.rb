class Player
  def play_turn(warrior)
    if warrior.feel.empty?
      warrior.walk!
    elsif
      warrior.attack!
    end

  end
end
