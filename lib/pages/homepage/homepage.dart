import 'package:bwv2/constants/alphabet.dart';
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
        SizedBox(height: 30.0),

        // Alphabet Words
        Padding(
          padding: const EdgeInsets.only(
            left: 15.0,
            bottom: 5.0,
          ),
          child: Text(
            "Learn by Alphabet",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.7,
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            shrinkWrap: true,
            primary: true,
            padding: const EdgeInsets.only(bottom: 100.0),
            itemCount: alphabet.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // openWordsBottomSheet(alphabet[index]);
                },
                child: Container(
                  // padding: const EdgeInsets.symmetric(
                  //   horizontal: 10.0,
                  //   vertical: 5.0,
                  // ),
                  decoration: BoxDecoration(
                    color: Colors.yellowAccent.withAlpha(30),
                    border: Border.all(
                      color: Colors.yellow[700]!,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    alphabet[index],
                    style: TextStyle(
                      // color: Colors.grey,
                      // fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
