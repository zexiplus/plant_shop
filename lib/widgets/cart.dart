import 'package:flutter/material.dart';
import 'package:plant_shop/widgets/plant_detail.dart';
import 'package:plant_shop/model/cart_model.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _PlantListState createState() => _PlantListState();
}

class _PlantListState extends State<Cart> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() {
      final String text = _controller.text;
      _controller.value = _controller.value.copyWith(text: text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(builder: (context, cart, child) {
      return Scaffold(
          appBar: AppBar(
            title: const Text('Cart'),
          ),
          body: Center(
              child: ListView(
                  children: cart.cartList.map((plant) {
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconButton(
                                        onPressed: () => cart.add(plant),
                                        color: Colors.blue,
                                        icon: const Icon(Icons.add_circle)),
                                    Text(plant.count.toString()),
                                    IconButton(
                                        onPressed: () => cart.sub(plant),
                                        color: Colors.blue,
                                        icon: const Icon(Icons.remove_circle))
                                  ],
                                ),
                                IconButton(
                                  onPressed: () => {cart.delete(plant)},
                                  icon: const Icon(Icons.delete),
                                  color: Colors.blue,
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
            backgroundColor: Colors.blueGrey,
            onPressed: () {
              cart.removeAll();
            },
            child: const Icon(Icons.delete_forever),
          ),
          bottomSheet: BottomSheet(
            builder: (context) => SizedBox(
              height: 100,
              child: Center(
                  child: Text(
                'Total: ${cart.totalPrice}',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
            ),
            onClosing: () {},
          ));
    });
  }
}
