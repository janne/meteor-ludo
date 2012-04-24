Template.board.squares = ->
  Square.find()

Template.square.events =
  'click': ->
    if this.piece
      squares = (square._id for square in Square.find().fetch())
      index = squares.indexOf(this._id)
      move_to_square = squares[(index + 1) % OUTER_LENGTH]
      Square.update(this._id, $set: { piece: null })
      Square.update(move_to_square, $set: { piece:this.piece })
