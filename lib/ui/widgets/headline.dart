import 'package:flutter/material.dart';
import 'package:book_app/ui/screen/bookList.dart';

class Headline extends StatelessWidget {
  Headline({Key? key, required this.category, required this.showAll}) : super(key: key);

  String category;
  String showAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            category,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>BookList(name: showAll)));
            },
            child: Text(
              "See All",
              style: TextStyle(fontSize: 18, color: Colors.black54),
            ),
          )
        ],
      ),
    );
  }
}
