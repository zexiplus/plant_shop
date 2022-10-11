import 'package:flutter/material.dart';
import 'package:plant_shop/widgets/plant_detail.dart';
import 'package:plant_shop/data/plant_data.dart';
import 'package:plant_shop/model/cart_model.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';

class PlantList extends StatefulWidget {
  const PlantList({Key? key}) : super(key: key);

  @override
  _PlantListState createState() => _PlantListState();
}

class _PlantListState extends State<PlantList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(builder: (context, cart, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Plant List'),
        ),
        body: Center(
            child: ListView(
                children: plantList.map((plant) {
          return GestureDetector(
              child: Card(
                  child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: [
                              Text('name: ${plant.name}',
                                  style: const TextStyle(
                                      fontSize: 20, color: Colors.black))
                            ],
                          ),
                          Row(children: [
                            Text('price: ${plant.price.toString()}',
                                style: const TextStyle(
                                    fontSize: 20, color: Colors.black))
                          ]),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              Detail(detail: plant))))
                                },
                                child: const Text('detail'),
                              ),
                              TextButton(
                                onPressed: () => cart.add(plant),
                                child: const Text('add'),
                              )
                            ],
                          ),
                        ],
                      ))),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => Detail(detail: plant))));
              });
        }).toList())),
        floatingActionButton: FloatingActionButton(
          child: Badge(
              showBadge: cart.cartList.isNotEmpty,
              badgeColor: Colors.red,
              toAnimate: true,
              shape: BadgeShape.circle,
              badgeContent: Text('${cart.cartList.length}',
                  style: const TextStyle(color: Colors.white)),
              child: const Icon(Icons.shopping_cart)),
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
        ),
      );
    });
  }
}
