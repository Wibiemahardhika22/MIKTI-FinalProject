import 'package:final_project_mikti/final_project/ui/detail/success_buy_screen.dart';
import 'package:final_project_mikti/final_project/ui/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'Apakah anda yakin ingin membeli barang ini?',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),

          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SuccessBuyScreen() ),
              );
            },
            child: const Text('Beli Sekarang'),
          ),
          SizedBox(height: 8),
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 32,vertical: 16),
              child: const Text('Cancel'),
            ),
          )

        ],
      ),
    );
  }
}