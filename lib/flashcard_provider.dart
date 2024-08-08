import 'package:flutter/material.dart'; // Import ChangeNotifier

class FlashcardProvider extends ChangeNotifier {
  final List<Map<String, String>> flashcards = [];

  void addFlashcard(Map<String, String> flashcard) {
    flashcards.add(flashcard);
    notifyListeners(); // Notify listeners of changes
  }
  
  void deleteFlashcard(Map<String, String> flashcard) {
    flashcards.remove(flashcard);
    notifyListeners(); // Notify listeners of changes
  }
}
