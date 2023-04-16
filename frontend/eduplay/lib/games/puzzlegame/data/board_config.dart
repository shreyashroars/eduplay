import 'package:flutter/widgets.dart';

class BoardConfig extends InheritedWidget {

  final Duration slideDuration = const Duration(milliseconds: 300);

  /// The width and height of a 1x1 piece.
  final double unitSize;

  /// Whether to hide decorative Chinese characters on pieces.
  /// This is useful for devices without necessary fonts installed.
  final bool hideTexts;

  /// Colors used for the core piece.
  final Color corePieceColor1 = const Color(0xff048630);
  final Color corePieceColor2 = const Color(0xff04bb45);

  /// Colors used for other pieces.
  final Color pieceColor1 = const Color(0xffbb041d);
  final Color pieceColor2 = const Color(0xffef051f);

  final Color pieceAttachmentColor = const Color(0xff6053BC);
  final Color pieceShadowColor = const Color(0xff6053BC);

  /// A series of LayerLink objects that correspond to each puzzle piece.
  /// This is used by the "hint" animation to insert an overlay exactly on top
  /// of the piece that's hinted to move.
  final List<LayerLink> layerLinks = List.generate(10, (int i) => LayerLink());

  BoardConfig({
    Key? key,
    required this.unitSize,
    required Widget child,
    this.hideTexts = false,
  }) : super(key: key, child: child);

  static BoardConfig of(BuildContext context) {
    final config = context.dependOnInheritedWidgetOfExactType<BoardConfig>();
    assert(
      config != null,
      'BoardConfig.of() called with a context '
      'that does not contain a BoardConfig.',
    );
    return config!;
  }

  @override
  bool updateShouldNotify(BoardConfig oldWidget) =>
      unitSize != oldWidget.unitSize;
}
