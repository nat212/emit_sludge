import 'package:emit_sludge/src/words_provider.dart';
import 'package:emit_sludge/src/words_widget.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final WordsProvider wordsProvider;

  const App({super.key, required this.wordsProvider});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emit Sludge',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: ThemeMode.light,
      home: WordsWidget(
        wordsProvider: wordsProvider,
      ),
    );
  }
}
