import 'package:isar/isar.dart';

// part 'isar_prc.g.dart';

@collection
class Email {
  Id id = Isar.autoIncrement;

  @Index(type: IndexType.value)
  String? title;

  List<Recipient>? recipients;

  @enumerated
  Status status = Status.pending;
}

@embedded
class Recipient {
  String? name;
  String? address;
}

enum Status { draft, pending, sent }

// final dir = await
//
// getApplicationDocumentsDirectory();
//
// final isar = await
// Isar.open
// ([EmailSchema],
// directory: dir.path,
// );
