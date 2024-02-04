import 'package:objectbox/objectbox.dart';

@Entity()
@Sync()
class Item {
  @Id()
  int id = 0;
  List<String> imgpath = [];
  String? name;
  String? description;
  String? count;
  String? type;
  double? price;
}
