part of 'restaurant_bloc.dart';

abstract class RestaurantEvent {
  const RestaurantEvent();
}

class LoadRestaurant extends RestaurantEvent {}
