import 'package:book_app/app/notifiers/app_notifier.dart';
import 'package:book_app/ui/screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:book_app/core/model/Books.dart';
import 'dart:math' as math;

import 'package:provider/provider.dart';

class CustomSearchDelegate extends SearchDelegate {
  final _random = math.Random();

  String errorLink =
      "https://img.freepik.com/free-vector/funny-error-404-background-design_1167-219.jpg?w=740&t=st=1658904599~exp=1658905199~hmac=131d690585e96267bbc45ca0978a85a2f256c7354ce0f18461cd030c5968011c";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;

    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer<AppNotifier>(
      builder: (context, value, child) {
        return FutureBuilder(
          future: value.searchBookData(searchBook: query),
          builder: (context, AsyncSnapshot<Books> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Opps! Try again later!"),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.items?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            id: snapshot.data?.items?[index].id,
                            boxColor: Color.fromARGB(255, 218, 229, 241),
                          ),
                        ),
                      );
                    },
                    leading: Image.network(
                      "${snapshot.data?.items?[index].volumeInfo?.imageLinks?.thumbnail ?? errorLink}",
                    ),
                    title: Text(
                      "${snapshot.data?.items![index].volumeInfo!.authors?.length != 0 ? snapshot.data?.items![index].volumeInfo!.authors![0] : "Not Found"}"
                    ),
                    subtitle: Text("${snapshot.data?.items![index].volumeInfo?.title}"),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          },
        );
        throw UnimplementedError();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer(
      builder: (context, value, child) {
        return FutureBuilder(
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Opps! Try again Later",
                ),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            id: snapshot.data?.items?[index].id,
                            boxColor: Color.fromARGB(255, 218, 229, 241),
                          ),
                        ),
                      );
                    },
                    leading: Image.network(""),
                    title: Text(""),
                    subtitle: Text(""),
                  );
                },
                itemCount: 10,
              );
            }
            return Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            );
          },
        );
      },
    );
    throw UnimplementedError();
  }
}
