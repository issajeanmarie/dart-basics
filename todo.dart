import 'dart:io';

void main() {
  var tasks = <String>[];

  while (true) {
    print("Enter a command: add, remove, list, quit");
    var command = stdin.readLineSync();

    if (command == "add") {
      print("Enter your to do: ");
      var task = stdin.readLineSync()!;
      tasks.add(task);
    } else if (command == "remove") {
      print("Enter a task ID to remove:");
      var taskId = int.parse(stdin.readLineSync()!);
      tasks.removeAt(taskId - 1);
    } else if (command == "list") {
      displayTasks(tasks);
    } else if (command == "quit") {
      print("Thank you for using our app, here is your list: ");
      displayTasks(tasks);
      break;
    }
  }
}

void displayTasks(List<String> tasks) {
  for (var i = 0; i < tasks.length; i++) {
    print("${i + 1}. ${tasks[i]}");
  }
}
