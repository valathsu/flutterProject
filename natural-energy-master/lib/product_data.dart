class Product {
  String image;
  String name;
  String description;
  String price;
  String MRP;
  double rating;
  String totalRating;

  Product(this.image, this.name, this.description,
      {this.price, this.MRP, this.rating, this.totalRating});

  List<Product> getProducts() {
    return [
      Product("assets/images/Mockup01.png", "BIM-1", "New Born 3-6 months",
          price: "599", MRP: "650", rating: 3, totalRating: "150"),
      Product("assets/images/Mockup04.png", "BIM-2", "New Born 6-12 months",
          price: "259", MRP: "300", rating: 5, totalRating: "500"),
      Product("assets/images/Mockup03.png", "BIM-3", "New Born 12-36 months",
          price: "229", MRP: "230", rating: 4, totalRating: "130"),
      Product("assets/images/Mockup04.png", "BIM-4", "New Born 3-4 years",
          price: "359", MRP: "400", rating: 5, totalRating: "250"),
      Product("assets/images/hot-offer1.jpg", "BIM-5", "New Born 5+ years",
          price: "459", MRP: "550", rating: 4, totalRating: "800"),
    ];
  }
}
