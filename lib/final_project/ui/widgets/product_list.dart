import 'package:flutter/material.dart';
import '../../model/product.dart';
import '../../utils/converter.dart';
import '../detail/product_detail_screen.dart';

class ProductList extends StatelessWidget {
  final Future<List<Product>> productsFuture;

  ProductList({required this.productsFuture});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: productsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Failed to load products'));
        } else {
          final products = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
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
                title: Text(product.title, maxLines: 2, overflow: TextOverflow.ellipsis,),
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
          );
        }
      },
    );
  }
}