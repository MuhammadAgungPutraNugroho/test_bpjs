// ignore_for_file: library_private_types_in_public_api, unnecessary_null_comparison, prefer_final_fields, unused_field, avoid_unnecessary_containers, unnecessary_const

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
import 'package:universal_html/js.dart' as js;
import 'fake_ui.dart' if (dart.library.html) 'real_ui.dart' as ui;
import 'package:multi_select_flutter/multi_select_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Multi Select',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Flutter Multi Select'),
    );
  }
}

class Animal {
  final int id;
  final String name;

  Animal({
    required this.id,
    required this.name,
  });
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static List<Animal> _animals = [
    Animal(id: 1, name: "Javascript"),
    Animal(id: 2, name: "Java"),
    Animal(id: 3, name: "Python"),
    Animal(id: 4, name: "SQL"),
    Animal(id: 5, name: "PHP"),
  ];
  final _items = _animals
      .map((animal) => MultiSelectItem<Animal>(animal, animal.name))
      .toList();
  //List<Animal> _selectedAnimals = [];
  List<Animal> _selectedAnimals2 = [];
  List<Animal> _selectedAnimals3 = [];
  //List<Animal> _selectedAnimals4 = [];
  List<Animal> _selectedAnimals5 = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();
  late js.JsObject connector;
  String createdViewId = Random().nextInt(1000).toString();
  late html.IFrameElement element;
  String htmlText = """​<!DOCTYPE html>
<html>
<body>
</body>
</html>
""";

  @override
  void initState() {
    js.context["connect_content_to_flutter"] = (js.JsObject content) {
      connector = content;
    };
    element = html.IFrameElement()
      ..src = "/assets/editor.html"
      ..style.border = 'none';

    ui.platformViewRegistry
        .registerViewFactory(createdViewId, (int viewId) => element);
    _selectedAnimals5 = _animals;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const <Widget>[
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Wanted Job Title",
                          style: TextStyle(fontSize: 10.0),
                        ),
                        subtitle: TextField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      height: 1,
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Wanted Job Title",
                          style: TextStyle(fontSize: 10.0),
                        ),
                        leading: AspectRatio(
                          aspectRatio: 1,
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(4.0)),
                            child: Icon(
                              Icons.person,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const <Widget>[
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "First Name",
                          style: TextStyle(fontSize: 10.0),
                        ),
                        subtitle: TextField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Last Name",
                          style: TextStyle(fontSize: 10.0),
                        ),
                        subtitle: TextField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const <Widget>[
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Email",
                          style: TextStyle(fontSize: 10.0),
                        ),
                        subtitle: TextField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Phone",
                          style: TextStyle(fontSize: 10.0),
                        ),
                        subtitle: TextField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const <Widget>[
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Country",
                          style: TextStyle(fontSize: 10.0),
                        ),
                        subtitle: TextField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "City",
                          style: TextStyle(fontSize: 10.0),
                        ),
                        subtitle: TextField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const <Widget>[
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Address",
                          style: TextStyle(fontSize: 10.0),
                        ),
                        subtitle: TextField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Postal Code",
                          style: TextStyle(fontSize: 10.0),
                        ),
                        subtitle: TextField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const <Widget>[
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Driving License",
                          style: TextStyle(fontSize: 10.0),
                        ),
                        subtitle: TextField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Nationality",
                          style: TextStyle(fontSize: 10.0),
                        ),
                        subtitle: TextField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: const <Widget>[
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Place Of Birth",
                          style: TextStyle(fontSize: 10.0),
                        ),
                        subtitle: TextField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Date Of Birth",
                          style: TextStyle(fontSize: 10.0),
                        ),
                        subtitle: TextField(
                          decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            filled: true,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: Column(children: [
                    const Text("Professional Summary"),
                    const Text(
                        "Write 2-4 short & energetic sentences to interest the reader! Mention your role, experience & most importantly - your biggest achievements, best qualities and skills."),
                    SizedBox(
                      height: 300,
                      child: HtmlElementView(
                        viewType: createdViewId,
                      ),
                    ),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    children: <Widget>[
                      const Text(
                        "Skills",
                        textAlign: TextAlign.left,
                      ),
                      const Text(
                        "Choose 5 of the most important skills to show your talents! Make sure they match the keywords of the job listing if applying via an online system",
                        textAlign: TextAlign.left,
                      ),
                      MultiSelectDialogField(
                        onConfirm: (val) {
                          _selectedAnimals5 = val;
                        },
                        dialogWidth: MediaQuery.of(context).size.width * 0.7,
                        items: _items,
                        initialValue:
                            _selectedAnimals5, // setting the value of this in initState() to pre-select values.
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
