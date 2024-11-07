import 'package:floor/floor.dart';
import 'package:softwars_to_do/database/entity/task_entity.dart';

@dao
abstract class TodoDao {
  @Query('SELECT * from todos')
  Stream<List<TaskEntity>> observeTodos();

  @Query('SELECT * from todos WHERE taskId= :id')
  Future<TaskEntity?> findTodoById(String id);

  @Query('DELETE FROM todos WHERE taskId= :id')
  Future<void> deleteTodoById(String id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertTodo(TaskEntity todoEntity);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateTodo(TaskEntity todoEntity);
}
