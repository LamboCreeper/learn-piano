import 'package:flutter/cupertino.dart';

import '../../../../enums/piano_clef_enum.dart';
import '../../../../enums/piano_note_pitch_class_enum.dart';

class PianoNote extends StatelessWidget {
  static const _asset = "https://upload.wikimedia.org/wikipedia/commons/thumb/f/fa/Figure_rythmique_noire_hampe_haut.svg/12px-Figure_rythmique_noire_hampe_haut.svg.png";

  final PianoClef _clef;
  final PianoNotePitchClass _note;

  const PianoNote(this._clef, this._note, { super.key });

  @override
  Widget build(BuildContext context) {
    double bottom = this._clef == PianoClef.g
        ? 5 + (PianoNotePitchClass.values.indexOf(this._note) * 5)
        : 5 + (PianoNotePitchClass.values.indexOf(this._note) * 5) + 25;

    if (this._clef == PianoClef.f && this._note == PianoNotePitchClass.c) {
      bottom = 5 + (PianoNotePitchClass.values.length * 5) + 25;
    }

    return Positioned(
        bottom: bottom,
        left: (MediaQuery.of(context).size.width / 2) - 5,
        child: Image.network(PianoNote._asset)
    );
  }
}
