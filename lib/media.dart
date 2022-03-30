import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';
 part 'media.g.dart';
@HiveType(typeId: 1)
class Media{
@HiveField(0)
int? id ;

@HiveField(1)
final String image ;

Media(this.image);
}