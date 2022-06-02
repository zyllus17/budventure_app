import 'package:budventure_app/services/item_services.dart';
import 'package:budventure_app/widgets/search_box.dart';
import 'package:flutter/material.dart';
import 'package:budventure_app/constants/color.dart';
import 'package:budventure_app/constants/text.dart';
import 'package:budventure_app/model/item_model.dart';
import 'package:budventure_app/screen/screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  ItemServices itemServices = ItemServices();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
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
              SearchBox(searchController: searchController),
              const SizedBox(height: 40),
              Expanded(
                child: FutureBuilder<ItemModel>(
                  future: itemServices.fetchItem(),
                  builder: (context, AsyncSnapshot<ItemModel> snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (context, index) {
                          String item =
                              snapshot.data!.data![index].name.toString();
                          if (searchController.text.isEmpty) {
                            return productItem(snapshot, index, context);
                          } else if (item
                              .toLowerCase()
                              .contains(searchController.text.toLowerCase())) {
                            return productItem(snapshot, index, context);
                          } else {
                            return const SizedBox();
                          }
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding productItem(
      AsyncSnapshot<ItemModel> snapshot, int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: double.infinity,
        color: AppColors.boxgrey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      snapshot.data!.data![index].image!.toString(),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          snapshot.data!.data![index].name!.toString(),
                          style: Theme.of(context).textTheme.headline3,
                        ),
                        Text(
                          snapshot.data!.data![index].description!.toString(),
                          style: Theme.of(context).textTheme.headline4,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          snapshot.data!.data![index].price!.toString(),
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
                                MaterialPageRoute(
                                  builder: (context) => CartScreen(
                                    itemName: snapshot.data!.data![index].name!
                                        .toString(),
                                    price: snapshot.data!.data![index].price!
                                        .toString(),
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.shopping_cart,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    )
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
