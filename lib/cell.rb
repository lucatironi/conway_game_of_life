# A Cell that is not alive
class DeadCell
  def alive?
    false
  end

  def evolve!(neighbors)
    if neighbors == 3
      LiveCell.new
    else
      DeadCell.new
    end
  end
end

# A Cell that is alive
class LiveCell
  def alive?
    true
  end

  def evolve!(neighbors)
    if [2, 3].include?(neighbors)
      LiveCell.new
    else
      DeadCell.new
    end
  end
end
