// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  TodoDao? _todoDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `todos` (`taskId` TEXT NOT NULL, `status` INTEGER NOT NULL, `name` TEXT NOT NULL, `type` INTEGER NOT NULL, `description` TEXT NOT NULL, `file` TEXT NOT NULL, `finishDate` TEXT NOT NULL, `urgent` INTEGER NOT NULL, PRIMARY KEY (`taskId`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  TodoDao get todoDao {
    return _todoDaoInstance ??= _$TodoDao(database, changeListener);
  }
}

class _$TodoDao extends TodoDao {
  _$TodoDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _todoEntityInsertionAdapter = InsertionAdapter(
            database,
            'todos',
            (TodoEntity item) => <String, Object?>{
                  'taskId': item.taskId,
                  'status': item.status,
                  'name': item.name,
                  'type': item.type,
                  'description': item.description,
                  'file': item.file,
                  'finishDate': item.finishDate,
                  'urgent': item.urgent
                },
            changeListener),
        _todoEntityUpdateAdapter = UpdateAdapter(
            database,
            'todos',
            ['taskId'],
            (TodoEntity item) => <String, Object?>{
                  'taskId': item.taskId,
                  'status': item.status,
                  'name': item.name,
                  'type': item.type,
                  'description': item.description,
                  'file': item.file,
                  'finishDate': item.finishDate,
                  'urgent': item.urgent
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<TodoEntity> _todoEntityInsertionAdapter;

  final UpdateAdapter<TodoEntity> _todoEntityUpdateAdapter;

  @override
  Stream<List<TodoEntity>> observeTodos() {
    return _queryAdapter.queryListStream('SELECT * from todos',
        mapper: (Map<String, Object?> row) => TodoEntity(
            taskId: row['taskId'] as String,
            status: row['status'] as int,
            name: row['name'] as String,
            type: row['type'] as int,
            description: row['description'] as String,
            file: row['file'] as String,
            finishDate: row['finishDate'] as String,
            urgent: row['urgent'] as int),
        queryableName: 'todos',
        isView: false);
  }

  @override
  Future<TodoEntity?> findTodoById(String id) async {
    return _queryAdapter.query('SELECT * from todos WHERE taskId= ?1',
        mapper: (Map<String, Object?> row) => TodoEntity(
            taskId: row['taskId'] as String,
            status: row['status'] as int,
            name: row['name'] as String,
            type: row['type'] as int,
            description: row['description'] as String,
            file: row['file'] as String,
            finishDate: row['finishDate'] as String,
            urgent: row['urgent'] as int),
        arguments: [id]);
  }

  @override
  Future<void> deleteTodoById(String id) async {
    await _queryAdapter
        .queryNoReturn('DELETE FROM todos WHERE taskId= ?1', arguments: [id]);
  }

  @override
  Future<int> insertTodo(TodoEntity todoEntity) {
    return _todoEntityInsertionAdapter.insertAndReturnId(
        todoEntity, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateTodo(TodoEntity todoEntity) async {
    await _todoEntityUpdateAdapter.update(
        todoEntity, OnConflictStrategy.replace);
  }
}
