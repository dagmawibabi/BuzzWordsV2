import 'package:bwv2/constants/sample_words.dart';
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
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 10.0,
                        ),
                        child: Container(
                          padding: const EdgeInsets.only(
                            top: 10.0,
                            bottom: 10.0,
                            left: 15.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.yellowAccent.withAlpha(30),
                            border: Border.all(
                              color: Colors.orange,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    words[index]["word"],
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'by: ${words[index]['submittedBy']}',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  Text(
                                    '${DateTime.parse(words[index]['dateTime'].toString()).day} • ${DateTime.parse(words[index]['dateTime'].toString()).month} • ${DateTime.parse(words[index]['dateTime'].toString()).year}',
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.chevron_right,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : isSearchMatch
                        ? Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 10.0,
                            ),
                            child: Container(
                              padding: const EdgeInsets.only(
                                top: 10.0,
                                bottom: 10.0,
                                left: 15.0,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.yellowAccent.withAlpha(30),
                                border: Border.all(
                                  color: Colors.orange,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        words[index]["word"],
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'by: ${words[index]['submittedBy']}',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                      Text(
                                        '${DateTime.parse(words[index]['dateTime'].toString()).day} • ${DateTime.parse(words[index]['dateTime'].toString()).month} • ${DateTime.parse(words[index]['dateTime'].toString()).year}',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.chevron_right,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
