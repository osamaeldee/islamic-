import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class PageState extends HiveObject {
  @HiveField(0)
  late bool visited;

  PageState({required this.visited});
}
