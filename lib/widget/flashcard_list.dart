import 'package:flip_card/flip_card.dart';
import 'package:flushcard_quiz_app/provider/flashcard_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardList extends StatelessWidget {
  final String question;
  final String answer;
  final Map<String, String> index;

  const CardList({
    super.key,
    required this.question,
    required this.answer,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FlipCard(
        direction: FlipDirection.HORIZONTAL,
        front: Card(
          color: const Color.fromARGB(255, 76, 77, 80),
          child: ListTile(
            title: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  question,
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'Delete card',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        content: const Text(
                          'Are you sure you want to remove the card?',
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'No',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Provider.of<FlashcardProvider>(context,
                                      listen: false)
                                  .deleteFlashcard(index);
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      );
                    });
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
        ),
        back: Card(
          color: const Color.fromARGB(255, 240, 135, 126),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                answer,
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
