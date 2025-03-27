class TaskModel {
  int? id;
  String? taskName;
  DateTime? startDate;
  DateTime? endDate;

  TaskModel({
    required this.id,
    required this.taskName,
    required this.startDate,
    required this.endDate,
  });

  late TaskModel taskModel;
}
