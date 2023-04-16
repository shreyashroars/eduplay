import 'game_state.dart';

class LevelData {
  /// Test Level: used for testing UI, cannot win
  static testLevel() => [
        Piece(0, label: '🧠', width: 2, height: 2, x: 2, y: 0),
        Piece(1, label: 'Cage', width: 3, height: 1, x: 1, y: 3),
        Piece(2, label: 'Cage', width: 1, height: 4, x: 0, y: 0),
        Piece(6, label: 'Cage', width: 1, height: 1, x: 0, y: 4),
        Piece(7, label: 'Cage', width: 1, height: 1, x: 3, y: 4),
      ];

  /// Level 1: a trivial level that can be solved in 3 moves
  static level1() => [
        Piece(0, label: '🧠', width: 2, height: 2, x: 1, y: 2),
        Piece(1, label: '😓', width: 1, height: 2, x: 0, y: 0),
        Piece(3, label: '😓', width: 1, height: 2, x: 0, y: 2),
        Piece(4, label: '😓', width: 1, height: 2, x: 3, y: 0),
        Piece(5, label: '😓', width: 1, height: 2, x: 3, y: 2),
        Piece(6, label: '😓', width: 1, height: 1, x: 1, y: 0),
        Piece(7, label: '😓', width: 1, height: 1, x: 2, y: 0),
        Piece(8, label: '😓', width: 1, height: 1, x: 0, y: 4),
        Piece(9, label: '😓', width: 1, height: 1, x: 1, y: 4),
      ];

  /// Level 2: a straightforward level (13 moves)
  static level2() => [
        Piece(0, label: '🧠', width: 2, height: 2, x: 1, y: 1),
        Piece(1, label: '😓', width: 2, height: 1, x: 1, y: 0),
        Piece(2, label: '😓', width: 1, height: 2, x: 0, y: 1),
        Piece(3, label: '😓', width: 1, height: 2, x: 0, y: 3),
        Piece(4, label: '😓', width: 1, height: 2, x: 3, y: 1),
        Piece(5, label: '😓', width: 1, height: 2, x: 3, y: 3),
        Piece(6, label: '😓', width: 1, height: 1, x: 0, y: 0),
        Piece(7, label: '😓', width: 1, height: 1, x: 3, y: 0),
        Piece(8, label: '😓', width: 1, height: 1, x: 1, y: 3),
        Piece(9, label: '😓', width: 1, height: 1, x: 2, y: 3),
      ];

  /// Level 3: an easy level (22 moves), no need to touch the top 4 pieces
  static level3() => [
        Piece(0, label: '🧠', width: 2, height: 2, x: 1, y: 2),
        Piece(1, label: '😓', width: 2, height: 1, x: 1, y: 4),
        Piece(2, label: '😓', width: 1, height: 2, x: 0, y: 0),
        Piece(3, label: '😓', width: 1, height: 2, x: 1, y: 0),
        Piece(4, label: '😓', width: 1, height: 2, x: 2, y: 0),
        Piece(5, label: '😓', width: 1, height: 2, x: 3, y: 0),
        Piece(6, label: '😓', width: 1, height: 1, x: 0, y: 2),
        Piece(7, label: '😓', width: 1, height: 1, x: 0, y: 3),
        Piece(8, label: '😓', width: 1, height: 1, x: 3, y: 2),
        Piece(9, label: '😓', width: 1, height: 1, x: 3, y: 3),
      ];

  static List<Piece> load(int level) {
    switch (level) {
      case 1:
        return level1();
      case 2:
        return level2();
      case 3:
        return level3();
      // case 4:
      //   return level4();
      // case 5:
      //   return level5();
      // case 6:
      //   return level6();
      default:
        return level1();
    }
  }
}
