import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakertude/components/shoe_tile.dart';
import 'package:sneakertude/models/cart.dart';
import 'package:sneakertude/models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add sgoe to cart method
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    //alert the user, shoe successfully added
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Successfully added!',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        content: Text(
          'Check your cart',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Column(
              children: [
                //search bar
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  padding: const EdgeInsets.all(12),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Search',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),

                //message

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'everyone flies...some fly longer than others',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),

                //hot picks
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Hot Picks 🔥',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      Text(
                        'See All',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.blue),
                      )
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                Expanded(
                    child: ListView.builder(
                  itemCount: value.getShoeList().length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    //create a shoe
                    Shoe shoe = value.getShoeList()[index];

                    //return the shoe
                    return ShoeTile(
                      shoe: shoe,
                      onTap: () => addShoeToCart(shoe),
                    );
                  },
                )),

                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 25),
                  child: Divider(),
                )
              ],
            ));
  }
}
