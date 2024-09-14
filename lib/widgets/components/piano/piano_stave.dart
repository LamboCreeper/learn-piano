import 'package:flutter/material.dart';

import '../../../enums/piano_clef_enum.dart';
import '../../../enums/piano_note_pitch_class_enum.dart';
import 'notes/piano_note.dart';

class PianoStave extends StatelessWidget {
  static const _gClefAsset = "https://upload.wikimedia.org/wikipedia/commons/thumb/f/ff/GClef.svg/60px-GClef.svg.png";
  static const _fClefAsset = "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c5/FClef.svg/60px-FClef.svg.png";

  final PianoClef _clef;
  final PianoNotePitchClass? _note;

  const PianoStave(this._clef, [this._note = null]);

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
              child: Image.network(_clef == PianoClef.g ? PianoStave._gClefAsset : PianoStave._fClefAsset)
          ),
          this._note != null ? PianoNote(this._clef, this._note) : const SizedBox(),
          Column(
              children: [
                const SizedBox(height: 20),
                Align(
                    alignment: Alignment.center,
                    child: Container(
                        width: 20,
                        height: 10,
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: showTopCLine ? Colors.black : Colors.white
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
                        width: 20,
                        height: 10,
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                    color: showBottomCLine ? Colors.black : Colors.white
                                )
                            )
                        )
                    )
                )
              ]
          )
        ]
    );
  }
}
