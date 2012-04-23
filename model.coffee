@HOME_SQUARES = 4
@PLAYER_DIFF = 2 + 2 * HOME_SQUARES
@SIDE = 3 + 2 * HOME_SQUARES
# @OUTER_LENGTH = 8 + 8 * HOME_SQUARES
# @TOTAL_LENGTH = OUTER_LENGTH + HOME_SQUARES

@COLORS = ['#f00', '#0f0', '#00f', '#ff0']

# { color }
@Square = new Meteor.Collection('square')

# { color, start_square }
@Player = new Meteor.Collection('player')

# { player, square }
@Piece = new Meteor.Collection('piece')
