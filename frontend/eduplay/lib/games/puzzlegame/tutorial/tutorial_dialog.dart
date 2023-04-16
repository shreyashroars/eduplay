import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:zenith/games/puzzlegame/data/board_config.dart';
import 'package:zenith/games/puzzlegame/data/game_state.dart';
import 'package:zenith/games/puzzlegame/puzzle/puzzle_piece.dart';
import 'package:zenith/globalvariables.dart';

class TutorialDialog extends StatefulWidget {
  final void Function(bool hideText) onDismiss;

  const TutorialDialog({Key? key, required this.onDismiss}) : super(key: key);

  @override
  _TutorialDialogState createState() => _TutorialDialogState();
}

class _TutorialDialogState extends State<TutorialDialog>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1500),
  )..forward();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _Dialog(widget.onDismiss);
  }
}

class _Dialog extends StatefulWidget {
  final void Function(bool hideText) onDismiss;

  const _Dialog(this.onDismiss, {Key? key}) : super(key: key);

  @override
  State<_Dialog> createState() => _DialogState();
}

class _DialogState extends State<_Dialog> {
  final bool _hideTexts = false;

  @override
  Widget build(BuildContext context) {
    final dialog = Stack(
      children: [
        CupertinoPopupSurface(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 32),
              child: _buildTutorialContent(context),
            ),
          ),
        ),
        Positioned(
          top: 16,
          right: 16,
          child: ClipOval(
            child: Material(
              shape: const CircleBorder(),
              child: CloseButton(
                onPressed: () => widget.onDismiss(_hideTexts),
              ),
            ),
          ),
        ),
      ],
    );

    final responsiveDialog = Center(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 650) {
            return SafeArea(
              minimum: const EdgeInsets.all(32),
              child: dialog,
            );
          }
          return ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: constraints.maxHeight * 0.8,
              maxWidth: 600,
            ),
            child: dialog,
          );
        },
      ),
    );

    return WillPopScope(
      // Dismiss the tutorial dialog when the user taps the back button,
      // instead of quitting the entire app.
      child: responsiveDialog,
      onWillPop: () async {
        widget.onDismiss(_hideTexts);
        return false;
      },
    );
  }

  Widget _buildTutorialContent(BuildContext context) {
    final header = TextStyle(
      fontWeight: FontWeight.bold,
      color: BoardConfig.of(context).pieceColor2,
      fontSize: 20,
      height: 2.0,
    );
    const body = TextStyle(
      fontWeight: FontWeight.normal,
      color: Colors.black87,
      height: 1.2,
    );
    final em = TextStyle(
      fontWeight: FontWeight.bold,
      color: BoardConfig.of(context).pieceColor1,
      height: 1.2,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'How to Play',
          style:
              TextStyle(color: GlobalVariables.backgroundColor, fontSize: 32),
          textAlign: TextAlign.center,
        ),
        RichText(
          text: TextSpan(
            style: body,
            children: [
              TextSpan(
                  text: '\nObjective\n',
                  style: TextStyle(
                      color: GlobalVariables.backgroundColor, fontSize: 24)),
              const TextSpan(
                  text:
                      '\nThe goal is to relieve "🧠" from "😓" by moving it outside the box',
                  style: TextStyle(color: GlobalVariables.backgroundColor)),
            ],
          ),
        ),
        const SizedBox(height: 48),
        ElevatedButton(
          onPressed: () async {
            // Wait for the button ink well splash to finish.
            await Future.delayed(const Duration(milliseconds: 300));
            widget.onDismiss(_hideTexts);
          },
          child: const Text("PLAY"),
          style: ElevatedButton.styleFrom(
            primary: const Color(0xbf0d4645),
          ),
        ),
      ],
    );
  }

  Widget _buildPuzzlePiece(Piece piece) {
    return IgnorePointer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BoardConfig(
          unitSize: 30,
          hideTexts: _hideTexts,
          child: Stack(
            children: [
              PuzzlePieceShadow(piece: piece),
              PuzzlePieceAttachment(piece: piece),
              PuzzlePiece(piece: piece, disableGestures: true),
            ],
          ),
        ),
      ),
    );
  }
}
