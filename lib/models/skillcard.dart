import 'package:englishstudy/models/studycard.dart';

class SkillCard{
  String title;
  String description;
  DateTime startDate;
  String imageUrl;
  List<StudyCard> skillTasks;

  SkillCard({
        required this.title,
        required this.description,
        required this.startDate,
        required this.imageUrl,
        required this.skillTasks
    });

}