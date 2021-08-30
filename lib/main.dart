import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ApiWidget(),
    );
  }
}

class ApiWidget extends StatefulWidget {
  ApiWidget({Key? key}) : super(key: key);

  @override
  _ApiWidgetState createState() => _ApiWidgetState();
}

class _ApiWidgetState extends State<ApiWidget> {
  List _todoList = [];

  Future<void> fetchTodo() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    List<dynamic> list = jsonDecode(response.body);

    setState(() {
      _todoList = list;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hi"),
      ),
      body: ListView.builder(
        itemCount: _todoList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_todoList[index]['title']),
          );
        },
      ),
    );
  }
}
