import 'package:dartz/dartz.dart';
import '../../../../../../core/error/failures.dart';

abstract class TaskRepository {
  putTask(Task task);

  postTask(Task task);

  deleteTask(Task task);

  Future<Either<Failure, Task>> getTaskByTasksId(int id);
}
