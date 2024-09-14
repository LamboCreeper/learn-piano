import 'package:flutter/material.dart';
import 'package:learn_piano/constants.dart';

import '../../../../enums/piano_note_pitch_class_enum.dart';

class BlackPianoNoteKey extends StatelessWidget {
  const BlackPianoNoteKey({ super.key });

  @override
  Widget build(BuildContext context) {
    var safeArea = MediaQuery.of(context).size.width - MediaQuery.of(context).padding.left - MediaQuery.of(context).padding.right;
    var whiteNoteWidth = safeArea / (totalOctaves * PianoNotePitchClass.values.length);
    var blackNoteWidth = whiteNoteWidth / 2;

    return Container(
        width: blackNoteWidth,
        margin: EdgeInsets.only(right: whiteNoteWidth - blackNoteWidth),
        height: whiteNoteWidth * 2.5,
        color: Colors.black
    );
  }
}
