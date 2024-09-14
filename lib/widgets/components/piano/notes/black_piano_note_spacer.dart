import 'package:flutter/cupertino.dart';
import 'package:learn_piano/constants.dart';

import '../../../../enums/piano_note_pitch_class_enum.dart';

class BlackPianoNoteSpacer extends StatelessWidget {
  const BlackPianoNoteSpacer({ super.key });

  @override
  Widget build(BuildContext context) {
    var safeArea = MediaQuery.of(context).size.width - MediaQuery.of(context).padding.left - MediaQuery.of(context).padding.right;

    return SizedBox(
        width: safeArea / (totalOctaves * PianoNotePitchClass.values.length)
    );
  }
}
