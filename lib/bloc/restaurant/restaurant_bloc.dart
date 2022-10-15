import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:delivery_app/model/restaurant.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
part 'restaurant_event.dart';
part 'restaurant_state.dart';

String domainName = "https://delivery-app-362714-default-rtdb.firebaseio.com";

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  List<RestaurantModel> restaurant = [];
  RestaurantBloc() : super(RestaurantLoading()) {
    on<LoadRestaurant>(onLoadRestaurant);
  }

  Future<void> onLoadRestaurant(
      LoadRestaurant event, Emitter<RestaurantState> emit) async {
    try {
      http.Response response =
          await http.get(Uri.parse("$domainName/restaurant.json"));
      Map data = json.decode(response.body);
      if (response.statusCode == 200) {
        data.forEach((key, value) {
          restaurant.add(RestaurantModel.fromMap(key, value));
        });
      }
      emit(RestaurantLoaded(restaurantlist: restaurant));
    } catch (e) {
      emit(RestaurantError());
    }
  }
}
