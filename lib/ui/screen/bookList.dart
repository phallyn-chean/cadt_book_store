import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class BookList extends StatelessWidget {
  BookList({Key? key, required this.name}) : super(key: key);

  String name;
  final _random = math.Random();


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 815;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          name,style: TextStyle(fontSize: 25),
        ),
      ),
      // body: Consumer(
      //   builder: (context, value, child){
      //     return FutureBuilder(
      //       builder: (context, AsyncSnapshot snapshot) {
      //         if (snapshot.hasError){
      //           return Center(
      //             child: Text("Opps! Try Again later!"),
      //           );
      //         }
      //         if (snapshot.hasData){
      //
      //           return GridView.builder(
      //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 2,
      //               mainAxisExtent: 260,
      //               crossAxisSpacing: 0,
      //               mainAxisSpacing: 0,
      //             ),
      //             itemBuilder: (context, index){
      //               return Padding(
      //                 padding: EdgeInsets.all(16),
      //                 child: GestureDetector(
      //                   onTap: () {},
      //                   child: Container(
      //                     height: 250,
      //                     decoration: BoxDecoration(
      //                       borderRadius: BorderRadius.circular(12)
      //                     ),
      //                     child: LayoutBuilder(
      //                       builder: (context, constraints){
      //                         return Column(
      //                           crossAxisAlignment: CrossAxisAlignment.start,
      //                           children: [
      //                             SizedBox(
      //                               height: constraints.maxHeight / 2,
      //                               child: Stack(
      //                                 alignment: Alignment.topCenter,
      //                                 children: [
      //                                   Container(
      //                                     height: constraints.maxHeight / 2.5,
      //                                     decoration: BoxDecoration(
      //                                       //color: boxColors[_random.nextInt(7)],
      //                                       borderRadius: BorderRadius.circular(12),
      //                                     ),
      //                                   ),
      //                                   Positioned(
      //                                     top: 0,
      //                                     child: Card(
      //                                       margin: EdgeInsets.zero,
      //                                       shape: RoundedRectangleBorder(
      //                                         borderRadius: BorderRadius.circular(12),
      //                                       ),
      //                                       child: SizedBox(
      //                                         child: ClipRRect(
      //                                           borderRadius: BorderRadius.circular(12),
      //                                           child: Image(
      //                                             height: constraints.maxHeight / 2,
      //                                             width: constraints.maxWidth / 2,
      //                                             image: NetworkImage(
      //                                               ""
      //                                             ),fit: BoxFit.fill,
      //                                           )
      //                                         ),
      //                                       ),
      //                                     ),
      //                                   ),
      //                                 ],
      //                               ),
      //                             ),
      //                             Padding(
      //                               padding: EdgeInsets.all(5.0),
      //                               child: Column(
      //                                 crossAxisAlignment: CrossAxisAlignment.start,
      //                                 children: [
      //                                   Text("",
      //                                     maxLines: 1,
      //                                     style: Theme.of(context).textTheme.headline4 ?.copyWith(fontSize: constraints.maxWidth * 0.09),
      //                                   ),
      //                                 ],
      //                               ),
      //                             )
      //                           ],
      //                         );
      //                       },
      //                     ),
      //                   ),
      //                 ),
      //               );
      //             },
      //           );
      //         }
      //       },
      //     );
      //   },
      // )
    );
  }
}
