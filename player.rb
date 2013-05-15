class Player


  def play_turn(warrior)

    @hp ||= 20

    if warrior.health >= @hp && warrior.health < 14 
      warrior.rest!
      return
    end


    if warrior.feel.captive?
      warrior.rescue!
      return
    end

    warrior.feel.empty? ? warrior.walk! : warrior.attack!

    @hp = warrior.health
  end
end
