import 'package:dental_notes/app/features/home/current%20month/current_month.dart';
import 'package:dental_notes/app/features/home/months/months_page.dart';
import 'package:dental_notes/app/features/home/summary/summary_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

var currentIndex = 1;

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: currentIndex == 1
            ? const Text('Bieżący miesiąc')
            : currentIndex == 0
                ? const Text('Spis miesięcy')
                : const Text('Podsumowanie'),
      ),
      body: Builder(builder: (context) {
        if (currentIndex == 0) {
          return const MonthsPage();
        }
        if (currentIndex == 1) {
          return const CurrentMonth();
        }
        return const SummaryPage();
      }),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          },
          selectedItemColor: Colors.white,
          backgroundColor: Colors.pink[200],
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month_outlined),
              label: 'Spis miesięcy',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.border_color_outlined),
              label: 'Bieżący miesiąc',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.summarize_outlined),
              label: 'Podsumowanie',
            ),
          ]),
    );
  }
}
