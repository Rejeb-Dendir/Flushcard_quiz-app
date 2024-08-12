import 'package:flushcard_quiz_app/provider/flashcard_provider.dart';
import 'package:flushcard_quiz_app/widget/flashcard_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    final flashcardDB = Provider.of<FlashcardProvider>(context).flashcards;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 117, 116, 116),
      appBar: AppBar(
        title: const Text(
          'Quiz',
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
      body: ListView.builder(
        itemCount: flashcardDB.length,
        itemBuilder: (context, index) {
          final flashcard = flashcardDB[index];
          return CardList(
            question: flashcard['question'].toString(),
            answer: flashcard['answer'].toString(),
            index: flashcard,
          );
        },
      ),
    );
  }
}
/**
 Question: What is the difference between a compiler and an interpreter?
Answer: A compiler translates the entire program into machine code before execution, while an interpreter translates and executes the code line by line.

2. Question: What is the difference between stack and queue data structures?
Answer: A stack follows the Last In, First Out (LIFO) principle, while a queue follows the First In, First Out (FIFO) principle.
 */
