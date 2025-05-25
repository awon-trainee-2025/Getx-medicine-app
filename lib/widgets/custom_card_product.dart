import 'package:flutter/material.dart';
import 'package:medicine_app/main.dart';

class CustomCardProduct extends StatelessWidget {
  const CustomCardProduct({super.key, required this.product});

  final Map product;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 19),
      width: 157,
      height: 324,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: const Offset(0.0, 1.0),
            blurRadius: 3.0,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: const Offset(0.0, 0.0),
          ), //BoxShadow
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image.network(product['image_url'], width: 142),
            Text(
              product['name'],
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  product['price'].toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.red[400],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.shopping_cart, size: 24),
                  onPressed: () async {
                    await supabase.from('cart_items').insert({
                      'cart_id': 1,
                      'product_id': 3,
                      'quantity': 10,
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}