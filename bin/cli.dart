import "dart:io";

List<Map> tasks = [];
void main() {
  bool finished = false;

  while (!finished) {
    print("1, Add Task");
    print("2, Show Tasks");
    print("3, Remove Task");
    print("0, Exit");

    stdout.write("\n Enter your choice: ");
    String selection = stdin.readLineSync()!;
    switch (selection) {
      case "1":
        stdout.write("Enter the task: ");
        String task = stdin.readLineSync()!;
        addTask(task);
        break;
      case "2":
        print("\n Available tasks");
        displayTasks();
        break;
      case "3":
        displayTasks();
        stdout.write("Enter the task id to delete: ");
        int id = int.parse(stdin.readLineSync()!);
        removeTask(id);
        break;
      case "0":
        finished = true;
        break;
      default:
        print("Please enter valid choice");
        break;
    }
  }
}

void addTask(String task) {
  int id = tasks.isEmpty ? 0 : (tasks.last["id"] + 1);
  tasks.add({"id": id, "task": task});
  print("\n Successfully Added \n");
}

void removeTask(int id) {
  tasks = tasks.where((task) => task["id"] != id).toList();
  print("\n Successfully removed \n");
}

void displayTasks() {
  if (tasks.isNotEmpty) {
    tasks.forEach((task) => print("${task["id"]}. ${task["task"]}"));
    print("");
  } else {
    print("\n No tasks available! \n");
  }
}
