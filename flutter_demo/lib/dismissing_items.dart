import 'package:flutter/material.dart';

class DismissingItems extends StatefulWidget {
  @override
  _DismissingItemsState createState() => _DismissingItemsState();
}

class _DismissingItemsState extends State<DismissingItems> {
  final items = List<String>.generate(20, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dismissing Items',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dismissing Items'),
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
          final item = items[index];
          return Dismissible(
              key: Key(item),
              onDismissed: (DismissDirection direction) {
                setState(() {
                  items.removeAt(index);
                });

                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('$item dismissed')));
              },
              background: Container(
                color: Colors.red,
              ),
              child: ListTile(
                title: Text('$item'),
              ));
        }),
      ),
    );
  }
}
