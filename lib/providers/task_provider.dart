
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:task_app/models/task_response.dart';

class TaskProvider extends ChangeNotifier{
  TaskResponse? taskResponse;

  Future<void> getTaskData() async{
    final String response = await rootBundle.loadString("assets/task.json");

    final map = jsonDecode(response);
    taskResponse = TaskResponse.fromJson(map);
    notifyListeners();
  }
}