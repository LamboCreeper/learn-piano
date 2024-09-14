import 'package:flutter/cupertino.dart';

import '../../../../enums/piano_clef_enum.dart';
import '../../../../enums/piano_note_pitch_class_enum.dart';

class PianoNote extends StatelessWidget {
  static const _asset = "./assets/note.png";

  final PianoClef _clef;
  final PianoNotePitchClass _note;

  const PianoNote(this._clef, this._note, { super.key });

  @override
  Widget build(BuildContext context) {
    double bottom = this._clef == PianoClef.g
        ? 5 + (PianoNotePitchClass.values.indexOf(this._note) * 5) + 10
        : 5 + (PianoNotePitchClass.values.indexOf(this._note) * 5) + 35;

    if (this._clef == PianoClef.f && this._note == PianoNotePitchClass.c) {
      bottom = 5 + (PianoNotePitchClass.values.length * 5) + 35;
    }

    return Positioned(
        bottom: bottom,
        left: (MediaQuery.of(context).size.width / 2) - 5,
        child: const Image(width: 10, image: AssetImage(PianoNote._asset))
    );
  }
}
