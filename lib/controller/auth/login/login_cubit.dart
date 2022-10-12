import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:delivery_app/model/user.dart';
import 'package:http/http.dart' as http;
part 'login_state.dart';

String domainName = "https://delivery-app-362714-default-rtdb.firebaseio.com";

class LoginCubit extends Cubit<LoginState> {
  List<UserModel> user = [];
  bool isVisible = false;
  bool isRegistered = false;
  LoginCubit() : super(LoginInitial()) {
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      http.Response response =
          await http.get(Uri.parse("$domainName/user.json"));
      Map data = json.decode(response.body);
      if (response.statusCode == 200) {
        data.forEach((key, value) {
          user.add(UserModel.fromJson(value));
        });
      }
    } catch (e) {
      emit(GetUserError());
    }
  }

  void checkUserData(String email, String password) {
    emit(GetUserLoading());
    for (var element in user) {
      if (element.email == email && element.password == password) {
        isRegistered = true;
        emit(GetUserSuccess());
      }
    }
    if (isRegistered == false) {
      emit(GetUserFailed());
    }
  }

  void changeVisibility() {
    isVisible = !isVisible;
    emit(ChangeVisibility());
  }
}
