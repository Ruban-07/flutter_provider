import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:explore_provider/home.dart';
import 'package:explore_provider/list_provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> products = [
      "pen - ₹150",
      "pencil - ₹10",
      "rubber - ₹5",
      "ink - ₹30",
      "scale - ₹10",
      "box - ₹200",
    ];

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ListProvider(products),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Products',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Home(),
      ),
    );
  }
}
