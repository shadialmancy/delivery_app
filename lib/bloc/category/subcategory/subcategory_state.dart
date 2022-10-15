part of 'subcategory_bloc.dart';

abstract class SubCategoryState {
  const SubCategoryState();
}

class SubCategoryInitial extends SubCategoryState {
  List subCategoryList;
  SubCategoryInitial({required this.subCategoryList});
}
