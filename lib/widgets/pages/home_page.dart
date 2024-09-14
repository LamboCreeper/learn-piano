import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../notifiers/game_notifier.dart';
import '../components/piano/piano.dart';
import '../components/piano/piano_stave.dart';

class HomePage extends StatelessWidget {
  const HomePage({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            children: [
              Consumer<GameNotifier>(
                  builder: (ctx, game, child) {
                    return Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text("Streak: ${game.getStreak()}")
                        ),
                        PianoStave(
                          game.getCurrentClef(),
                          game.getCurrentNote()
                        )
                      ]
                    );
                  }
              ),
              const SafeArea(left: false, right: false, child: Piano())
            ]
        )
    );
  }
}
