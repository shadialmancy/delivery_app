import 'dart:convert';

class RestaurantModel {
  String restID;
  String name;
  String image;
  String location;
  String deliveryTime;
  String distance;
  String rating;
  RestaurantModel({
    required this.restID,
    required this.name,
    required this.image,
    required this.location,
    required this.deliveryTime,
    required this.distance,
    required this.rating,
  });

  factory RestaurantModel.fromMap(String ID, Map<String, dynamic> map) {
    return RestaurantModel(
      restID: ID,
      name: map['name'],
      image: map['image'],
      location: map['location'],
      deliveryTime: map['delivery time'],
      distance: map['distance'],
      rating: map['rating'],
    );
  }
}
