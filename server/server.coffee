Meteor.startup ->
  Player.remove {}
  Square.remove {}
  Piece.remove {}

  i = 0

  color = 'blue'
  for top in [0..HOME_LENGTH]
    left = HOME_LENGTH+2
    Square.insert(color:color, left:left*SPACING, top:top*SPACING, i:i++)
  for left in [HOME_LENGTH+3..2*HOME_LENGTH+2]
    top = HOME_LENGTH
    Square.insert(color:color, left:left*SPACING, top:top*SPACING, i:i++)
  left = (2*HOME_LENGTH+2)
  top = (HOME_LENGTH+1)
  Square.insert(color:color, left:left*SPACING, top:top*SPACING, i:i++)

  color = 'green'
  for left in [2*HOME_LENGTH+2..HOME_LENGTH+2]
    top = HOME_LENGTH+2
    Square.insert(color:color, left:left*SPACING, top:top*SPACING, i:i++)
  for top in [HOME_LENGTH+3..2*HOME_LENGTH+2]
    left = HOME_LENGTH+2
    Square.insert(color:color, left:left*SPACING, top:top*SPACING, i:i++)
  left = HOME_LENGTH+1
  top = 2*HOME_LENGTH+2
  Square.insert(color:color, left:left*SPACING, top:top*SPACING, i:i++)

  color = 'yellow'
  for top in [2*HOME_LENGTH+2..HOME_LENGTH+2]
    left = HOME_LENGTH
    Square.insert(color:color, left:left*SPACING, top:top*SPACING, i:i++)
  for left in [HOME_LENGTH-1..0]
    top = HOME_LENGTH+2
    Square.insert(color:color, left:left*SPACING, top:top*SPACING, i:i++)
  left = 0
  top = HOME_LENGTH+1
  Square.insert(color:color, left:left*SPACING, top:top*SPACING, i:i++)

  color = 'red'
  for left in [0..HOME_LENGTH]
    top = HOME_LENGTH
    Square.insert(color:color, left:left*SPACING, top:top*SPACING, i:i++)
  for top in [HOME_LENGTH-1..0]
    left = HOME_LENGTH
    Square.insert(color:color, left:left*SPACING, top:top*SPACING, i:i++)
  left = HOME_LENGTH+1
  top = 0
  Square.insert(color:color, left:left*SPACING, top:top*SPACING, i:i++)

  squares = Square.find().fetch()
  for player_id in [0..3]
    color = COLORS[player_id]
    square = squares[player_id * PLAYER_DIFF]
    piece = Piece.findOne(Piece.insert(color:color))
    Square.update(square._id, $set: { piece:piece })
    Player.insert(color:color, pieces:[piece])
