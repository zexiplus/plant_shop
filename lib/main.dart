import 'package:flutter/material.dart';

import 'widgets/plant_list.dart';
import 'widgets/device_list.dart';
import 'widgets/cart.dart';
import 'model/cart_model.dart';

import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ChangeNotifierProvider(
      create: (context) => CartModel(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); //equal with MyApp({Key? key}): super(key: key)

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Plant Home',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Shop Home'),
        initialRoute: '/',
        routes: {
          '/good_list': (context) => const PlantList(),
          '/device_list': (context) => const DeviceList(),
          '/cart': ((context) => const Cart()),
        });
  }
}

class MyHomePage extends StatelessWidget {
  String title = 'welcome to shop';

  MyHomePage({super.key, required this.title});

  @override
  build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          leading: Builder(
              builder: (BuildContext context) => IconButton(
                    icon: const Icon(Icons.menu),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  )),
          actions: [
            IconButton(
                onPressed: () => Navigator.pushNamed(context, '/cart'),
                icon: const Icon(Icons.shopping_cart))
          ],
        ),
        body: Container(
          alignment: Alignment.center,
          child: const Text('shop', style: TextStyle(fontSize: 32)),
        ),
        drawer: Drawer(
            width: 200,
            child: SafeArea(
                child: Center(
              child: Column(
                children: [
                  TextButton(
                    child: const Text('Home page'),
                    onPressed: () => {},
                  ),
                  TextButton(
                    child: const Text('Plant list'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/good_list');
                    },
                  ),
                  TextButton(
                    child: const Text('Device list'),
                    onPressed: () {
                      Navigator.pushNamed(context, '/device_list');
                    },
                  ),
                ],
              ),
            ))));
  }
}
