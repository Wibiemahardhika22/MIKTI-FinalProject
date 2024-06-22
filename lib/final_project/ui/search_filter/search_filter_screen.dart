import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../model/product.dart';
import '../../repository/ProductRepository.dart';
import '../widgets/product_list.dart';

class SearchFilterScreen extends StatefulWidget {
  final List<Product> allProducts;
  final ProductRepository productRepository;

  SearchFilterScreen({required this.allProducts, required this.productRepository});

  @override
  _SearchFilterScreenState createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
  late Future<List<Product>> filteredProductsFuture;
  final TextEditingController searchController = TextEditingController();
  String? currentCategory;

  @override
  void initState() {
    super.initState();
    filteredProductsFuture = Future.value(widget.allProducts);
  }


  void _showFilterBottomSheet() async {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return FutureBuilder<List<String>>(
          future: widget.productRepository.apiService.getCategories(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error loading categories'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No categories available'));
            } else {
              List<String> categories = snapshot.data!;
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(categories[index]),
                          onTap: () {
                            setState(() {
                              currentCategory = categories[index];
                              filteredProductsFuture = widget.productRepository.fetchProductsByCategory(categories[index]);
                            });
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
                  ),
                  ListTile(
                    title: Text('Clear Filter'),
                    onTap: () {
                      setState(() {
                        currentCategory = null;
                        filteredProductsFuture = Future.value(widget.allProducts);
                      });
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            }
          },
        );
      },
    );
  }

  void _onSearchChanged(String query) {
    if (query.length >= 3) {
      setState(() {
        filteredProductsFuture = Future.value(widget.allProducts.where((product) {
          return product.title.toLowerCase().contains(query.toLowerCase());
        }).toList());
      });
    } else {
      setState(() {
        filteredProductsFuture = Future.value(widget.allProducts);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search and Filter'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: _onSearchChanged,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 4),
            child: ElevatedButton(
              onPressed: _showFilterBottomSheet,
              child: Text('Filter by Category'),
            ),
          ),
          if (currentCategory != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text('Current Filter: $currentCategory'),
            ),
          Expanded(
            child: ProductList(productsFuture: filteredProductsFuture),
          ),
        ],
      ),
    );
  }
}
