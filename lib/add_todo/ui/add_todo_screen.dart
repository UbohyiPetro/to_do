import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:softwars_to_do/add_todo/controller/add_todo_controller.dart';
import 'package:softwars_to_do/main/components/todo_checkbox.dart';
import '../../common/ui/date_picker.dart';
import '../../theme/spacing.dart';

class AddToDoScreen extends StatelessWidget {
  const AddToDoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addTodoController = Get.put(AddTodoController());
    final addTodoState = addTodoController.addTodoState;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Spacing.large),
            child: Obx(
              () => Column(
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
                            controller: addTodoState.nameController,
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
                              value: addTodoState.isTypeWork.value,
                              groupValue: 1,
                              onChanged: (value) {
                                var currentType = addTodoState.isTypeWork.value;
                                if (currentType == 1) return;
                                if (currentType != 2) {
                                  addTodoState.isTypeWork.value = 1;
                                  addTodoState.isTypePrivate.value = 0;
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
                              value: addTodoState.isTypePrivate.value,
                              groupValue: 1,
                              onChanged: (value) {
                                var currentType =
                                    addTodoState.isTypePrivate.value;
                                if (currentType == 1) return;
                                if (currentType != 2) {
                                  addTodoState.isTypePrivate.value = 1;
                                  addTodoState.isTypeWork.value = 0;
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
                      controller: addTodoState.descriptionController,
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
                      addTodoController.selectImage();
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
                                addTodoState.file.value == null
                                    ? 'Прикріпити файл'
                                    : 'Вкладене зображення',
                              ),
                              addTodoState.file.value != null
                                  ? const SizedBox(
                                      height: 10,
                                    )
                                  : const SizedBox(),
                              addTodoState.file.value != null
                                  ? Container(
                                      height: 200,
                                      child: ClipRRect(
                                        child: Image.file(
                                          fit: BoxFit.cover,
                                          addTodoState.file.value!,
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
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
                            {addTodoController.onDateSelect(selectedDate)}),
                    child: Container(
                      padding: const EdgeInsets.all(Spacing.medium),
                      decoration: BoxDecoration(
                        color: colorScheme.secondary,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Дата завершення: ${addTodoState.finishDate.value}',
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
                            isChecked:
                                addTodoState.urgent.value == 0 ? false : true,
                            onChanged: () {
                              var argent = addTodoState.urgent.value;
                              if (argent == 0) {
                                addTodoState.urgent.value = 1;
                              } else {
                                addTodoState.urgent.value = 0;
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
                        addTodoController.addTask();
                        Get.back();
                      },
                      child: const Text(
                        'Створити',
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
    );
  }
}
