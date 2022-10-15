import 'package:bloc/bloc.dart';
import 'package:delivery_app/dummy/subcategory_json.dart';
import 'package:equatable/equatable.dart';

part 'subcategory_event.dart';
part 'subcategory_state.dart';

class SubCategoryBloc extends Bloc<SubCategoryEvent, SubCategoryState> {
  SubCategoryBloc()
      : super(SubCategoryInitial(subCategoryList: subCategoryJSON)) {
    on<SubCategoryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
