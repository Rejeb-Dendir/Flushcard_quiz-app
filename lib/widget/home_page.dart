import 'package:flutter/material.dart';
import 'package:flushcard_quiz_app/pages/quiz_page.dart';
import 'package:flushcard_quiz_app/pages/add_flashcard_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  List<Widget> pages = const [QuizPage(), AddFlashcardPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromARGB(255, 107, 103, 103),
        iconSize: 35,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.question_answer,
              color: Colors.white,
              ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              color: Colors.white,
              ),
            label: '',
          ),
        ],
      ),
    );
  }
}
