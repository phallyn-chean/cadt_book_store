import 'package:book_app/app/notifiers/app_notifier.dart';
import 'package:book_app/ui/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const BookApp());
}

class BookApp extends StatelessWidget {
  const BookApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppNotifier()),
      ],
      child:const  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CADT Book Store',
        home: MainScreen(),
      ),
    );
  }
}
