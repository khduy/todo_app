class AddTask {
  static int _id = 0;
  final String title;
  AddTask(this.title) {
    _id++;
  }
  int get id => _id;
}

class CheckTask {
  final int id;
  CheckTask(this.id);
}

class SwitchTab {
  final int index;
  SwitchTab(this.index);
}
