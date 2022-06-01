import 'package:budventure_app/screen/home_screen.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          leading: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: true,
          title: Text(
            'Cart',
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                ItemInCart(),
                ItemInCart(),
                ItemInCart(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
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
              Icon(
                Icons.done,
                color: Colors.grey,
              ),
              Text('Item Name'),
              Icon(
                Icons.do_not_disturb_on_outlined,
                color: Colors.grey,
              ),
            ],
          ),
          //TODO: No Divider before last item
          Divider(
            thickness: 2,
          )
        ],
      ),
    );
  }
}
