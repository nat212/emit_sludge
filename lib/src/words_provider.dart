import 'dart:math';

import 'package:flutter/services.dart';

class WordsProvider {
  static late final WordsProvider _instance;
  static get instance => _instance;

  final List<String> eWords;
  final List<String> sWords;

  WordsProvider._internal({
    required this.eWords,
    required this.sWords,
  });

  static Future<WordsProvider> initialise() async {
    final List<String> eWords = await _loadWords('assets/text/e-words.txt');
    final List<String> sWords = await _loadWords('assets/text/s-words.txt');
    _instance = WordsProvider._internal(
      eWords: eWords,
      sWords: sWords,
    );
    return _instance;
  }

  static Future<String> _loadAsset(String key) async {
    return await rootBundle.loadString(key);
  }

  static Future<List<String>> _loadWords(String key) async {
    final String fileContents = await _loadAsset(key);
    return fileContents.split('\n');
  }

  String _randomWord(List<String> wordsList) {
    final index = Random().nextInt(wordsList.length);
    final unprocessedWord = wordsList[index];
    final firstCharacter = unprocessedWord[0];
    return unprocessedWord.replaceRange(0, 1, firstCharacter.toUpperCase());
  }

  String getRandomEWord() {
    return _randomWord(eWords);
  }

  String getRandomSWord() {
    return _randomWord(sWords);
  }
}
