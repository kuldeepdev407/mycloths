import 'package:objectbox/objectbox.dart';

@Entity()
@Sync()
class Item {
  @Id()
  int id = 0;
  List<String> imgpath = [];
  List<String> tag = [];
  bool isInLaundary = false;
  String? name;
  String? count;
  String? type;
  double? price;
}
