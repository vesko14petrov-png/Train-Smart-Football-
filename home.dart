import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar with simple title and language toggle placeholder
      appBar: AppBar(
        title: Text('TrainSmart Football'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right:12.0),
            child: Center(child: Text('EN/BG')),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              child: ListTile(
                title: Text('Today\'s Training'),
                subtitle: Text('No plans yet - add trainings in Phase 2'),
                trailing: ElevatedButton(
                  child: Text('Start'),
                  onPressed: () {},
                ),
              ),
            ),
            SizedBox(height:16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                _navCard(context, 'Technical', Icons.sports_soccer, '/technical'),
                _navCard(context, 'Physical', Icons.fitness_center, '/physical'),
                _navCard(context, 'Ask Coach', Icons.chat, '/ask'),
                _navCard(context, 'Progress', Icons.show_chart, '/progress'),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _navCard(BuildContext ctx, String title, IconData icon, String route) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(ctx, route),
      child: SizedBox(
        width: 160,
        height: 120,
        child: Card(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size:36, color: Color(0xFF4B4B4B)),
                SizedBox(height:8),
                Text(title)
              ],
            ),
          )
        ),
      ),
    );
  }
}