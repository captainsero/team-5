import 'dart:io';

import 'package:hive_ce/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:team_5_examapp/features/questions/data/models/answer_dto.dart';
import 'package:team_5_examapp/features/questions/data/models/check_answer_dto.dart';

@singleton
class HiveService {
  static Future<void> init(Directory dir) async {
    Hive.init(dir.path);
    Hive.registerAdapter(AnswerDtoAdapter());
    Hive.registerAdapter(CheckAnswerDtoAdapter());
  }
}
