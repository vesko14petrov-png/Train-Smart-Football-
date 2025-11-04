import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AskCoachScreen extends StatefulWidget {
  @override
  _AskCoachScreenState createState() => _AskCoachScreenState();
}

class _AskCoachScreenState extends State<AskCoachScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _sending = false;

  void _sendQuestion() async {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState((){ _sending = true; });
    try {
      await FirebaseFirestore.instance.collection('ask_coach').add({
        'question_en': text,
        'question_bg': text,
        'status': 'pending',
        'created_at': DateTime.now().toIso8601String(),
      });
      _controller.clear();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Question sent!')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Send failed: '+e.toString())));
    } finally {
      setState((){ _sending = false; });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ask Coach'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              minLines: 3,
              maxLines: 6,
              decoration: InputDecoration(
                labelText: 'Type your question',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height:12),
            ElevatedButton(
              onPressed: _sending ? null : _sendQuestion,
              child: _sending ? SizedBox(width:16, height:16, child:CircularProgressIndicator(strokeWidth:2)) : Text('Send'),
            )
          ],
        ),
      ),
    );
  }
}