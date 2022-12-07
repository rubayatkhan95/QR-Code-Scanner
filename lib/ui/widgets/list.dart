// ignore_for_file: unnecessary_const, unused_element, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:qr_code_scanner_app/ui/widgets/card.dart';
import '../../config/app_constants.dart';

class ListGridView extends StatefulWidget {
  const ListGridView({Key? key}) : super(key: key);

  @override
  _ListGridViewState createState() => _ListGridViewState();
}

class _ListGridViewState extends State<ListGridView> {
  @override
  Widget build(BuildContext context) {
    return _gridView();
  }

  Widget _gridView() {
    var items = userList;
    return GridView.builder(
        padding: const EdgeInsets.all(20.0),
        // ignore: prefer_const_constructors
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        itemBuilder: (context, index) => CardSquare(
              title: items[index].toString(),
              icon: Icon(Icons.code),
              onTap: () {},
            ),
        itemCount: items.length);
  }
}
