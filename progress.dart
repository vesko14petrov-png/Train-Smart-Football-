import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  // placeholder metrics
  final Map<String,double> metrics = {
    'Speed': 0.75,
    'Endurance': 0.6,
    'Technique': 0.7,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progress'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: metrics.entries.map((e) => Padding(
            padding: EdgeInsets.symmetric(vertical:8),
            child: Row(
              children: [
                Expanded(flex:2, child: Text(e.key)),
                Expanded(
                  flex:5,
                  child: LinearProgressIndicator(value: e.value),
                ),
                SizedBox(width:8),
                Text('${(e.value*100).toInt()}%')
              ],
            ),
          )).toList(),
        ),
      ),
    );
  }
}