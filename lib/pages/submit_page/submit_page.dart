import 'package:flutter/material.dart';
import 'package:bwv2/utils/api_call.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
  bool _isLoading = false;
  Map<String, dynamic>? user = {
    "firstName": "",
    "lastName": "",
    "username": "",
    "email": "",
    "role": "",
    "createdAt": "",
    "updatedAt": "",
    "id": "",
  };

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

  void getUser() async {
    final userBox = await Hive.openBox('userBox');
    final user = await userBox.get("user");
    setState(() {
      this.user = user;
    });
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final response = await APICall().post('submitWord/submit', {
          'word': _wordController.text.toLowerCase().trim(),
          'definition': _definitionController.text.toLowerCase().trim(),
          'partOfSpeech': _selectedPartOfSpeech?.toLowerCase(),
          'synonyms': _synonymsController.text
              .toLowerCase()
              .split(',')
              .map((s) => s.trim())
              .where((s) => s.isNotEmpty)
              .toList(),
          'antonyms': _antonymsController.text
              .toLowerCase()
              .split(',')
              .map((s) => s.trim())
              .where((s) => s.isNotEmpty)
              .toList(),
          'username': user!['username'],
        });

        if (!mounted) return;

        if (response != null && response['success'] == true) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Word submitted successfully!')),
          );
          // Clear the form
          _formKey.currentState?.reset();
          setState(() {
            _selectedPartOfSpeech = null;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(response?['message'] ?? 'Failed to submit word'),
            ),
          );
        }
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
  }

  @override
  void dispose() {
    _wordController.dispose();
    _definitionController.dispose();
    _antonymsController.dispose();
    _synonymsController.dispose();
    super.dispose();
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
              onPressed: _isLoading ? null : _submitForm,
              child: _isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : const Text(
                      'Submit Word',
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
