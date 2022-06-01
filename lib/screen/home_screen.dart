import 'package:budventure_app/constants/color.dart';
import 'package:budventure_app/constants/text.dart';
import 'package:budventure_app/model/item_model.dart';
import 'package:budventure_app/screen/screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppText.title,
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(height: 10),
                Text(
                  AppText.trending,
                  style: Theme.of(context).textTheme.headline3,
                ),
                const SizedBox(height: 10),
                const SearchBox(),
                const SizedBox(height: 40),
                const Items(),
                const Items(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        // height: 200,
        width: double.infinity,
        color: AppColors.boxgrey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                child: const FlutterLogo(size: 150),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Product Name',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          'Product Description Heelo app has the most comprehensive listing of local restaurant coupons and promotions. Just pick your favorite deals and locate the',
                          style: Theme.of(context).textTheme.headline4,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    const CartButton()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartButton extends StatelessWidget {
  const CartButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$200',
          style: Theme.of(context).textTheme.headline2,
        ),
        Container(
          width: 70,
          decoration: BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.circular(25),
          ),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartScreen()),
              );
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.searchgrey, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            const Icon(Icons.search, color: AppColors.grey),
            const SizedBox(width: 10),
            Text(
              AppText.search,
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ),
    );
  }
}
