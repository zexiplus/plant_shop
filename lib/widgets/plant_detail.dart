import 'package:flutter/material.dart';
import 'package:plant_shop/define/plant.dart';

class Detail extends StatefulWidget {
  const Detail({super.key, required this.detail});
  final Plant detail;

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plant detail'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8),
        child: Column(children: [
          Text(
            'Name: ${widget.detail.name}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Image(
            image: NetworkImage(widget.detail.img),
            width: 300,
            height: 300,
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return const FlutterLogo(size: 200);
            },
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
          )
        ]),
      ),
    );
  }
}
