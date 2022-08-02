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

    );
  }
}
