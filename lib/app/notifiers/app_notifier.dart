import 'dart:convert';

import 'package:book_app/core/api/api.dart';
import 'package:book_app/core/model/Books.dart';
import 'package:book_app/core/model/DetailModel.dart';
import 'package:flutter/cupertino.dart';

class AppNotifier extends ChangeNotifier {
  final BookApi bookApi = BookApi();
//Main api Books
  Future<Books> getBookData() async {
    var res = await bookApi.getBooks();
    //print(res);
    var data = jsonDecode(res);
    // print(data["items"][0]["volumeInfo"]["authors"]);
    // data["items"];

    return Books.fromJson(data);
  }

//Anime Books
  Future<Books> getAnimeBooks() async {
    var res = await bookApi.getAnimeBook();
    //print(res);
    var data = jsonDecode(res);

    return Books.fromJson(data);
  }

//Adventure Books
  Future<Books> getAdventureBooks() async {
    var res = await bookApi.getAdventureBook();
    //print(res);
    var data = jsonDecode(res);

    return Books.fromJson(data);
  }

  //Novel
  Future<Books> getNovelBooks() async {
    var res = await bookApi.getNovelBook();
    //print(res);
    var data = jsonDecode(res);

    return Books.fromJson(data);
  }

  //Horror Books
  Future<Books> getHorrorBooks() async {
    var res = await bookApi.getHorrorBook();
    //print(res);
    var data = jsonDecode(res);

    return Books.fromJson(data);
  }

//Searching Books
  Future<Books> searchBookData({required String searchBook}) async {
    var res = await bookApi.searchBooks(searchBook: searchBook);
    //print(res);
    var data = jsonDecode(res);

    return Books.fromJson(data);
  }

//Showing Particular Book Details
  Future<DetailModel> showBookData({required String id}) async {
    var res = await bookApi.showBooksDetails(id: id);
    //print(res);
    var data = jsonDecode(res);

    return DetailModel.fromJson(data);
  }
}