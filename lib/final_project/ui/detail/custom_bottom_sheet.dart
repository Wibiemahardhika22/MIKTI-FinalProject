import 'package:final_project_mikti/final_project/ui/detail/success_buy_screen.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  final String image;

  const CustomBottomSheet({super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text(
            'Apakah anda yakin ingin membeli barang ini?',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          Center(
            child: Container(
              width: 128,
              height: 128,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network(
                image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const SuccessBuyScreen()),
              );
            },
            child: const Text('Beli Sekarang'),
          ),
          const SizedBox(height: 8),
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: const Text('Cancel'),
            ),
          )
        ],
      ),
    );
  }
}
