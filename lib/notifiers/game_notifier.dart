import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../enums/piano_clef_enum.dart';
import '../enums/piano_note_pitch_class_enum.dart';

class GameNotifier extends ChangeNotifier {
  final Random _random = Random();

  PianoNotePitchClass _currentNote = PianoNotePitchClass.c;
  PianoClef _currentClef = PianoClef.g;

  int _streak = 0;

  GameNotifier() {
    this._updateCurrentNote();
  }

  PianoNotePitchClass getCurrentNote() {
    return this._currentNote;
  }

  PianoClef getCurrentClef() {
    return this._currentClef;
  }

  int getStreak() {
    return this._streak;
  }

  void _updateCurrentNote() {
    PianoNotePitchClass previousNote = this._currentNote;

    this._currentNote = PianoNotePitchClass.values[this._random.nextInt(PianoNotePitchClass.values.length)];
    this._currentClef = PianoClef.values[this._random.nextInt(PianoClef.values.length)];

    if (this._currentNote == previousNote) {
      return this._updateCurrentNote();
    }

    this.notifyListeners();
  }

  bool handleNoteSelection(PianoClef clef, PianoNotePitchClass note, BuildContext context) {
    bool correctClef = this._currentClef == clef;
    bool correctNote = this._currentNote == note;

    if (correctNote && note == PianoNotePitchClass.c && clef == PianoClef.g) {
      correctClef = true;
    }

    if (correctNote && note == PianoNotePitchClass.c && clef == PianoClef.f) {
      correctClef = false;
    }

    bool correct = correctClef && correctNote;

    if (correct) {
      this._streak++;

      Timer(const Duration(seconds: 1), this._updateCurrentNote);
    } else {
      this._streak = 0;
    }

    this.notifyListeners();

    return correct;
  }
}
