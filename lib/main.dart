
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dismissible"),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8),
        itemCount: 100,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(index.toString()),
            onDismissed: (direction) {
              print("DISMISSED");
              print(direction);
              if (direction == DismissDirection.endToStart) {
                print("END TO START");
              } else {
                print("START TO END");
              }
            },
            confirmDismiss: (direction) async {
              return await showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Confirm"),
                    content: Text("Are you sure you want to delete this item?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(false); // No
                        },
                        child: Text("No"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(true); // Yes
                        },
                        child: Text("Yes"),
                      ),
                    ],
                  );
                },
              );
            },
            direction: DismissDirection.startToEnd,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.delete,
                color: Colors.white,
                size: 25,
              ),
            ),
            child: ListTile(
              leading: CircleAvatar(
                child: Center(
                  child: Text("${index + 1}"),
                ),
              ),
              title: Text("abdi"),
              subtitle: Text("semangat berusaha"),
            ),
          );
        },
      ),
    );
  }
}

