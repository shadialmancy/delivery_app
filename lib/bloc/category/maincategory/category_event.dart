// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'category_bloc.dart';

@immutable
abstract class CategoryEvent {
  const CategoryEvent();
}

class CategorySelected extends CategoryEvent {
  List categorylist;
  CategorySelected({
    required this.categorylist,
  });
}
