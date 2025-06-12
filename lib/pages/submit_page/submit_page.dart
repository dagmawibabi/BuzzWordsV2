import 'package:flutter/material.dart';

class SubmitPage extends StatefulWidget {
  const SubmitPage({super.key});

  @override
  State<SubmitPage> createState() => _SubmitPageState();
}

class _SubmitPageState extends State<SubmitPage> {
  final _formKey = GlobalKey<FormState>();
  final _wordController = TextEditingController();
  final _definitionController = TextEditingController();
  final _antonymsController = TextEditingController();
  final _synonymsController = TextEditingController();

  String? _selectedPartOfSpeech;
  final List<String> _partsOfSpeech = [
    'Noun',
    'Verb',
    'Adjective',
    'Adverb',
    'Pronoun',
    'Preposition',
    'Conjunction',
    'Interjection'
  ];

  @override
  void dispose() {
    _wordController.dispose();
    _definitionController.dispose();
    _antonymsController.dispose();
    _synonymsController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission logic
      print("Submitted: ${_wordController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Submit Word",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _buildTextField(_wordController, "Word"),
            SizedBox(height: 16),
            _buildTextField(_definitionController, "Definition", maxLines: 3),
            SizedBox(height: 16),
            _buildTextField(_antonymsController, "Antonyms"),
            SizedBox(height: 16),
            _buildTextField(_synonymsController, "Synonyms"),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedPartOfSpeech,
              decoration: InputDecoration(
                labelText: "Part of Speech",
                border: OutlineInputBorder(),
              ),
              items: _partsOfSpeech
                  .map((part) => DropdownMenuItem(
                        value: part,
                        child: Text(part),
                      ))
                  .toList(),
              onChanged: (val) => setState(() {
                _selectedPartOfSpeech = val;
              }),
              validator: (val) =>
                  val == null ? 'Please select a part of speech' : null,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16),
                textStyle: TextStyle(fontSize: 18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                backgroundColor: Colors.black,
              ),
              onPressed: _submitForm,
              child: Text(
                "Submit Word",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label,
      {int maxLines = 1}) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            20.0,
          ),
        ),
      ),
      validator: (val) => val == null || val.isEmpty ? 'Required' : null,
    );
  }
}
