import 'package:flutter/material.dart';


class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<ListItem> foodtype = [
    ListItem("sandwich ", "ขนมปังแซนด์วิช"),
    ListItem("pizza ", "พิซซ่า"),
    ListItem("hamburger ", "แฮมเบอร์เกอร์"),
    ListItem("steak ", "เนื้อสเต็ก"),
  ];

  late ListItem _selectedItem;

  late List<DropdownMenuItem<ListItem>> _dropdownMenuItems;

  @override
  void initState() {
    super.initState();
    _dropdownMenuItems = buildDropdownMenuItem(foodtype);
    _selectedItem = _dropdownMenuItems[0].value!;
  }

  List<DropdownMenuItem<ListItem>> buildDropdownMenuItem(
      List<ListItem> foodtype) {
    return foodtype.map((ft) {
      return DropdownMenuItem(
        value: ft,
        child: Text(ft.name),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lab07 Dropdown"),
      ),
      body: Column(
        children: [
          const Text("เลือกประเภทอาหาร"),
          DropdownButton<ListItem>(
            value: _selectedItem,
            items: _dropdownMenuItems,
            onChanged: (value) {
              setState(() {
                _selectedItem = value!;
              });
            },
          )
        ],
      ),
    );
  }
}

class ListItem {
  String value;
  String name;

  ListItem(this.value, this.name);
}
