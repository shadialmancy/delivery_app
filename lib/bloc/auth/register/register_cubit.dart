import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../../model/user.dart';
part 'register_state.dart';

String domainName = "https://delivery-app-362714-default-rtdb.firebaseio.com";

class RegisterCubit extends Cubit<RegisterState> {
  List<UserModel> user = [];
  bool isVisible = false;
  RegisterCubit() : super(RegisterInitial()) {
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      http.Response response =
          await http.get(Uri.parse("$domainName/user.json"));
      Map data = json.decode(response.body);
      if (response.statusCode == 200) {
        data.forEach((key, value) {
          user.add(UserModel.fromMap(value));
        });
      }
    } catch (e) {
      emit(RegisterFailed());
    }
  }

  bool isEmailDuplicated(String email) {
    for (var element in user) {
      if (element.email == email) return true;
    }
    return false;
  }

  Future<void> sendUserData(String email, String password) async {
    try {
      if (isEmailDuplicated(email) == false) {
        http.Response response = await http.post(
            Uri.parse("$domainName/user.json"),
            body: json.encode({"email": email, "password": password}));
        if (response.statusCode == 200) {
          emit(RegisterSuccess());
        } else {
          emit(RegisterFailed());
        }
      } else {
        emit(RegisterEmailDuplicated());
      }
    } catch (e) {
      emit(RegisterFailed());
    }
  }

  void changeVisibility() {
    isVisible = !isVisible;
    emit(ChangeVisibility());
  }
}
