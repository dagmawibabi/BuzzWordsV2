import 'package:flutter/material.dart';

class WordOfTheDay extends StatefulWidget {
  const WordOfTheDay({super.key});

  @override
  State<WordOfTheDay> createState() => _WordOfTheDayState();
}

class _WordOfTheDayState extends State<WordOfTheDay> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Word of the day
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                    bottom: 5.0,
                  ),
                  child: Text(
                    "Word of the day",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: 10.0,
                    bottom: 15.0,
                    left: 15.0,
                    right: 15.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.yellowAccent.withAlpha(20),
                    border: Border.all(
                      width: 2.0,
                      color: Colors.orangeAccent,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Serendipity",
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "[Ser-endi-pity]",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "Noun",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "The occurrence of events by chance in a happy or beneficial way.",
                        style: TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // Illustration
        Align(
          alignment: Alignment.topRight,
          child: Image.asset(
            "assets/illustrations/wordOfTheDay.png",
            width: 135,
          ),
        ),
      ],
    );
  }
}
