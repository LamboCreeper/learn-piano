import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_piano/constants.dart';
import 'package:provider/provider.dart';

import '../../../../enums/piano_clef_enum.dart';
import '../../../../enums/piano_note_pitch_class_enum.dart';
import '../../../../enums/piano_note_state_enum.dart';
import '../../../../main.dart';
import '../../../../notifiers/game_notifier.dart';

class WhitePianoNoteKey extends StatefulWidget {
  final PianoNotePitchClass _note;
  final PianoClef _clef;

  const WhitePianoNoteKey(this._note, this._clef, { super.key });

  @override
  State<WhitePianoNoteKey> createState() => _WhitePianoNoteKeyState();
}

class _WhitePianoNoteKeyState extends State<WhitePianoNoteKey> {
  PianoNoteState _state = PianoNoteState.unknown;

  void _handleNoteSelection(GameNotifier game, BuildContext context) {
    var result = game.handleNoteSelection(widget._clef, widget._note, context);

    setState(() {
      _state = result ? PianoNoteState.correct : PianoNoteState.incorrect;
    });

    Timer(const Duration(seconds: 1), () => setState(() {
      _state = PianoNoteState.unknown;
    }));
  }

  Color _getColour() {
    switch (this._state) {
      case PianoNoteState.unknown:
        return Colors.white;
      case PianoNoteState.correct:
        return Colors.green;
      case PianoNoteState.incorrect:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    var safeArea = MediaQuery.of(context).size.width - MediaQuery.of(context).padding.left - MediaQuery.of(context).padding.right;
    var width = safeArea / (totalOctaves * PianoNotePitchClass.values.length);

    return Consumer<GameNotifier>(
        builder: (ctx, game, child) {
          return GestureDetector(
              onTap: () => this._handleNoteSelection(game, context),
              child: Container(
                width: width,
                height: 4 * width,
                decoration: BoxDecoration(
                    color: this._getColour(),
                    border: Border.all(color: Colors.black)
                ),
              )
          );
        }
    );
  }
}
