import 'package:flushcard_quiz_app/flashcard_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddFlashcardPage extends StatefulWidget {
  const AddFlashcardPage({super.key});

  @override
  State<AddFlashcardPage> createState() => _AddFlashcardPageState();
}

class _AddFlashcardPageState extends State<AddFlashcardPage> {
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _answerController = TextEditingController();

  void _addFlashcard() {
    final question = _questionController.text;
    final answer = _answerController.text;

    if (question.isNotEmpty && answer.isNotEmpty) {
      final flashcardDB =
          Provider.of<FlashcardProvider>(context, listen: false);
      flashcardDB.addFlashcard({
        'question': question,
        'answer': answer,
      });
      _questionController.clear();
      _answerController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 2,
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    );

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 117, 116, 116),
      appBar: AppBar(
        title: const Text(
          'Add Flashcard',
          style: TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _questionController,
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                hintText: 'Question',
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                prefixIcon: Icon(Icons.question_mark),
                prefixIconColor: Colors.black,
                filled: true,
                fillColor: Colors.white,
                focusedBorder: border,
                enabledBorder: border,
              ),
            ),
            const SizedBox(height: 30.0),
            TextField(
              controller: _answerController,
              style: const TextStyle(
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                hintText: 'Answer',
                hintStyle: TextStyle(
                  color: Colors.black,
                ),
                prefixIcon: Icon(Icons.question_answer_outlined),
                prefixIconColor: Colors.black,
                filled: true,
                fillColor: Colors.white,
                focusedBorder: border,
                enabledBorder: border,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addFlashcard,
              child: const Text(
                'Add Flashcard',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
