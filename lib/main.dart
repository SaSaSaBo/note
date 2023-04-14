import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xff2B2D2D),
          scaffoldBackgroundColor: Color.fromARGB(255, 67, 148, 253)),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String input = "";
  List note = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "NOTES APP",
            style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontStyle: FontStyle.normal,
                letterSpacing: 2),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 164, 207, 248),
          child: const Icon(
            Icons.add,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: Color(0xff48C8cC),
                  title: Text("Add Note's"),
                  content: TextField(
                    decoration: InputDecoration(
                      hintText: "Note's",
                    ),
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: [
                    FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            note.add(input);
                          }); // setState
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Add",
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                );
              },
            );
          },
        ),
        body: Padding(
          padding: EdgeInsets.all(5),
          child: ListView.builder(
              itemCount: note.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: Key(note[index]),
                  child: Card(
                    elevation: 4,
                    margin: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                        title: Text(
                          note[index],
                          style: TextStyle(color: Colors.black),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            setState(() {
                              note.remove(input);
                            });
                          }, // onPressed
                        )),
                  ), // child
                );
              } // itemBuilder
              ),
        ),
      ),
    );
  }
}
