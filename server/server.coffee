Meteor.startup ->
  Player.remove {}
  Square.remove {}
  Piece.remove {}
  for player_id in [0..3]
    color = COLORS[player_id]

    player = Player.findOne Player.insert({color: color})

    for num in [0..PLAYER_DIFF-1]
      y = player_id * 40 + num * 40
      x = num * 40
      piece = if num == 5 then Piece.findOne(Piece.insert(color:color)) else null
      square = Square.findOne Square.insert({piece:piece, color:color, left:x, top:y})

  # Square.find().forEach ->
  #   console.log(this)
  # square_i = 0
  # console.log("LENGTH #{squares.length}")
  # for col in [HOME_SQUARES+1..HOME_SQUARES+2]
  #   for row in [0..HOME_SQUARES]
  #     square = squares[square_i++]
  #    $('table#board tr#row_' + row + ' td#col_' + col).html(Meteor.ui.render -> Template.square({square: square}))
