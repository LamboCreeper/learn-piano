import 'package:flutter/cupertino.dart';
import 'package:learn_piano/constants.dart';

import '../../../../enums/piano_note_pitch_class_enum.dart';

class BlackPianoNoteRow extends StatelessWidget {
  const BlackPianoNoteRow({ super.key });

  @override
  Widget build(BuildContext context) {
    var safeArea = MediaQuery.of(context).size.width - MediaQuery.of(context).padding.left - MediaQuery.of(context).padding.right;
    var noteWidth = safeArea / (totalOctaves * PianoNotePitchClass.values.length);

    return Positioned(
        left: noteWidth - ((noteWidth / 2) / 2),
        child: Row(
            children: List<Widget>.generate(blackPianoNotes.length, (i) => Align(alignment: Alignment.topCenter, child: blackPianoNotes[i]))
        )
    );
  }
}
