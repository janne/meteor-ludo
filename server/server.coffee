Meteor.startup ->
  for player_id in [0..3]
    color = COLORS[player_id]
    player = Player.insert {color: color}
    for num in [0..3]
      Piece.insert { player: player, square: null }
    for num in [0..PLAYER_DIFF-1]
      Square.insert {color: color}
