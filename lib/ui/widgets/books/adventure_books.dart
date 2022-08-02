import 'package:flutter/material.dart';
import 'package:book_app/ui/screen/detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:book_app/core/model/Books.dart';
import 'package:book_app/app/notifiers/app_notifier.dart';

class AdventureBooks extends StatelessWidget {
  const AdventureBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String errorlink =
        "https://img.freepik.com/free-vector/funny-error-404-background-design_1167-219.jpg?w=740&t=st=1658904599~exp=1658905199~hmac=131d690585e96267bbc45ca0978a85a2f256c7354ce0f18461cd030c5968011c";
    var data = Provider.of<AppNotifier>(context);
    return FutureBuilder(
      future: data.getAdventureBooks(),
      builder: (context, AsyncSnapshot<Books> snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Opps! Try again Later!"),
          );
        }
        if (snapshot.hasData) {
          return LayoutBuilder(builder: (context, constraints) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data!.items!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DetailScreen(id: snapshot.data?.items?[index].id),
                      ),
                    );
                  },
                  child: Container(
                    width: constraints.maxWidth * 0.30,
                    padding: EdgeInsets.only(left: 16, bottom: 5, top: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          elevation: 2,
                          margin: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: SizedBox(
                            height: constraints.maxHeight * 0.6,
                            width: constraints.maxWidth * 0.25,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image(
                                image: NetworkImage("${snapshot.data?.items?[index].volumeInfo?.imageLinks?.smallThumbnail ?? errorlink}"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "${snapshot.data?.items![index].volumeInfo?.title}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: constraints.maxWidth * 0.035,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        Container(
                          height: constraints.maxHeight * 0.1,
                          width: constraints.maxWidth * 0.18,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.black,
                          ),
                          child: Text(
                            "\$${snapshot.data?.items![index].volumeInfo?.pageCount}",
                            style: TextStyle(
                                fontSize: constraints.maxWidth * 0.035,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          });
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
