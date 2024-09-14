import 'package:flutter/material.dart';

import '../../../enums/piano_clef_enum.dart';
import '../../../enums/piano_note_pitch_class_enum.dart';
import 'notes/piano_note.dart';

class PianoStave extends StatelessWidget {
  static const _gClefAsset = "./assets/g-clef.png";
  static const _fClefAsset = "./assets/f-clef.png";

  final PianoClef _clef;
  final PianoNotePitchClass? _note;

  const PianoStave(this._clef, [this._note]);

  @override
  Widget build(BuildContext context) {
    bool showTopCLine = this._note == PianoNotePitchClass.c && this._clef == PianoClef.f;
    bool showBottomCLine = this._note == PianoNotePitchClass.c && this._clef == PianoClef.g;

    return Stack(
        children: [
          Positioned(
              top: _clef == PianoClef.g ? 21 : 31,
              left: _clef == PianoClef.g ? 0 : 17.5,
              width: _clef == PianoClef.g ? 65 : 32.5,
              height: _clef == PianoClef.g ? 65 : 32.5,
              child: Image(image: AssetImage(_clef == PianoClef.g ? PianoStave._gClefAsset : PianoStave._fClefAsset))
          ),
          this._note != null ? PianoNote(this._clef, this._note) : const SizedBox(),
          Column(
              children: [
                const SizedBox(height: 20),
                Align(
                    alignment: Alignment.center,
                    child: Container(
                        width: 15,
                        height: 10,
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: showTopCLine ? Colors.black : Colors.transparent
                                )
                            )
                        )
                    )
                ),
                ...List<Widget>.filled(
                    5,
                    Container(
                        height: 10,
                        decoration: const BoxDecoration(
                            border: Border(
                                top: BorderSide(color: Colors.black)
                            )
                        )
                    )
                ),
                Align(
                    alignment: Alignment.center,
                    child: Container(
                        width: 15,
                        height: 10,
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: showBottomCLine ? Colors.black : Colors.transparent
                                )
                            )
                        )
                    )
                ),
                const SizedBox(height: 10),
              ]
          )
        ]
    );
  }
}
