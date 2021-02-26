import 'package:flutter/material.dart';

class ListSet extends StatefulWidget {
  @override
  _ListSet createState() => _ListSet();
}

class _ListSet extends State<ListSet> {
  List<ListItem> _dropdownItems = [
    ListItem(1, "GeeksforGeeks"),
    ListItem(2, "Javatpoint"),
    ListItem(3, "tutorialandexample"),
    ListItem(4, "guru99"),
    ListItem(5, "guru"),
    ListItem(6, "Hello"),
    ListItem(7, "Hai"),
    ListItem(8, "How"),
    ListItem(9, "Love"),
  ];

  List<DropdownMenuItem<ListItem>> _dropdownMenuItems;

  ListItem _itemSelected;

  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropDownMenuItems(_dropdownItems);

    _itemSelected = _dropdownMenuItems[5].value;
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItem1(List listItems) {
    List<DropdownMenuItem<ListItem>> items = List();
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(listItem.name),
          value: listItem,
        ),
      );
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DropDown Button Example"),
      ),
      body: Column(
        children: <Widget>[
          Text("We have selected ${_itemSelected.name}"),
        ],
      ),
    );
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
