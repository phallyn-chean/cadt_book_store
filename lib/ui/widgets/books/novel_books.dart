import 'package:book_app/app/notifiers/app_notifier.dart';
import 'package:book_app/core/model/Books.dart';
import 'package:flutter/material.dart';
import 'package:book_app/ui/screen/detail_screen.dart';
import 'package:provider/provider.dart';

class NovelBooks extends StatelessWidget {
  const NovelBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String errorLink =
        "https://img.freepik.com/free-vector/funny-error-404-background-design_1167-219.jpg?w=740&t=st=1658904599~exp=1658905199~hmac=131d690585e96267bbc45ca0978a85a2f256c7354ce0f18461cd030c5968011c";
    var data = Provider.of<AppNotifier>(context);
    return FutureBuilder(
      future: data.getNovelBooks(),
      builder: (context, AsyncSnapshot<Books> snapshot) {
        if (snapshot.hasError) {
          return const Center(
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
                itemCount: snapshot.data!.items!.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // print(snapshot.data?.items?[index].id);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(id: snapshot.data?.items?[index].id),
                        ),
                      );
                    },
                   child: Container(
                    width: constraints.maxWidth * 0.40,
                    padding:const EdgeInsets.only(left: 16, bottom: 5, top: 5),
                    child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                      children: [
                        Card(
                          elevation: 2,
                          margin: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: SizedBox(
                            height: constraints.maxHeight ,
                            width: constraints.maxWidth * 0.40,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image(
                                image: NetworkImage(snapshot.data?.items?[index].volumeInfo?.imageLinks?.smallThumbnail ?? errorLink),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        

                        Container(
                                    padding: const EdgeInsets.all(5),
                                     decoration: BoxDecoration(
                                       color: Colors.amber ,
                                       borderRadius: BorderRadius.circular(5)
                                     ),
                                     child: Text(
                                      "\$${snapshot.data?.items![index].volumeInfo?.pageCount}",
                                       style: const TextStyle(
                                          fontSize: 14
                                       ),
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
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.black54,
          ),
        );
      },
    );
  }
}
