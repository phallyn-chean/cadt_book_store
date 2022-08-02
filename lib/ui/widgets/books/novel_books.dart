import 'package:flutter/material.dart';
import 'package:book_app/ui/screen/detail_screen.dart';

class NovelBooks extends StatelessWidget {
  const NovelBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, AsyncSnapshot snapshot){
        if (snapshot.hasError){
          return Center(
            child: Text(
              "Opps! Try again Later!",
            ),
          );
        }
        if (snapshot.hasData){
          return LayoutBuilder(
            builder: (context, constraints){
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.items.lenght,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: () {

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
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: SizedBox(
                              height: constraints.maxHeight * 0.6,
                              width: constraints.maxWidth * 0.25,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image(
                                  image: NetworkImage(
                                    ""
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "",
                            style: TextStyle(fontSize: constraints.maxWidth * 0.035, fontWeight: FontWeight.w500),
                          ),
                          Container(
                            height: constraints.maxHeight * 0.1,
                            width: constraints.maxWidth * 0.18,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black
                            ),
                            child: Text(
                              "",
                              style: TextStyle(fontSize: constraints.maxWidth * 0.035, color: Colors.white),
                            ),
                          ),
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
