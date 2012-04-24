Meteor.startup ->
  Player.remove {}
  Square.remove {}
  Piece.remove {}
  squares = []
  for player_id in [0..3]
    color = COLORS[player_id]
    pieces = []
    for num in [0..PLAYER_DIFF-1]
      y = player_id * 40 + num * 40
      x = num * 40
      piece = if num == 0 then Piece.findOne(Piece.insert(color:color)) else null
      pieces.push(piece) if piece
      square = Square.findOne Square.insert({piece:piece, color:color})
      squares.push(square)

    Player.findOne Player.insert({color:color, pieces:pieces })

  i = 0
  # Blue
  for top in [0..HOME_LENGTH]
    left = HOME_LENGTH+2
    Square.update(squares[i++], $set: { left:left*SPACING, top:top*SPACING})
  for left in [HOME_LENGTH+3..2*HOME_LENGTH+2]
    top = HOME_LENGTH
    Square.update(squares[i++], $set: { left:left*SPACING, top:top*SPACING})
  Square.update(squares[i++], $set: { left:(2*HOME_LENGTH+2)*SPACING, top:(HOME_LENGTH+1)*SPACING})

  # Green
  for left in [2*HOME_LENGTH+2..HOME_LENGTH+2]
    top = HOME_LENGTH+2
    Square.update(squares[i++], $set: { left:left*SPACING, top:top*SPACING})
  for top in [HOME_LENGTH+3..2*HOME_LENGTH+2]
    left = HOME_LENGTH+2
    Square.update(squares[i++], $set: { left:left*SPACING, top:top*SPACING})
  Square.update(squares[i++], $set: { left:(HOME_LENGTH+1)*SPACING, top:(2*HOME_LENGTH+2)*SPACING})

  # Yellow
  for top in [2*HOME_LENGTH+2..HOME_LENGTH+2]
    left = HOME_LENGTH
    Square.update(squares[i++], $set: { left:left*SPACING, top:top*SPACING})
  for left in [HOME_LENGTH-1..0]
    top = HOME_LENGTH+2
    Square.update(squares[i++], $set: { left:left*SPACING, top:top*SPACING})
  Square.update(squares[i++], $set: { left:0, top:(HOME_LENGTH+1)*SPACING})

  # Red
  for left in [0..HOME_LENGTH]
    top = HOME_LENGTH
    Square.update(squares[i++], $set: { left:left*SPACING, top:top*SPACING})
  for top in [HOME_LENGTH-1..0]
    left = HOME_LENGTH
    Square.update(squares[i++], $set: { left:left*SPACING, top:top*SPACING})
  Square.update(squares[i++], $set: { left:(HOME_LENGTH+1)*SPACING, top:0})
