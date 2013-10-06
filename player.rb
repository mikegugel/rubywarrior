class Player

  def play_turn(warrior)

    @hp ||= 20
    @current_dir ||= :forward
    @action = rest!

    @look = {
      :forward => warrior.look(:forward),
      :backward => warrior.look(:backward),
      :left => warrior.look(:left),
      :right => warrior.look(:right)
    }

    puts "Forward: #{@look[:forward].join(", ")}"
    puts "Backward: #{@look[:backward].join(", ")}"

    # check_hp(warrior)
    # check_look(warrior)

    # @action
    # warrior.shoot!
    # Save health for comparison next turn
    @hp = warrior.health
  end

  def check_hp(warrior)
    if warrior.health >= @hp && warrior.health < 20
      @action = warrior.rest!
      return
   elsif warrior.health < @hp && warrior.health < 10
     change_dir
     @action = warrior.walk! @current_dir
     change_dir
     return
   end
  end

  def check_look(warrior)
    if @look[:forward].to_s.include?('Wizard')
      @action = warrior.shoot!
      return
    elsif @look[:forward].to_s.first == "Captive"
      @action = warrior.rescue! @current_dir
      return
    else
      @action = warrior.attack! @current_dir
    end
  end

  def change_dir
    if @current_dir  == :backward
      @current_dir = :forward
    elsif @current_dir == :forward
      @current_dir = :backward
    end
  end

end


