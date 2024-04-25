import 'package:flutter/material.dart';
import 'package:sneakertude/models/shoe.dart';

class CartItem extends StatefulWidget {
  Shoe shoe;
  void Function()? removeItemFromCart;
  CartItem({super.key, required this.shoe, required this.removeItemFromCart});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        leading: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12))),
            child: Image.asset(widget.shoe.imagePath)),
        title: Text(widget.shoe.name),
        subtitle: Text(widget.shoe.price),
        trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: widget.removeItemFromCart),
      ),
    );
  }
}
