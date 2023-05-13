import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/models/home_data_model.dart';
import 'package:shop_app/modules/products_screen.dart';



class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Product Details',
      style: TextStyle(fontWeight: FontWeight.w700,
      fontSize: 20.0, color: Colors.black),),
    ),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image
          Image.network(product.image),

          // Product name
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product.name,
              style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
          ),

          // Product price
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Price: ${product.price} €',
              style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),

          // Purchase button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Show pop-up message
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const AlertDialog(
                        content: Text('Thank you for your purchase!'),
                      );
                    },
                  );

                  // Hide pop-up message by fading out after 2 seconds
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.of(context).pop();
                  });
              },
              child: const Text('Purchase'),
            ),
            ),
          ),
        ],
      ),
    ),
  );
}

}
