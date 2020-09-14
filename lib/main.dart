import 'package:flutter/material.dart';
import './widgets/add.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int c = 0;
  void sheet(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) => AddTransaction(display: false, addwidget: true),
    ).whenComplete(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          textTheme: GoogleFonts.abelTextTheme(),
        ),
        primarySwatch: Colors.amber,
        accentColor: Colors.amber,
        textTheme: GoogleFonts.openSansTextTheme(),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'hello',
            style: Theme.of(context).textTheme.headline6,
          ),
          actions: <Widget>[
            Builder(
              builder: (context) => IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    return sheet(context);
                  }),
            )
          ],
        ),
        body: ListView(physics: NeverScrollableScrollPhysics(), children: [
          AddTransaction(
            display: true,
            addwidget: false,
          )
        ]),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Builder(
          builder: (context) => FloatingActionButton(
            onPressed: () {
              return sheet(context);
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
