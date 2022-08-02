import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:book_app/app/notifiers/app_notifier.dart';
import 'package:book_app/app/constants/constants.dart';
import 'package:provider/provider.dart';
import 'package:book_app/core/model/DetailModel.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key? key, required this.id, this.boxColor}) : super(key: key);

  var id;
  final Color? boxColor;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 815;
    double width = MediaQuery.of(context).size.width / 375;

    return Scaffold(
      body: Consumer<AppNotifier>(
        builder: ((context, value, child) {
          return widget.id != null
              ? FutureBuilder(
                  future: value.showBookData(id: widget.id),
                  builder: (context, AsyncSnapshot<DetailModel> snapshot) {
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("Opps! Try again Later!"),
                      );
                    }
                    if (snapshot.hasData) {
                      return SingleChildScrollView(
                        child: Column(children: [
                          SizedBox(
                            height: height * 350,
                            child: Stack(
                              children: [
                                Container(
                                  width: double.maxFinite,
                                  height: height * 200,
                                  decoration: BoxDecoration(
                                    color: Colors.blue[200],
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(35),
                                      bottomRight: Radius.circular(35),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  child: Container(
                                    height: height * 20,
                                    alignment: Alignment.center,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image(
                                        image: NetworkImage(
                                          "${snapshot.data?.volumeInfo?.imageLinks?.thumbnail}",
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
                                  top: 70,
                                  left: 16,
                                  child: OutlinedButton.icon(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(Icons.arrow_back),
                                    label: Text(""),
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(width: 1),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        "${snapshot.data?.volumeInfo?.title ?? "Censored"}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 24, color: Colors.blue),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${snapshot.data?.volumeInfo!.authors?.length != 0 ? snapshot.data?.volumeInfo!.authors![0] : "Censored"}"
                                            .toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 24),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 35),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "${snapshot.data?.volumeInfo?.printType}",
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.red),
                                            ),
                                            Spacer(
                                              flex: 1,
                                            ),
                                            Container(
                                              height: height * 35,
                                              width: width * 80,
                                              child: Text(
                                                "\$${snapshot.data?.volumeInfo?.pageCount}",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                            ),
                                            Spacer(),
                                            Text(
                                              "${snapshot.data?.volumeInfo?.pageCount} Pages",
                                              style: TextStyle(
                                                  fontSize: 24,
                                                  color: Colors.orangeAccent),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          OutlinedButton(
                                            onPressed: () async {
                                              Uri url = Uri.parse(
                                                  "${snapshot.data?.volumeInfo?.previewLink}");
                                              if (await canLaunchUrl(url)) {
                                                await launchUrl(url,
                                                    mode: LaunchMode
                                                        .externalApplication);
                                              } else {
                                                throw 'could not launch $url';
                                              }
                                            },
                                            child: const Text(
                                              "View Online",
                                              style: TextStyle(
                                                  fontSize: 23,
                                                  color: Colors.black),
                                            ),
                                            style: OutlinedButton.styleFrom(
                                                side: BorderSide(width: 1)),
                                          ),
                                          OutlinedButton.icon(
                                            onPressed: () {},
                                            style: OutlinedButton.styleFrom(
                                              side: BorderSide(width: 1),
                                            ),
                                            icon: Icon(
                                              Icons.favorite_border_outlined,
                                              color: Colors.black,
                                            ),
                                            label: Text(
                                              "wishlist".toUpperCase(),
                                              style: TextStyle(
                                                  fontSize: 23,
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Details",
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        child: Row(
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Author",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                  "Publisher",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                  "Published Date",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                  "Categorie",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "${snapshot.data?.volumeInfo?.authors?[0]}",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black54),
                                                  ),
                                                  Text(
                                                    "${snapshot.data?.volumeInfo?.publisher}",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black54),
                                                  ),
                                                  Text(
                                                    "${snapshot.data?.volumeInfo?.publishedDate}",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black54),
                                                  ),
                                                  Text(
                                                    "${snapshot.data?.volumeInfo?.categories?[0]}",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.black54),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Discription",
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ReadMoreText(
                                        "${snapshot.data?.volumeInfo?.description}",
                                        trimLines: 6,
                                        colorClickableText: Colors.black54,
                                        trimMode: TrimMode.Line,
                                        trimCollapsedText: '... Read More',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 14),
                                        trimExpandedText: ' Less',
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
                                          Uri url = Uri.parse(
                                              "${snapshot.data?.volumeInfo?.infoLink}");
                                          if (await canLaunchUrl(url)) {
                                            await launchUrl(url,
                                                mode: LaunchMode
                                                    .externalApplication);
                                          } else {
                                            throw 'could not launch $url';
                                          }
                                        },
                                        child: Text(
                                          "Buy",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.black),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ]),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.black54,
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text("Opps No Data Found!"),
                );
        }),
      ),
    );
  }
}
