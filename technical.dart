import 'package:flutter/material.dart';

class TechnicalScreen extends StatelessWidget {
  final List<Map<String,String>> sampleDrills = [
    {'id':'d001','title':'Inside-Outside Touch / Вътрешно-външно','equipment':'Ball','level':'Beginner'},
    {'id':'d005','title':'Cone Dribble / Дрибъл с конуси','equipment':'Ball','level':'Intermediate'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Technical Training'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            // Filter bar
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _filterChip('Ball'),
                  SizedBox(width:8),
                  _filterChip('Band'),
                  SizedBox(width:8),
                  _filterChip('Balance'),
                  SizedBox(width:8),
                  _filterChip('Mat'),
                ],
              ),
            ),
            SizedBox(height:12),
            Expanded(
              child: ListView.builder(
                itemCount: sampleDrills.length,
                itemBuilder: (ctx, i) {
                  final d = sampleDrills[i];
                  return Card(
                    child: ListTile(
                      title: Text(d['title']!),
                      subtitle: Text('${d['equipment']} • ${d['level']}'),
                      trailing: ElevatedButton(
                        child: Text('View'),
                        onPressed: () {
                          // open details - placeholder
                          showDialog(context: ctx, builder: (_) => AlertDialog(
                            title: Text(d['title']!),
                            content: Text('Details placeholder'),
                            actions: [TextButton(onPressed: ()=>Navigator.pop(ctx), child: Text('Close'))],
                          ));
                        },
                      ),
                    ),
                  );
                }
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _filterChip(String label) {
    return Chip(label: Text(label));
  }
}