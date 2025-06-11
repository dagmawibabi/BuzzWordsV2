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
        // Word of the day
        Text(
          "Word of the day",
          style: TextStyle(
            fontSize: 16.0,
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
              SizedBox(height: 10.0),
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
    );
  }
}
