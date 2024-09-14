import 'package:flutter/cupertino.dart';
import 'package:learn_piano/widgets/components/piano/notes/white_piano_note_key.dart';

import '../../../../enums/piano_clef_enum.dart';
import '../../../../enums/piano_note_pitch_class_enum.dart';

class WhitePianoNoteRow extends StatelessWidget {
  final PianoClef _clef;

  const WhitePianoNoteRow(this._clef, { super.key });

  @override
  Widget build(BuildContext context) {
    return Row(
        children: PianoNotePitchClass.values.map<Widget>((note) => WhitePianoNoteKey(note, this._clef)).toList()
    );
  }
}
