class Player


  def change_dir
    if @current_dir  == :backward
      @current_dir = :forward
    elsif @current_dir == :forward
      @current_dir = :backward
    end
  end


  def move(warrior)

    if warrior.health >= @hp && warrior.health < 20
      warrior.rest!
      return
    elsif warrior.health < @hp && warrior.health < 10
      change_dir
      warrior.walk! @current_dir
      change_dir
      return
    end


    if @feels[@current_dir] == "wall"
      warrior.pivot!
    elsif @feels[@current_dir] == "Captive"
      warrior.rescue! @current_dir
      return
    elsif @feels[@current_dir] == "nothing"
      warrior.walk! @current_dir
    else
      warrior.attack! @current_dir
    end

  end


  def play_turn(warrior)

    @hp ||= 20
    @current_dir ||= :forward
    @feels = {
      :forward => warrior.feel(:forward).to_s,
      :backward => warrior.feel(:backward).to_s,
      :left => warrior.feel(:left).to_s,
      :right => warrior.feel(:right).to_s
    }

    move(warrior)

    # Save health for comparison next turn
    @hp = warrior.health
  end
end
