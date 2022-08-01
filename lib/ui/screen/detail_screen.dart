import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key? key, required this.id, this.boxColor}) : super(key: key);

  var id;
  final Color ? boxColor;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Consumer (
        builder: ((context, value, child){
          return widget.id != null ? FutureBuilder(
            builder:  (context, AsyncSnapshot snapshot){
              if (snapshot.hasError){
                return Center(
                  child: Text("Opps! Try again later!"),
                );
              }
              if (snapshot.hasData){
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 200,
                        child: Stack(
                          children: [
                            Container(
                              width: width * 200,
                              height: height * 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(35),
                                  bottomLeft: Radius.circular(35),
                                ),
                                color: widget.boxColor ?? const Color(0xffF9CFE3),
                              ),
                            ),
                            Positioned(
                              child: Container(
                                height: height * 250,
                                alignment: Alignment.center,
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
                              left: 0,
                              right: 0,
                              bottom: 0,
                            ),
                            Positioned(
                              child: OutlinedButton.icon(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: OutlinedButton.styleFrom(
                                  side: BorderSide(width: 1),
                                ),
                                icon: Icon(Icons.arrow_back,
                                  color: Colors.black,
                                ),
                                label: Text(
                                  "",
                                ),
                              ),
                              top: 70,
                              left: 16,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 24, color: Colors.blue),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "".toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 24),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 35),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("",
                                    style: TextStyle(fontSize: 24, color: Colors.red),
                                  ),
                                  Spacer(
                                    flex: 1,
                                  ),
                                  Container(
                                    height: height * 35,
                                    width: width * 80,
                                    child: Text(
                                      "",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(12)
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "",
                                    style: TextStyle(fontSize: 24, color: Colors.orangeAccent),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                OutlinedButton(onPressed: () {},
                                  child: const Text(
                                    "View Online",
                                    style: TextStyle(fontSize: 23, color: Colors.black),
                                  ),
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(width: 1)
                                  ),
                                ),
                                OutlinedButton.icon(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(width: 1),
                                  ),
                                  icon: Icon(Icons.favorite_border_outlined,color: Colors.black,),
                                  label: Text(
                                    "wishlist".toUpperCase(),
                                    style: TextStyle(fontSize: 23, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Details",
                              style: TextStyle(fontSize: 25, color: Colors.black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              child: Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Author",
                                        style: TextStyle(fontSize: 18, color: Colors.black),
                                      ),
                                      Text(
                                        "Publisher",
                                        style: TextStyle(fontSize: 18, color: Colors.black),
                                      ),
                                      Text(
                                        "Published Date",
                                        style: TextStyle(fontSize: 18, color: Colors.black),
                                      ),
                                      Text(
                                        "Categorie",
                                        style: TextStyle(fontSize: 18, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 15,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "",
                                          style: TextStyle(fontSize: 16, color: Colors.black54),
                                        ),
                                        Text(
                                          "",
                                          style: TextStyle(fontSize: 16, color: Colors.black54),
                                        ),
                                        Text(
                                          "",
                                          style: TextStyle(fontSize: 16, color: Colors.black54),
                                        ),
                                        Text(
                                          "",
                                          style: TextStyle(fontSize: 16, color: Colors.black54),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            Text(
                              "Discription",
                              style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10,),
                            ReadMoreText(
                              "",
                              trimLines: 6,
                              colorClickableText: Colors.black54,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: '... Read More',
                              style: TextStyle(color: Colors.black, fontSize: 14),
                              trimExpandedText: ' Less',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(onPressed: () {},
                              child: Text(
                                "Buy",
                                style: TextStyle(color: Colors.white,fontSize: 18),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.black
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            },
          ): Center(
            child: Text("Opps No Data Found"),
          );
        }
        ),
      ),
    );
  }

  Consumer({required Function(dynamic context, dynamic value, dynamic child) builder}) {}
}
