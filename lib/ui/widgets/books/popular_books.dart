import 'package:book_app/app/notifiers/app_notifier.dart';
import 'package:book_app/core/model/Books.dart';
import 'package:flutter/material.dart';
import 'package:book_app/ui/screen/detail_screen.dart';
import 'package:provider/provider.dart';

class PopularBooks extends StatelessWidget {
  const PopularBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<AppNotifier>(context);
    return FutureBuilder(
      future: data.getBookData(),
      builder: (context, AsyncSnapshot<Books> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              "Opps! Try again Later!",
            ),
          );
        }
        if (snapshot.hasData) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 30,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(id: snapshot.data?.items![index].id),
                        ),
                      );
                    },
                    child: Container(
                      width: constraints.maxWidth * 0.8,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Card(
                                elevation: 2,
                                margin: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                child: Container(
                                  height: constraints.maxHeight,
                                  width: constraints.maxWidth * 0.30,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image(
                                      image: NetworkImage("${snapshot.data?.items![index].volumeInfo?.imageLinks?.thumbnail}"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: constraints.maxWidth * 0.03,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${snapshot.data?.items![index].volumeInfo?.authors?.length != 0 ? snapshot.data?.items![index].volumeInfo?.authors![0] : "Censored"}",
                                  style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.038,
                                      color: Colors.black),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "${snapshot.data?.items![index].volumeInfo?.title}",
                                  style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.048,
                                      color: Colors.black),
                                ),
                                Text(
                                  "${snapshot.data?.items![index].volumeInfo!.categories?.length != 0 ? snapshot.data?.items![index].volumeInfo!.categories![0] : "Unknown"}",
                                  style: TextStyle(
                                      fontSize: constraints.maxWidth * 0.038,
                                      color: Colors.black),
                                ),
                                Spacer(),
                                Container(
                                  height: constraints.maxHeight * 0.2,
                                  width: constraints.maxWidth * 0.18,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    "\$${snapshot.data?.items![index].volumeInfo?.pageCount ?? "96.9"}",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  ),
                                ),
                                Spacer(
                                  flex: 1,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        }
        return Center(
          child: CircularProgressIndicator(
            color: Colors.black54,
          ),
        );
      },
    );
  }
}
