# knight_moves.rb

module KnightMoves
  def self.valid_moves(position)
    knight_offsets = [
      [1, 2], [2, 1], [2, -1], [1, -2],
      [-1, -2], [-2, -1], [-2, 1], [-1, 2]
    ]

    valid_moves = []

    knight_offsets.each do |dx, dy|
      new_x = position[0] + dx
      new_y = position[1] + dy

      if new_x.between?(0, 7) && new_y.between?(0, 7)
        valid_moves << [new_x, new_y]
      end
    end

    return valid_moves
  end

  def self.knight_moves(start, target)
    queue = [[start]]
    visited = [start]

    # puts "Queue: #{queue}"
    # puts "Visited: #{visited}"

    while !queue.empty?
      current_path = queue.shift
      current_square = current_path.last

      if current_square == target
        moves = current_path.length - 1
        puts "You made it in #{moves} move(s)! Here's your path:"
        current_path.each { |step| puts " #{step}" }
        return current_path
      else
        valid_moves(current_square).each do |move|
          next if visited.include?(move)

          visited << move
          new_path = current_path + [move]
          queue << new_path
        end
      end
    end
  end
end