import 'package:flutter/material.dart';

import '../../model/product.dart';
import '../../utils/converter.dart';
import '../auth/constants.dart';
import 'custom_bottom_sheet.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final idrPrice = convertUsdToIdr(product.price);
    final formattedIdrPrice = formatCurrency(idrPrice);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
      ),
      body: CustomScrollView(slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 128,
                    height: 128,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.network(
                      product.image,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                Text(
                  'Rp $formattedIdrPrice',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4.0),
                Text(
                  product.title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 4.0),
                Text(
                  'Kategori: ${product.category}',
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: kPrimaryColor),
                ),
                const SizedBox(height: 16.0),
                const Divider(
                  height: 2,
                  thickness: 2,
                ),
                const SizedBox(height: 16.0),
                const Text('Deskripsi',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                const SizedBox(height: 4.0),
                Text(
                  product.description,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ]),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
              ),
              builder: (BuildContext context) {
                return CustomBottomSheet(image: product.image);
              },
            );
          },
          style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
          child: const Text(
            'Beli',
            style: TextStyle(
                fontWeight: FontWeight.w600, color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
