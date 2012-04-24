Template.board.squares = ->
  Square.find()

Template.square.events =
  'click': ->
    if this.piece
      move_to_square = Square.findOne(i:((this.i + 1) % OUTER_LENGTH))
      Square.update(this._id, $set: { piece: null })
      Square.update(move_to_square._id, $set: { piece:this.piece })
