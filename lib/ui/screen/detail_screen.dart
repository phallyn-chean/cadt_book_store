import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:book_app/app/notifiers/app_notifier.dart';
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
                        child: Column(
                          children: [
                            SizedBox(
                              height: height * 350,
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.maxFinite,
                                    height: height * 200,
                                    decoration: BoxDecoration(
                                      color: widget.boxColor ?? const Color(0xffF9CFE3),
                                      borderRadius:const BorderRadius.only(
                                        bottomRight: Radius.circular(35),
                                        bottomLeft: Radius.circular(35),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    bottom: 0,
                                    child: Container(
                                      height: height * 250,
                                      alignment: Alignment.center,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image(
                                          image: NetworkImage(
                                              "${snapshot.data?.volumeInfo?.imageLinks?.thumbnail}"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 30,
                                    left: 16,
                                    child: OutlinedButton.icon(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: OutlinedButton.styleFrom(
                                          side:const BorderSide(width: 1)),
                                      icon:const Icon(
                                        Icons.arrow_back,
                                        color: Colors.black,
                                      ),
                                      label:const Text(""),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              padding:const EdgeInsets.all(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    "${snapshot.data?.volumeInfo?.title ?? "Censored"}",
                                    textAlign: TextAlign.center,
                                    style:const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "${snapshot.data?.volumeInfo!.authors?.length != 0 ? snapshot.data?.volumeInfo!.authors![0] : "Censored"}"
                                        .toUpperCase(),
                                    textAlign: TextAlign.center,
                                    style:const TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 35),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${snapshot.data?.volumeInfo?.printType}",
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                        const Spacer(
                                          flex: 2,
                                        ),
                                        Container(
                                          height: height * 35,
                                          width: width * 80,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Text(
                                            "\$${snapshot.data?.volumeInfo?.pageCount}",
                                            style:
                                                const TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        const Spacer(),
                                        Text(
                                          "${snapshot.data?.volumeInfo?.pageCount} Pages",
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
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
                                        style: OutlinedButton.styleFrom(
                                            side: const BorderSide(width: 1)),
                                        child:const Text(
                                          "VIEW ONLINE",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                      OutlinedButton.icon(
                                        onPressed: () {},
                                        icon:const Icon(
                                            Icons.favorite_border_outlined),
                                        label:const Text(
                                          "WISHLIST",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    "Details",
                                    style: TextStyle(fontSize: 22),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              "Author",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Text(
                                              "Publisher",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Text(
                                              "Publisher Date",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                            Text(
                                              "Categorie",
                                              style: TextStyle(fontSize: 18),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${snapshot.data?.volumeInfo?.authors?[0]}",
                                                style: const TextStyle(
                                                    fontSize: 16),
                                              ),
                                              Text(
                                                "${snapshot.data?.volumeInfo?.publisher}",
                                                style: const TextStyle(
                                                    fontSize: 16),
                                              ),
                                              Text(
                                                "${snapshot.data?.volumeInfo?.publishedDate}",
                                                style: const TextStyle(
                                                    fontSize: 16),
                                              ),
                                              Text(
                                                "${snapshot.data?.volumeInfo?.categories}",
                                                style: const TextStyle(
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Text(
                                    "Discription",
                                    style: TextStyle(fontSize: 22),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ReadMoreText(
                                    "${snapshot.data?.volumeInfo?.description}",
                                    trimLines: 6,
                                    colorClickableText: Colors.black,
                                    trimMode: TrimMode.Line,
                                    trimCollapsedText: '...Read More',
                                    style: const TextStyle(fontSize: 14),
                                    trimExpandedText: ' less',
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ElevatedButton(
                                    onPressed: () async {
                                      Uri url = Uri.parse(
                                          "${snapshot.data?.volumeInfo?.infoLink}");
                                      if (await canLaunchUrl(url)) {
                                        await launchUrl(url,
                                            mode:
                                                LaunchMode.externalApplication);
                                      } else {
                                        throw 'could not launch $url';
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.black),
                                    child:const Text(
                                      "Buy",
                                      style:TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
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
