import 'package:flutter/cupertino.dart';

import '../../../enums/piano_clef_enum.dart';
import 'notes/black_piano_note_row.dart';
import 'notes/white_piano_note_row.dart';

class PianoOctave extends StatelessWidget {
  final PianoClef _clef;

  const PianoOctave(this._clef, { super.key });

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          WhitePianoNoteRow(this._clef),
          const BlackPianoNoteRow()
        ]
    );
  }
}
