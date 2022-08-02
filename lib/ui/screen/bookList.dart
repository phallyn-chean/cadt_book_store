import 'package:book_app/app/constants/constants.dart';
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
                    mainAxisSpacing: 0,
                  ),
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
                                boxColor: boxColors[_random.nextInt(7)],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: 250,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12)),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: constraints.maxHeight / 2,
                                    child: Stack(
                                      alignment: Alignment.topCenter,
                                      children: [
                                        Container(
                                          height: constraints.maxHeight / 2.5,
                                          decoration: BoxDecoration(
                                            //color: boxColors[_random.nextInt(7)],
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          child: Card(
                                            margin: EdgeInsets.zero,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: SizedBox(
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  child: Image(
                                                    height:
                                                        constraints.maxHeight /
                                                            2,
                                                    width:
                                                        constraints.maxWidth /
                                                            2,
                                                    image: NetworkImage(
                                                      "${snapshot.data?.items![index].volumeInfo!.imageLinks!.thumbnail}",
                                                    ),
                                                    fit: BoxFit.fill,
                                                  )),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${snapshot.data?.items![index].volumeInfo!.authors?.length != 0 ? snapshot.data?.items![index].volumeInfo!.authors![0] : "Not Found"}",
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4
                                              ?.copyWith(
                                                fontSize:
                                                    constraints.maxWidth * 0.09,
                                              ),
                                        ),
                                        Text(
                                          "${snapshot.data?.items![index].volumeInfo?.title}",
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4
                                              ?.copyWith(
                                                fontSize:
                                                    constraints.maxWidth * 0.09,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                        Container(
                                          height: constraints.maxHeight * 0.13,
                                          width: constraints.maxWidth * 0.35,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            "\$${snapshot.data?.items![index].volumeInfo?.pageCount}",
                                            style: TextStyle(
                                                fontSize:
                                                    constraints.maxWidth * 0.08,
                                                color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
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
