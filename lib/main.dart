import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learn_piano/widgets/pages/home_page.dart';
import 'package:provider/provider.dart';

import 'notifiers/game_notifier.dart';


void main() => runApp(
    ChangeNotifierProvider(
        create: (context) => GameNotifier(),
        child: const MyApp()
    )
);

class MyApp extends StatelessWidget {
  const MyApp({ super.key });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft
    ]);

    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: Colors.blue,
        ),
        home: const HomePage()
    );
  }
}
