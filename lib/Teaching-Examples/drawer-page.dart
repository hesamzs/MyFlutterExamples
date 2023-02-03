import 'package:flutter/material.dart';
import '../front-page.dart';

class DrawerPage extends StatelessWidget {
  DrawerPage({super.key});

  String title = "AppBar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: SizedBox(
          width: 150,
          height: 40,
          child: ElevatedButton(
            onPressed: () {Navigator.pop(context);},
            child: Text("< Go Back "),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Center(child: Text('Drawer Header')),
            ),
            for (var x in ListItems().list)
              ListTile(
                title: Text(x['title']),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => x['func']));
                  // Navigator.pop(context);
                },
              ),
          ],
        ),
      ),
    );
  }
}

