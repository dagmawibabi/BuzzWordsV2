import 'package:bwv2/constants/alphabet.dart';
import 'package:bwv2/pages/components/alphabet_grid.dart';
import 'package:bwv2/pages/components/statistics_card.dart';
import 'package:bwv2/pages/components/statistics_section.dart';
import 'package:bwv2/pages/components/word_of_the_day.dart';
import 'package:bwv2/utils/api_call.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // State variables for the stats
  Map<String, dynamic>? randomWord;
  List<Map<String, dynamic>> stats = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _getStats();
  }

  Future<void> _getStats() async {
    try {
      final response = await APICall().get('stats/all');

      if (response != null && response['success'] == true) {
        setState(() {
          randomWord = response['data']['randomWord'];
          stats = [
            {
              "title": "Total Words",
              "value": response['data']['stats']['totalWords'].toString(),
            },
            {
              "title": "Total Users",
              "value": response['data']['stats']['totalUsers'].toString(),
            },
            {
              "title": "Total Bookmarks",
              "value": response['data']['stats']['totalBookmarks'].toString(),
            },
          ];
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = response?['message'] ?? 'Failed to load stats';
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = 'Error: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Column(
            children: [
              const Center(child: CircularProgressIndicator()),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Word of the Day
              WordOfTheDay(word: randomWord),
              SizedBox(height: 20.0),

              // Stats Cards Row
              StatisticsSection(stats: stats),
              SizedBox(height: 20.0),

              // Alphabet Words
              AlphabetGrid(),
              SizedBox(height: 30.0),
            ],
          );
  }
}
