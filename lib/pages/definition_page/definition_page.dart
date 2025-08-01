import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class DefinitionPage extends StatefulWidget {
  const DefinitionPage({
    super.key,
    required this.word,
  });

  final Map word;

  @override
  State<DefinitionPage> createState() => _DefinitionPageState();
}

class _DefinitionPageState extends State<DefinitionPage> {
  late String? aiDefinition = '';
  late String? aiExamples = '';
  late String? aiAntonymsAndSynonyms = '';

  void generateExplanation() async {
    final model = GenerativeModel(
      model: 'gemini-2.0-flash',
      apiKey: 'AIzaSyBcPZO3nsbkGhA2fHJpn8ZcxHu9s4tAmsw',
      generationConfig: GenerationConfig(
        temperature: 1,
        topK: 40,
        topP: 0.95,
        maxOutputTokens: 8192,
        responseMimeType: 'text/plain',
      ),
      systemInstruction: Content(
        'ai',
        [TextPart('Summarize the texts given to you as short as possible.')],
      ),
    );

    final chat = model.startChat(history: []);

    // Definition
    final definition = Content.text(
        "Explain This Word, Only tell me it's definition don't talk about anything else - make it slightly extensive and use markdown when highlighting somethings: ${widget.word}");
    var response = await chat.sendMessage(definition);
    aiDefinition = response.text;
    setState(() {});

    // Antonyms and Synonyms
    final antonymsAndSynonyms = Content.text(
        "For this word, only tell me it's antonyms and synonyms and don't add too many new lines. List the words in an unordered list: ${widget.word['word']}");
    response = await chat.sendMessage(antonymsAndSynonyms);
    aiAntonymsAndSynonyms = response.text;
    setState(() {});

    // Examples
    final examples = Content.text(
        "Using this word list a few example uses of the word and don't add too many new lines. follow this format '**Examples**: 1. Example 1 \n 2. Example 2... \n 3. Example 3... \n 4. Example 4... \n 5. Example 5... ${widget.word['word']}");
    response = await chat.sendMessage(examples);
    aiExamples = response.text;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    generateExplanation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.word["word"].toString(),
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10.0,
        ),
        children: [
          // Definition
          aiDefinition == ''
              ? Container()
              : Container(
                  height: 150.0,
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.yellow[100]!,
                    border: Border.all(
                      color: Colors.yellow[600]!,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Markdown(
                    data: aiDefinition.toString(),
                  ),
                ),
          SizedBox(height: 20.0),

          // Antonyms and Synonyms
          aiAntonymsAndSynonyms == ''
              ? Container()
              : Container(
                  height: 170.0,
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.yellow[100]!,
                    border: Border.all(
                      color: Colors.yellow[600]!,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Markdown(
                    data: aiAntonymsAndSynonyms.toString(),
                  ),
                ),
          SizedBox(height: 20.0),

          // Examples
          aiExamples == ''
              ? Container()
              : Container(
                  height: 200.0,
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.yellow[100]!,
                    border: Border.all(
                      color: Colors.yellow[600]!,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Markdown(
                    data: aiExamples.toString(),
                  ),
                ),
          SizedBox(height: 40.0),

          aiDefinition == '' || aiAntonymsAndSynonyms == '' || aiExamples == ''
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.yellow[600]!,
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 10.0,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "The content on this page is generated with AI. It may sometimes give out inaccurate information but please report to us when you find some.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[500]!,
                        ),
                      ),
                    ),
                    // Icon(
                    //   Ionicons.sparkles_outline,
                    //   size: 20.0,
                    //   color: Colors.grey[500]!,
                    // ),
                  ],
                ),

          SizedBox(height: 200.0),
        ],
      ),
    );
  }
}
