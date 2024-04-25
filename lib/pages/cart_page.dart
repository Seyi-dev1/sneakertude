import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sneakertude/components/cart_item.dart';
import 'package:sneakertude/models/cart.dart';
import 'package:sneakertude/models/shoe.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void _removeItemFromCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).removeItemFromCart(shoe);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //heading
            const Text(
              'My Cart',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 10,
            ),

            Expanded(
                child: ListView.builder(
              itemCount: value.getCart().length,
              itemBuilder: (context, index) {
                //get individual shoe
                Shoe individualShoe = value.getCart()[index];

                //return the cart Item
                return CartItem(
                  shoe: individualShoe,
                  removeItemFromCart: () => _removeItemFromCart(individualShoe),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
