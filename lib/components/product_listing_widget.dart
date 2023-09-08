import 'package:flutter/material.dart';

class ProductListingWidget extends StatelessWidget {
  final String productName;
  final String description;
  final double price;

  const ProductListingWidget(
      {Key? key, required this.productName, required this.description, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            productName,
            style: const TextStyle(fontSize: 24, color: Colors.white),
          ),
          Text(
            description,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          Text(
            '\$$price',
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
