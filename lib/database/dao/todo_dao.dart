import 'package:floor/floor.dart';
import 'package:softwars_to_do/database/entity/todo_entity.dart';

@dao
abstract class TodoDao {
  @Query('SELECT * from todos')
  Stream<List<TodoEntity>> observeTodos();

  @Query('SELECT * from todos WHERE taskId= :id')
  Future<TodoEntity?> findTodoById(String id);

  @Query('DELETE FROM todos WHERE taskId= :id')
  Future<void> deleteTodoById(String id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertTodo(TodoEntity todoEntity);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateTodo(TodoEntity todoEntity);
}
