Template.board.squares = ->
  Square.find()

Template.square.events =
  'click': ->
    console.log "Square #{this._id}"

Template.piece.events =
  'click': ->
    console.log "Piece #{this._id}"
