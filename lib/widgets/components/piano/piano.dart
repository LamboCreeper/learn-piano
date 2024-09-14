import 'package:flutter/cupertino.dart';
import 'package:learn_piano/widgets/components/piano/piano_octave.dart';

import '../../../enums/piano_clef_enum.dart';

class Piano extends StatelessWidget {
  const Piano({ super.key });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PianoOctave(PianoClef.f),
        PianoOctave(PianoClef.g)
      ]
    );
  }
}
