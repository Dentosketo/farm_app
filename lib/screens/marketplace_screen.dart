import 'package:flutter/material.dart';

class ProductListing {
  final String title;
  final String description;
  final double price;

  ProductListing({required this.title, required this.description, required this.price});
}

class MarketplaceScreen extends StatefulWidget {
  const MarketplaceScreen({Key? key}) : super(key: key);

  @override
  _MarketplaceScreenState createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {
  bool showMyListings = false;

  // Dummy product listings for demonstration
  final List<ProductListing> productData = [
    ProductListing(title: "Product 1", description: "Description 1", price: 10.0),
    ProductListing(title: "Product 2", description: "Description 2", price: 20.0),
    ProductListing(title: "Product 3", description: "Description 3", price: 15.0),
  ];

  // Dummy "My Listings" for demonstration
  final List<ProductListing> myProductData = [
    ProductListing(title: "My Product 1", description: "My Description 1", price: 5.0),
    ProductListing(title: "My Product 2", description: "My Description 2", price: 12.0),
  ];

  List<ProductListing> getDisplayedProductData() {
    return showMyListings ? myProductData : productData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Marketplace'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  showMyListings = !showMyListings;
                });
              },
              child: Text(showMyListings ? 'All Listings' : 'My Listings'),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: getDisplayedProductData().length,
              itemBuilder: (context, index) {
                final product = getDisplayedProductData()[index];
                return ProductListingWidget(
                  title: product.title,
                  description: product.description,
                  price: product.price,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement the functionality to upload a product for sale
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ProductListingWidget extends StatelessWidget {
  final String title;
  final String description;
  final double price;

  const ProductListingWidget({super.key, 
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: const Icon(Icons.shopping_bag),
        title: Text(title),
        subtitle: Text(description),
        trailing: Text('\$$price'),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: MarketplaceScreen(),
  ));
}
