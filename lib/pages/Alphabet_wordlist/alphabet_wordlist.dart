import 'package:bwv2/constants/sample_words.dart';
import 'package:bwv2/pages/components/word_card.dart';
import 'package:bwv2/pages/definition_page/definition_page.dart';
import 'package:flutter/material.dart';

class AlphabetWordlist extends StatefulWidget {
  const AlphabetWordlist({
    super.key,
    required this.alphabet,
  });

  final String alphabet;

  @override
  State<AlphabetWordlist> createState() => _AlphabetWordlistState();
}

class _AlphabetWordlistState extends State<AlphabetWordlist> {
  final TextEditingController searchController = TextEditingController();
  List words = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    words = sampleWords
        .where((eachWord) => eachWord["word"][0] == widget.alphabet)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.alphabet,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Search
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search words...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  contentPadding: EdgeInsets.symmetric(vertical: 0),
                ),
                onChanged: (value) => {setState(() {})},
              ),
            ),

            // Words
            ListView.builder(
              shrinkWrap: true,
              itemCount: words.length,
              itemBuilder: (context, index) {
                // bool isInAlphabet =
                //     sampleWords[index]["word"][0] == widget.alphabet ||
                //         sampleWords[index]["word"][0] == widget.alphabet &&
                //             (searchController.text);
                bool isSearchMatch = words[index]["word"]
                    .toString()
                    .toLowerCase()
                    .contains(searchController.text.toLowerCase());
                return searchController.text.trim().length <= 0
                    ? WordCard(word: words[index])
                    : isSearchMatch
                        ? WordCard(word: words[index])
                        : Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
