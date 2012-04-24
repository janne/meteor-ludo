@HOME_LENGTH = 4
@PLAYER_DIFF = 2 + 2 * HOME_LENGTH
@SIDE = 3 + 2 * HOME_LENGTH
@OUTER_LENGTH = 8 + 8 * HOME_LENGTH
@SPACING = 40

@COLORS = ['blue', 'green', 'yellow', 'red']

# { color, pieces }
@Square = new Meteor.Collection('square')

# { color, start_square, pieces }
@Player = new Meteor.Collection('player')

# { color }
@Piece = new Meteor.Collection('piece')
