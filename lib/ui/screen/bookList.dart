
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;
import 'package:book_app/app/notifiers/app_notifier.dart';
import 'package:book_app/ui/screen/detail_screen.dart';
import 'package:book_app/core/model/Books.dart';

class BookList extends StatelessWidget {
  BookList({Key? key, required this.name}) : super(key: key);

  String name;
  final _random = math.Random();

  @override
  Widget build(BuildContext context) {
    //double height = MediaQuery.of(context).size.height / 815;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          name,
          style: const TextStyle(fontSize: 25),
        ),
      ),
      body: Consumer<AppNotifier>(
        builder: (context, value, child) {
          return FutureBuilder(
            future: value.searchBookData(searchBook: name),
            builder: (context, AsyncSnapshot<Books> snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text("Opps! Try Again later!"),
                );
              }
              if (snapshot.hasData) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 260,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 20,
                  ),
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailScreen(
                                id: snapshot.data?.items?[index].id,
                                // boxColor: boxColors[_random.nextInt(7)],
                              ),
                            ),
                          );
                        },
                        child: Card(
                          elevation:5,
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return Stack(
                                alignment: AlignmentDirectional.topEnd,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      "${snapshot.data?.items![index].volumeInfo!.imageLinks!.thumbnail}",
                                      width: constraints.maxWidth,
                                      height: constraints.maxHeight ,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                   Container(
                                    padding: const EdgeInsets.all(5),
                                     decoration: BoxDecoration(
                                       color: Colors.amber ,
                                       borderRadius: BorderRadius.circular(5)
                                     ),
                                     child: Text("\$${snapshot.data?.items![index].volumeInfo?.pageCount}"),
                                   )
                                
                                ],
                              );
                            
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
