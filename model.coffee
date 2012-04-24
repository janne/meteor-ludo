@HOME_SQUARES = 4
@PLAYER_DIFF = 2 + 2 * HOME_SQUARES
@SIDE = 3 + 2 * HOME_SQUARES
# @OUTER_LENGTH = 8 + 8 * HOME_SQUARES
# @TOTAL_LENGTH = OUTER_LENGTH + HOME_SQUARES

@COLORS = ['red', 'green', 'blue', 'yellow']

# { color, pieces }
@Square = new Meteor.Collection('square')

# { color, start_square, pieces }
@Player = new Meteor.Collection('player')

# { color }
@Piece = new Meteor.Collection('piece')
