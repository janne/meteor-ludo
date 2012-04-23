Template.board.column = -> [0..SIDE-1]

Meteor.startup ->
  square_i = 0
  squares = Square.find().fetch()
  for col in [HOME_SQUARES+1..HOME_SQUARES+2]
    for row in [0..HOME_SQUARES]
      square = squares[square_i++]
#     $('table#board tr#row_' + row + ' td#col_' + col).html(Meteor.ui.render -> Template.square({square: square}))
      $('table#board tr#row_' + row + ' td#col_' + col).html(Template.square({square: square}))
