import 'package:emit_sludge/src/app.dart';
import 'package:emit_sludge/src/words_provider.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final wordsProvider = await WordsProvider.initialise();

  runApp(App(
    wordsProvider: wordsProvider,
  ));
}
