class Plant {
  Plant({
    required this.name,
    required this.price,
    this.img = '',
    this.desc = '',
    this.count = 0,
  });
  String name;
  double price;
  String img;
  String desc;
  int count;
}
