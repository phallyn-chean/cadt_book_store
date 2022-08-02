import 'package:flutter/material.dart';
import 'package:book_app/ui/screen/detail_screen.dart';
import 'package:provider/provider.dart';

class HorrorBooks extends StatelessWidget {
  const HorrorBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String errorLink =
        "https://img.freepik.com/free-vector/funny-error-404-background-design_1167-219.jpg?w=740&t=st=1658904599~exp=1658905199~hmac=131d690585e96267bbc45ca0978a85a2f256c7354ce0f18461cd030c5968011c";
    var data = Provider.of(context);
    return FutureBuilder(
      builder: (context, AsyncSnapshot snapshot){
        if (snapshot.hasError){
          return Center(
            child: Text(
              "Opps! Try again Later!"
            ),
          );
        }
        if (snapshot.hasData){
          return LayoutBuilder(
            builder: (context, constraints){
              return ListView.builder(
                itemCount: snapshot.data!.items!.lenght,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: constraints.maxWidth * 0.30,
                      padding: EdgeInsets.only(left: 16, bottom: 5, top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Card(
                            elevation: 2,
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
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: Text(
                              "",
                              style: TextStyle(fontSize: constraints.maxWidth * 0.035, color: Colors.white),
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
