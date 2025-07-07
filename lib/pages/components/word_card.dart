import 'package:bwv2/pages/definition_page/definition_page.dart';
import 'package:flutter/material.dart';

class WordCard extends StatefulWidget {
  const WordCard({
    super.key,
    required this.word,
  });

  final Map word;

  @override
  State<WordCard> createState() => _WordCardState();
}

class _WordCardState extends State<WordCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DefinitionPage(word: widget.word),
            ),
          );
        },
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
                    widget.word["word"],
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'by: ${widget.word['username']}',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  Text(
                    '${DateTime.parse(widget.word['createdAt'].toString()).day} • ${DateTime.parse(widget.word['createdAt'].toString()).month} • ${DateTime.parse(widget.word['createdAt'].toString()).year}',
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DefinitionPage(word: widget.word),
                    ),
                  );
                },
                icon: Icon(
                  Icons.chevron_right,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
