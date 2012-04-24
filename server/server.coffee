Meteor.startup ->
  Player.remove {}
  Square.remove {}
  Piece.remove {}
  for player_id in [0..3]
    color = COLORS[player_id]

    pieces = []
    squares = []
    for num in [0..PLAYER_DIFF-1]
      y = player_id * 40 + num * 40
      x = num * 40
      piece = if num == 5 then Piece.findOne(Piece.insert(color:color)) else null
      pieces.push(piece) if piece
      square = Square.findOne Square.insert({piece:piece, color:color})
      squares.push(square)

    for i in [0..OUTER_LENGTH]
      Square.update(squares[i], $set: { left:player_id * 40 + i*40, top:i*40})

    Player.findOne Player.insert({color:color, pieces:pieces })
