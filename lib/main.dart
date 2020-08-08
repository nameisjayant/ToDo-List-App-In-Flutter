import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Text("Todo App"),
        ),
        body: TodoApp(),
      ),
    ));
  }
}

class TodoApp extends StatefulWidget {
  _TodoAppState createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  List<String> items = [];
  TextEditingController data = TextEditingController();
  Widget build(BuildContext context) {
    return (Container(
        child: Wrap(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(30.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 2, color: Colors.black),
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 13.0,
                color: Colors.black.withOpacity(.5),
                offset: Offset(6.0, 7.0),
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                padding: EdgeInsets.all(5.0),
                color: Colors.black,
                child: Center(
                  child: Text(
                    "ToDo List",
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.all(20.0),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    children: <Widget>[
                      FloatingActionButton(
                        backgroundColor: Colors.green,
                        onPressed: () {
                          setState(() {
                            if (data.text != "") {
                              items.add(data.text);
                            }
                            data.clear();
                          });
                        },
                        child: Icon(
                          Icons.add,
                        ),
                      ),
                      Expanded(
                          child: TextField(
                        style: GoogleFonts.josefinSans(
                            textStyle:
                                TextStyle(color: Colors.black, fontSize: 30.0)),
                        controller: data,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(hintText: "Add an items"),
                      )),
                    ],
                  )),
              Container(
                height: 300.0,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, index) {
                      return (ListTile(
                        title: Text(
                          items[index],
                          style: GoogleFonts.josefinSans(
                              textStyle: TextStyle(fontSize: 25.0)),
                        ),
                        trailing: IconButton(
                            iconSize: 35.0,
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              setState(() {
                                items.removeAt(index);
                                index--;
                              });
                            }),
                      ));
                    }),
              )
            ],
          ),
        ),
      ],
    )));
  }
}
