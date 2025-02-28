class Product {
  final int id, price;
  final String title, subTitle, description, image;

  Product(
      {required this.id,
      required this.price,
      required this.title,
      required this.subTitle,
      required this.description,
      required this.image});
}

// list of products
List<Product> products = [
  Product(
      id: 1,
      price: 59,
      title: "Airpods",
      subTitle: "High-quality sound",
      image: "images/airpod.png",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed accumsan blandit urna, ac ultrices est scelerisque"),
  Product(
      id: 2,
      price: 500,
      title: "Mobile",
      subTitle: "And the mobile became powerful",
      image: "images/mobile.png",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed accumsan blandit urna, ac ultrices est scelerisque"),
  Product(
      id: 3,
      price: 39,
      title: "VR-Glasses",
      subTitle: "To transport you to the virtual world",
      image: "images/class.png",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed accumsan blandit urna, ac ultrices est scelerisque"),
  Product(
      id: 4,
      price: 56,
      title: "Headphones",
      subTitle: "For long listening hours",
      image: "images/headset.png",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed accumsan blandit urna, ac ultrices est scelerisque"),
  Product(
      id: 5,
      price: 68,
      title: "Voice Recorder",
      subTitle: "Record important moments around you",
      image: "images/speaker.png",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed accumsan blandit urna, ac ultrices est scelerisque"),
  Product(
      id: 6,
      price: 39,
      title: "Computer Cameras",
      subTitle: "With high image quality and resolution",
      image: "images/camera.png",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed accumsan blandit urna, ac ultrices est scelerisque"),
  Product(
      id: 7,
      price: 100,
      title: "Apple Watch",
      subTitle: "To be the fastest",
      image: "images/applewatch.png",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed accumsan blandit urna, ac ultrices est scelerisque"),
  Product(
      id: 9,
      price: 700,
      title: "Iphone",
      subTitle: "Iphone 11 pro max",
      image: "images/iphone.png",
      description:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed accumsan blandit urna, ac ultrices est scelerisque"),
];
