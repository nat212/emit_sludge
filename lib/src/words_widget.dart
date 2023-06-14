import 'package:emit_sludge/src/words_provider.dart';
import 'package:flutter/material.dart';

class WordsWidget extends StatefulWidget {
  final WordsProvider wordsProvider;

  const WordsWidget({super.key, required this.wordsProvider});

  @override
  State<WordsWidget> createState() => _WordsWidgetState();
}

class _WordsWidgetState extends State<WordsWidget> {
  late String name;

  @override
  void initState() {
    name = getRandomName();
    super.initState();
  }

  String getRandomName() {
    final firstName = widget.wordsProvider.getRandomEWord();
    final lastName = widget.wordsProvider.getRandomSWord();
    return '$firstName $lastName';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(name, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _randomiseName,
              child: const Text('New Name'),
            ),
          ],
        ),
      ),
    );
  }

  void _randomiseName() {
    setState(() {
      name = getRandomName();
    });
  }
}
