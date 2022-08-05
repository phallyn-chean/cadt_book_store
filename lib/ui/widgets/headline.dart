import 'package:flutter/material.dart';
import 'package:book_app/ui/screen/bookList.dart';

class Headline extends StatelessWidget {
  Headline({Key? key, required this.category, required this.subtitle, }) : super(key: key);

  String category;
  String subtitle;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 20, 16, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Text(
          //   category,
          //   style:const  TextStyle(fontSize: 20, color: Colors.black),
          // ),
         ListTile(
             
              title: Text(subtitle),
              subtitle: Text(subtitle),
          )
          // InkWell(
          //   onTap: () {
          //     Navigator.push(context, MaterialPageRoute(builder: (context)=>BookList(name: showAll)));
          //   },
          //   child: Text(
          //     "See All",
          //     style: TextStyle(fontSize: 18, color: Colors.black54),
          //   ),
          // )
        ],
      ),
    );
  }
}
