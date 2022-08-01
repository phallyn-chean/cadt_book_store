import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
final TextEditingController searchController = TextEditingController();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height / 2,
              child: Stack(
                children: [
                  Container(
                    height: height / 2.5,
                    decoration: BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(45),
                        bottomRight: Radius.circular(45),
                      ),
                    ),
                    child: SafeArea(
                      minimum: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Spacer(),
                          Text("CADT BooK Store", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              //input search
                            },
                            child: Container(
                              padding: EdgeInsets.all(12),
                              height: 50,
                              width: double.maxFinite,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  width: 1,
                                  color: Colors.black
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Search for Books"),
                                  Icon(Icons.search_rounded)
                                ],
                              ),
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Most Popular',style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                              InkWell(
                                onTap: () {},
                                child: Text(
                                  'See All',style: TextStyle(fontSize: 20, color: Colors.black54),
                                ),
                              ),
                            ],
                          ),
                          Spacer(
                            flex: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: height / 5.3,
                      margin: EdgeInsets.only(left: 16),
                    ),
                  ),
                ],
              ),
            ),
            // Headline(
            //   category = "Anime",
            //   showAll = "Anime"
            // )
            SizedBox(
              height: height / 3.4,
              //child = AnimeBooks(),
            ),
            // Headline(
            //   category = "Action & Adventure",
            //   showAll = "Action & Adventure",
            // ),
            SizedBox(
              height: height / 3.4,
              //child: AdventureBooks(),
            ),
            // Headline(
            //   category = "Novel",
            //   seeAll = "Novel",
            // ),
            SizedBox(height: height / 3.4,
              //child: NovelBooks(),
            ),
            // Headline(
            //   category = "Horror",
            //   seeAll = "Horror",
            // ),
            SizedBox(
              height: height / 3.4,
              //child: HorrorBooks(),
            ),
          ],
        ),
      ),
    );
  }
}
