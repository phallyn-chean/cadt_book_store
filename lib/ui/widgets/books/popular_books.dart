import 'package:flutter/material.dart';
import 'package:book_app/ui/screen/detail_screen.dart';

class PopularBooks extends StatelessWidget {
  const PopularBooks({Key? key}) : super(key: key);

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
                itemCount: 30,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: () {},
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
                                  borderRadius: BorderRadius.circular(12)
                                ),
                                child: Container(
                                  height: constraints.maxHeight,
                                  width: constraints.maxWidth * 0.30,

                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image(
                                      image: NetworkImage(
                                        ""
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: constraints.maxWidth * 0.03,),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "",
                                  style: TextStyle(fontSize: constraints.maxWidth * 0.038, color: Colors.black),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "",
                                  style: TextStyle(fontSize: constraints.maxWidth * 0.048, color: Colors.black),
                                ),
                                Text(
                                  "",
                                  style: TextStyle(fontSize: constraints.maxWidth * 0.038, color: Colors.black),
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
                                    "",
                                    style: TextStyle(fontSize: 18, color: Colors.white),
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
