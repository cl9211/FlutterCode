import 'package:flutter/material.dart';

class MultipleTypeList extends StatelessWidget {
  final List<ListItem> items;

  const MultipleTypeList({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) =>
                _showMultipleTypeItem(context, index)),
      ),
    );
  }

  _showMultipleTypeItem(BuildContext context, int index) {
    final item = items[index];
    if (item is HeadingItem) {
      return ListTile(
        title: Text(
          item.heading,
          style: Theme.of(context).textTheme.headline,
        ),
      );
    } else if (item is MessageItem) {
      return ListTile(
        title: Text(item.sender),
        subtitle: Text(item.body),
      );
    }
  }
}

abstract class ListItem {}

class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);
}

class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);
}
