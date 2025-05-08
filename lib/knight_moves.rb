# knight_moves.rb

module KnightMoves
  def self.valid_moves(position)
    knight_offsets = [
      [1, 2], [2, 1], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]
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
end