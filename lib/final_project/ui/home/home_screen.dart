import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_project_mikti/final_project/ui/detail/product_detail_screen.dart';
import 'package:flutter/material.dart';

import '../../model/product.dart';
import '../../repository/ProductRepository.dart';
import '../../utils/converter.dart';
import '../search_filter/search_filter_screen.dart';

class HomeScreen extends StatelessWidget {
  final Future<List<Product>> productsFuture;
  final ProductRepository productRepository;

  const HomeScreen({
    required this.productsFuture,
    required this.productRepository,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Search Bar
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: TextField(
          //     decoration: InputDecoration(
          //       hintText: 'Search...',
          //       prefixIcon: Icon(Icons.search),
          //       border: OutlineInputBorder(
          //         borderRadius: BorderRadius.circular(8.0),
          //       ),
          //     ),
          //   ),
          // ),

          // Carousel Slider
          CarouselSlider(
            items: [
              Container(
                width: 350,
                height: 150,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset('assets/images/img_carousel_1.png',
                    fit: BoxFit.cover),
              ),
              Container(
                width: 350,
                height: 150,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset('assets/images/img_carousel_2.png',
                    fit: BoxFit.cover),
              ),
              Container(
                width: 350,
                height: 150,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset('assets/images/img_carousel_3.png',
                    fit: BoxFit.cover),
              ),
              Container(
                width: 350,
                height: 150,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Image.asset('assets/images/img_carousel_4.png',
                    fit: BoxFit.cover),
              ),
            ],
            options: CarouselOptions(
              height: 150.0,
              autoPlay: true,
              enlargeCenterPage: true,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          // Product List
          FutureBuilder<List<Product>>(
            future: productsFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Center(child: Text('Failed to load products'));
              } else {
                final products = snapshot.data!;
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SearchFilterScreen(
                                allProducts: products,
                                productRepository: productRepository,
                              ),
                            ),
                          );
                        },
                        child: Text('Search dan Filter'),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        final idrPrice = convertUsdToIdr(product.price);
                        final formattedIdrPrice = formatCurrency(idrPrice);
                        return ListTile(
                          leading: Container(
                            width: 100,
                            height: 100,
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Image.network(
                              product.image,
                              fit: BoxFit.contain,
                            ),
                          ),
                          title: Text(
                            product.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text('Rp $formattedIdrPrice'),
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              ProductDetailScreen.routeName,
                              arguments: product,
                            );
                          },
                        );
                      },
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
