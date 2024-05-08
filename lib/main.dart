import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random ListView Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RandomListView(),
    );
  }
}

class RandomListView extends StatefulWidget {
  @override
  _RandomListViewState createState() => _RandomListViewState();
}

class _RandomListViewState extends State<RandomListView> {
  List<String> _items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User ListView Example'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_items[index]),
            onTap: () {
              _showDialog(_items[index]);
            },
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                _removeItem(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }

  void _addItem() {
    // setState(() {
    //   _items.add(_generateRandomString());
    // });
    
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  String _generateRandomString() {
    const String chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    Random random = Random();
    String result = '';
    for (int i = 0; i < 5; i++) {
      result += chars[random.nextInt(chars.length)];
    }
    return result;
  }

  void _showDialog(String item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Item choisi'),
          content: Text(item),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

