import 'dart:ui';

import 'package:book_app/ui/screen/bookList.dart';
import 'package:book_app/ui/screen/search_screen.dart';
import 'package:book_app/ui/widgets/books/adventure_books.dart';
import 'package:book_app/ui/widgets/books/anime_books.dart';
import 'package:book_app/ui/widgets/books/horror_books.dart';
import 'package:book_app/ui/widgets/books/novel_books.dart';
import 'package:book_app/ui/widgets/headline.dart';
import 'package:flutter/material.dart';
import 'package:book_app/ui/widgets/books/popular_books.dart';

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
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 245, 250, 255),
                    borderRadius: BorderRadius.circular(20)),
                height: 140,
                child: Column(
                  children: [
                    SafeArea(
                        child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    "CADT ",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 6, 82, 148),
                                    ),
                                  ),
                                   Text(
                                    "Book Club",
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 6, 50, 86),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                "Find Your Favourite Book Here",
                                style:
                                    TextStyle(fontSize: 15, color: Colors.grey),
                              )
                            ],
                          ),
                          Image.network(
                            "https://toppng.com/public/uploads/thumbnail/experience-the-discussion-online-library-book-logo-11562996058ip1or4eqvs.png",
                            width: 75,
                          )
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {
                  //input search
                  showSearch(
                      context: context, delegate: CustomSearchDelegate());
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  height: 50,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Search for Books"),
                      Icon(Icons.search_rounded)
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),


            const ListTile(
              leading: Icon(
                Icons.book,
                color: Color.fromARGB(255, 255, 66, 126),
                size: 30,
              ),
              title: Text(
                "Anime",
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text("Most Popular Anime In Japan"),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: height / 3.4,
              child: const AnimeBooks(),
            ),

            const SizedBox(
              height: 20,
            ),
            const ListTile(
              leading: Icon(
                Icons.book,
                color: Color.fromARGB(255, 209, 149, 0),
                size: 30,
              ),
              title: Text(
                "Action & Adventurre",
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text("Go Throw An Exciting Journey With Us"),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: height / 3.4,
              child: const AdventureBooks(),
            ),

            const SizedBox(
              height: 20,
            ),
            const ListTile(
              leading: Icon(
                Icons.book,
                color: Color.fromARGB(255, 0, 0, 0),
                size: 30,
              ),
              title: Text(
                "Novel",
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text("Release Your Stress With These Novel"),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: height / 3.4,
              child: const NovelBooks(),
            ),
            const SizedBox(
              height: 20,
            ),

            const ListTile(
              leading: Icon(
                Icons.book,
                color: Color.fromARGB(255, 154, 0, 0),
                size: 30,
              ),
              title: Text(
                "Horror",
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text("Watch behind Your back"),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: height / 3.4,
              child: const HorrorBooks(),
            
            ),
          ],
        ),
      ),
    );
  }
}
