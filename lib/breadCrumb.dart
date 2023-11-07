import 'package:uuid/uuid.dart';

class BreadCrumb {
  final String uuid;
  final String name;
  bool isActive;

  BreadCrumb({
    required this.name,
    required this.isActive,
  }) : uuid = const Uuid().v4();

  void Activate() {
    isActive = true;
  }

  @override
  bool operator ==(covariant BreadCrumb other) => uuid == other.uuid;

  @override
  int get hashCode => uuid.hashCode;

  //başlıkların yazımının kontrolü sağlandı.
  String get title => name + (isActive ? '>' : '');
}
