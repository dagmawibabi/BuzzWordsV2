import 'package:bwv2/constants/alphabet.dart';
import 'package:bwv2/pages/components/alphabet_grid.dart';
import 'package:bwv2/pages/components/statistics_card.dart';
import 'package:bwv2/pages/components/statistics_section.dart';
import 'package:bwv2/pages/components/word_of_the_day.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Word of the Day
        WordOfTheDay(),
        SizedBox(height: 20.0),

        // Stats Cards Row
        StatisticsSection(),
        SizedBox(height: 20.0),

        // Alphabet Words
        AlphabetGrid(),
        SizedBox(height: 30.0),
      ],
    );
  }
}
