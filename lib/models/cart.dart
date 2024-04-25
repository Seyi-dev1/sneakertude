import 'package:flutter/material.dart';
import 'package:sneakertude/models/shoe.dart';

class Cart extends ChangeNotifier {
  //list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
        name: 'Zoom FREAK',
        price: '236',
        imagePath: 'lib/images/pngwing.com.png',
        description:
            'The forward-thinking design of his latest signature shoe'),
    Shoe(
        name: 'Air Jordans',
        price: '220',
        imagePath: 'lib/images/pngwing.com (2).png',
        description:
            'You\'ve got the hops and the speed-lace up in the shoes that enhance'),
    Shoe(
        name: 'KD Treys',
        price: '240',
        imagePath: 'lib/images/pngwing.com.png',
        description:
            'A secure midfoot strap is suited for scoring binges and defensive'),
    Shoe(
        name: 'Kyrie 6',
        price: '190',
        imagePath: 'lib/images/pngwing.com (4).png',
        description:
            'Bouncy cushioning is paired with soft yet supportive foam'),
  ];

  //list of items in user cart
  List<Shoe> userCart = [];

  //get list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  //get cart
  List<Shoe> getCart() {
    return userCart;
  }

  //add item to cart
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  //remove item from cart
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
