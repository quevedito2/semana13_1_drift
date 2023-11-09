import 'dart:io';
import 'package:drift/drift.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:drift/native.dart';
part 'database.g.dart';

class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nombre => text().named('nombre')();
  TextColumn get correo => text().named('correo')();
}

LazyDatabase abrirConexion() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [Users])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(abrirConexion());

  @override
  int get schemaVersion => 1;

  Future<List<User>> getListado() async {
    return select(users).get();
  }

  Future<int> insertUser(UsersCompanion usersCompanion) async {
    return await into(users).insert(usersCompanion);
  }
}
