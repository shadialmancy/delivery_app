part of 'restaurant_bloc.dart';

abstract class RestaurantState {
  const RestaurantState();
}

class RestaurantLoading extends RestaurantState {}

class RestaurantLoaded extends RestaurantState {
  List restaurantlist = [];
  RestaurantLoaded({required this.restaurantlist});
}

class RestaurantError extends RestaurantState {}
