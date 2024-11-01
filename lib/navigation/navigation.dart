import 'package:get/get.dart';
import 'package:softwars_to_do/add_todo/ui/add_todo_screen.dart';
import 'package:softwars_to_do/edit_todo/ui/edit_todo_screen.dart';
import 'package:softwars_to_do/login/ui/login_screen.dart';
import 'package:softwars_to_do/main/ui/main_screen.dart';

abstract class Routes {
  static const login = _Paths.login;
  static const main = _Paths.main;
  static const addTodo = _Paths.addTodo;
  static const editTodo = _Paths.editTodo;
}

abstract class _Paths {
  static const login = '/login';
  static const main = '/main';
  static const addTodo = '/add_todo';
  static const editTodo = '/edit_todo';
}

class AppPages {
  static final pages = [
    GetPage(
      name: _Paths.login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: _Paths.main,
      page: () => const MainScreen(),
    ),
    GetPage(
      name: _Paths.addTodo,
      page: () => const AddToDoScreen(),
    ),
    GetPage(
      name: _Paths.editTodo,
      page: () => const EditTodoScreen(),
    ),
  ];
}
