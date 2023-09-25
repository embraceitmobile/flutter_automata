import 'package:flutter/material.dart';
import 'package:flutter_automate/painter/draggable_area.dart';
import 'package:flutter_automate/painter/open_painter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  final draggableList = [];

  void _addDraggableWidget() {
    setState(() {
      draggableList.add(const DraggableArea());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: draggableList.length,
          itemBuilder: (context, index) {
            final item = draggableList[index];
            return item;
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addDraggableWidget,
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }
}
