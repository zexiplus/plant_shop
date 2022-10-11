import 'package:flutter/material.dart';
import 'package:plant_shop/widgets/plant_detail.dart';

class DeviceList extends StatefulWidget {
  const DeviceList({Key? key}) : super(key: key);

  @override
  _DeviceListState createState() => _DeviceListState();
}

class _DeviceListState extends State<DeviceList> {
  List deviceList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device List'),
      ),
      body: Center(
          child: ListView(
              children: deviceList.map((good) {
        return Card(
            child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: [
                        Text('name: ${good.name}',
                            style: const TextStyle(
                                fontSize: 20, color: Colors.black))
                      ],
                    ),
                    Row(children: [
                      Text('price: ${good.price.toString()}',
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
                                        Detail(detail: good))))
                          },
                          child: const Text('detail'),
                        )
                      ],
                    ),
                  ],
                )));
      }).toList())),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: const Icon(Icons.scanner),
        onPressed: () => {},
      ),
    );
  }
}
