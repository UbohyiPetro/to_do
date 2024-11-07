import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softwars_to_do/edit_todo/controller/edit_todo_controller.dart';
import 'package:softwars_to_do/edit_todo/state/edit_todo_state.dart';
import 'package:softwars_to_do/main/components/todo_checkbox.dart';
import '../../common/ui/date_picker.dart';
import '../../theme/spacing.dart';

class EditTodoScreen extends StatelessWidget {
  const EditTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final EditTodoController editTodoController = Get.put(EditTodoController());
    final EditTodoState editTodoState = editTodoController.editTodoState;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Spacing.large),
            child: Obx(
              () => Visibility(
                visible: !editTodoState.isLoading.value,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Spacing.medium,
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: colorScheme.primary,
                            ),
                          ),
                          const SizedBox(width: Spacing.small),
                          Expanded(
                            child: TextField(
                              controller: editTodoState.nameController.value,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                              decoration: const InputDecoration(
                                hintText: "Назва завдання...",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              editTodoController.editTodo();
                              Get.back();
                            },
                            icon: Icon(
                              Icons.done,
                              color: colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: Spacing.medium,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: colorScheme.secondary,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Radio(
                                value: editTodoState.isTypeWork.value,
                                groupValue: 1,
                                onChanged: (value) {
                                  var currentType =
                                      editTodoState.isTypeWork.value;
                                  if (currentType == 1) return;
                                  if (currentType != 2) {
                                    editTodoState.isTypeWork.value = 1;
                                    editTodoState.isTypePrivate.value = 0;
                                  }
                                },
                                activeColor: colorScheme.primary,
                              ),
                              const Text('Робочі'),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: editTodoState.isTypePrivate.value,
                                groupValue: 1,
                                onChanged: (value) {
                                  var currentType =
                                      editTodoState.isTypePrivate.value;
                                  if (currentType == 1) return;
                                  if (currentType != 2) {
                                    editTodoState.isTypePrivate.value = 1;
                                    editTodoState.isTypeWork.value = 0;
                                  }
                                },
                                activeColor: colorScheme.primary,
                              ),
                              const Text('Особисті'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: Spacing.small),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Spacing.medium,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.secondary,
                      ),
                      child: TextField(
                        controller: editTodoState.descriptionController.value,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Додати опис...',
                        ),
                      ),
                    ),
                    const SizedBox(height: Spacing.small),
                    InkWell(
                      splashColor: Colors.cyan,
                      onTap: () async {
                        editTodoController.selectImage();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(Spacing.medium),
                        decoration: BoxDecoration(
                          color: colorScheme.secondary,
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  editTodoState.file.value == null
                                      ? 'Прикріпити файл'
                                      : 'Вкладене зображення',
                                ),
                                editTodoState.file.value != null
                                    ? const SizedBox(
                                        height: 10,
                                      )
                                    : const SizedBox(),
                                // editTodoState.file.value != null
                                //     ? Container(
                                //         height: 200,
                                //         child: ClipRRect(
                                //           child: Image.file(
                                //             fit: BoxFit.cover,
                                //             editTodoState.file.value!,
                                //           ),
                                //         ),
                                //       )
                                //     : const SizedBox(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: Spacing.small),
                    InkWell(
                      onTap: () => pickDate(
                          context,
                          DateTime.now(),
                          (selectedDate) =>
                              {editTodoController.onDateSelect(selectedDate)}),
                      child: Container(
                        padding: const EdgeInsets.all(Spacing.medium),
                        decoration: BoxDecoration(
                          color: colorScheme.secondary,
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Дата завершення: ${editTodoState.finishDate.value}',
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: Spacing.small),
                    Container(
                      color: colorScheme.secondary,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(Spacing.small),
                            child: TodoCheckbox(
                              isChecked: editTodoState.urgent.value == 0
                                  ? false
                                  : true,
                              onChanged: () {
                                var argent = editTodoState.urgent.value;
                                if (argent == 0) {
                                  editTodoState.urgent.value = 1;
                                } else {
                                  editTodoState.urgent.value = 0;
                                }
                              },
                              borderColor: colorScheme.tertiary,
                            ),
                          ),
                          const Text('Термінове'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Spacing.medium,
                        vertical: Spacing.semiLarge,
                      ),
                      child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: colorScheme.tertiaryContainer,
                          minimumSize:
                              const Size.fromHeight(Spacing.defaultButton),
                          padding: const EdgeInsets.symmetric(
                            vertical: Spacing.medium,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Spacing.medium),
                          ),
                        ),
                        onPressed: () {
                          editTodoController.deleteTodo();
                          Get.back();
                        },
                        child: const Text(
                          'Видалити',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
