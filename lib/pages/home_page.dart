import 'package:flutter/material.dart';
import 'package:sneakertude/components/bottom_nav.dart';
import 'package:sneakertude/pages/cart_page.dart';
import 'package:sneakertude/pages/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //selected index to control the bottom nav bar
  int _selectedIndex = 0;

  //this method updates our selected index when the user clicks on the bottom navbar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //pages to display
  final List<Widget> _pages = [
    //shop Page
    const ShopPage(),

    //cart page
    const CartPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavbar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      backgroundColor: Colors.grey[300],
      body: _pages[_selectedIndex],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            color: Colors.black,
          );
        }),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //logo
            Column(
              children: [
                DrawerHeader(
                    child: Image.asset(
                  'lib/images/logo.png',
                  color: Colors.white,
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    color: Colors.grey[900],
                  ),
                ),

                //other pages
                //home
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Home',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                //About
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    title: Text(
                      'About',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),

            //logout
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 35),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
