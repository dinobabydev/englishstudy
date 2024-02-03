import 'package:englishstudy/models/folder.dart';
import 'package:englishstudy/models/terms.dart';
import 'package:englishstudy/screens/create_exam_screen.dart';
import 'package:englishstudy/screens/feed_screen.dart';
import 'package:flutter/cupertino.dart';

import '../models/skillcard.dart';
import '../models/studycard.dart';

const webScreenSize = 600;

final homeScreenItems = [
  const FeedSceen(),
  const Text("About Screen"),
  const Text("About Screen"),


];
final List listCards = [
    SkillCard(
        title: "2.5.Skills",
        description: "23 thuật ngữ",
        imageUrl: "https://cdn.tuoitre.vn/thumb_w/480/471584752817336320/2023/4/8/tbm-3-1680922524017298081671.jpg",
        startDate: DateTime(2023,10,10),
        skillTasks: [
          StudyCard(title: "Ôn tập cơ bản", description: "Ôn tập thẻ cơ bản", imageUrl: "https://cdn.tuoitre.vn/thumb_w/480/2021/7/10/10-7-tho-bay-mau-5read-only-16259225729271099747138.jpg"),
          StudyCard(title: "Ghép thuật ngữ", description: "Ghép thuật ngữ và mô tả", imageUrl: "https://cdn.tuoitre.vn/thumb_w/480/2021/7/10/10-7-tho-bay-mau-5read-only-16259225729271099747138.jpg"),
          StudyCard(title: "Luyện nghe", description: "Rè luyện kĩ năng nghe", imageUrl: "https://cdn.tuoitre.vn/thumb_w/480/2021/7/10/10-7-tho-bay-mau-5read-only-16259225729271099747138.jpg"),
          StudyCard(title: "Ôn tập cơ bản", description: "Ôn tập thẻ cơ bản", imageUrl: "https://cdn.tuoitre.vn/thumb_w/480/2021/7/10/10-7-tho-bay-mau-5read-only-16259225729271099747138.jpg"),
          StudyCard(title: "Ghép thuật ngữ", description: "Ghép thuật ngữ và mô tả", imageUrl: "https://cdn.tuoitre.vn/thumb_w/480/2021/7/10/10-7-tho-bay-mau-5read-only-16259225729271099747138.jpg"),
          StudyCard(title: "Luyện nghe", description: "Rè luyện kĩ năng nghe", imageUrl: "https://cdn.tuoitre.vn/thumb_w/480/2021/7/10/10-7-tho-bay-mau-5read-only-16259225729271099747138.jpg"),
        ]),
    SkillCard(title: "2.6.Skills", description: "24 thuật ngữ", imageUrl: "https://cdn.tuoitre.vn/thumb_w/480/471584752817336320/2023/4/8/tbm-3-1680922524017298081671.jpg", startDate: DateTime(2023,5,10), skillTasks: []),
    SkillCard(title: "2.7.Skills", description: "25 thuật ngữ", imageUrl: "https://cdn.tuoitre.vn/thumb_w/480/471584752817336320/2023/4/8/tbm-3-1680922524017298081671.jpg", startDate: DateTime(2023,8,10), skillTasks: []),
    SkillCard(title: "2.8.aaas", description: "29 thuật ngữ", imageUrl: "https://cdn.tuoitre.vn/thumb_w/480/2021/7/10/10-7-tho-bay-mau-5read-only-16259225729271099747138.jpg", startDate: DateTime(2024,1,10), skillTasks: []),
];

final Folder folders =
  Folder(
      title: "Family and Friends",
      listTerms: [
        Terms(),
        Terms(),
        Terms(),
        Terms(),
        Terms(),
      ]
  );
