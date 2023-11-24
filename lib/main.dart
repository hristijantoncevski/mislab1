import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '192041',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.grey,
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '192041'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> courses = ["Mobilni informaciski sistemi", "Mobilni platformi i programiranje","Presmetuvanje vo oblak","Mrezna i mobilna forenzika"];

  void addCourse() {
    showDialog(context: context, builder: (BuildContext context) {
      String newCourse = "";
      return AlertDialog(
        title: const Text("Add a new course"),
        content: TextField(
          onChanged: (value){
            newCourse = value;
          },
        ),
        actions: [
          ElevatedButton(
              onPressed: (){
                setState(() {
                if(newCourse.isNotEmpty){
                  courses.add(newCourse);
                }
                Navigator.pop(context);
              });
          }, child: const Text("Add"))
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              title: Text(courses[index]),
              trailing: IconButton(
                icon: Icon(Icons.delete_rounded), onPressed: (){
                  setState(() {
                    courses.removeAt(index);
                  });
              }),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addCourse,
        backgroundColor: Colors.blueGrey,
        child: const Icon(Icons.add),
      ),
    );
  }
}
