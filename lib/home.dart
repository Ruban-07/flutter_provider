import 'package:explore_provider/list_provider.dart';
import 'package:explore_provider/summary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> products = [
    "pen - ₹150",
    "pencil - ₹10",
    "rubber - ₹5",
    "ink - ₹30",
    "scale - ₹10",
    "box - ₹200",
  ];

  @override
  Widget build(BuildContext context) {
    final ListProvider listProvider =
        Provider.of<ListProvider>(context, listen: true);

    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Summary(products: products),
          ),
        ),
        child: const Icon(Icons.navigate_next_rounded),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              width: 200,
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) => CheckboxListTile(
                  title: Text(products[index]),
                  value: listProvider.checkedItems[index],
                  onChanged: (value) => listProvider.buttonChange(index),
                ),
              ),
            ),
            const Spacer(),
            Consumer<ListProvider>(
              builder: (context, value, child) => Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Text("Total - ${listProvider.totalPrice}"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
