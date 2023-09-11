import 'package:explore_provider/list_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Summary extends StatefulWidget {
  final List<String> products;
  const Summary({super.key, required this.products});

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  @override
  Widget build(BuildContext context) {
    final ListProvider listProvider =
        Provider.of<ListProvider>(context, listen: true);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 480,
              width: 280,
              child: Card(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        "Bill Summary",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 400,
                      width: 200,
                      child: ListView.builder(
                        itemCount: widget.products.length,
                        itemBuilder: (context, index) => CheckboxListTile(
                          title: Text(widget.products[index]),
                          value: listProvider.checkedItems[index],
                          onChanged: (value) =>
                              listProvider.buttonChange(index),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
