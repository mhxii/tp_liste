import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ListView avec saisie utilisateur',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserInputListView(),
    );
  }
}

class UserInputListView extends StatefulWidget {
  @override
  _UserInputListViewState createState() => _UserInputListViewState();
}

class _UserInputListViewState extends State<UserInputListView> {
  List<String> _items = [];
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste avec nos mots'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Entrez un mot ou une phrase',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addItem,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
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
          ),
        ],
      ),
    );
  }

  void _addItem() {
    String newItem = _textController.text;
    if (newItem.isNotEmpty) {
      setState(() {
        _items.add(newItem);
        _textController.clear(); // Efface le texte après ajout
      });
    }
  }

  void _removeItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
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
