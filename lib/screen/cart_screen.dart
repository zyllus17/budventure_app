import 'package:flutter/material.dart';

import 'package:budventure_app/screen/home_screen.dart';

class CartScreen extends StatelessWidget {
  final String itemName;
  final String price;

  const CartScreen({
    Key? key,
    required this.itemName,
    required this.price,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: const Text(
            'Cart',
            style: const TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // ListView.builder(itemBuilder: itemBuilder),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.done,
                            color: Colors.grey,
                          ),
                          Text(itemName),
                          const Icon(
                            Icons.do_not_disturb_on_outlined,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      //TODO: No Divider before last item
                      const Divider(
                        thickness: 2,
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: CartButton(),
            ),
          ],
        ));
  }
}

class ItemInCart extends StatelessWidget {
  const ItemInCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.done,
                color: Colors.grey,
              ),
              const Text('Item Name'),
              const Icon(
                Icons.do_not_disturb_on_outlined,
                color: Colors.grey,
              ),
            ],
          ),
          //TODO: No Divider before last item
          const Divider(
            thickness: 2,
          )
        ],
      ),
    );
  }
}
