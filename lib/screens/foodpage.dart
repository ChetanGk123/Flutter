class food {
  String name;
  String image;
  String desc;
  double rate;
  int quantity;
  food(this.name, this.image, this.desc, this.rate, this.quantity);
}

List<food> allfood = <food>[
  food('Pizza', 'images/pizza.png', 'healthu', 100.0, 0),
  food('Salad', 'images/salad.png', 'tasty', 98, 0),
  food('Chicken Masala', 'images/chickenmasala.png', 'delicious', 210, 0),
  food('Non-veg Thali', 'images/nonvegthali.png', 'yummy', 164, 0),
  food('Paneer Masala', 'images/paneermasala.png', 'delightfull', 110, 0),
  food('Veg Thali', 'images/vegthali.png', 'hot', 115, 0),
  food('Veg Biryani', 'images/verbiryani.png', 'sweet', 180, 0)
];

List<food> cart = <food>[
  /*food('Pizza', 'images/pizza.png', 'healthu', 100.0, 1),
  food('Salad', 'images/salad.png', 'tasty', 98, 2),
  food('Chicken Masala', 'images/chickenmasala.png', 'delicious', 210, 2),
  food('Non-veg Thali', 'images/nonvegthali.png', 'yummy', 164, 3),
  food('Veg Thali', 'images/vegthali.png', 'hot', 115, 1),*/
];
