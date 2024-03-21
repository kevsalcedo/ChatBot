import 'dart:math';

import 'package:yes_no_app/domain/entities/message.dart';

class YesNoModel {
  final String answer;
  final bool forced;
  final String image;

  YesNoModel({
    required this.answer,
    required this.forced,
    required this.image,
  });

  factory YesNoModel.fromJsonMap(Map<String, dynamic> json) => YesNoModel(
        answer: json['answer'],
        forced: json['forced'],
        image: json['image'],
      );

  Message toMessageEntity() {
    String translatedAnswer;

    final List<String> possibleYesResponses = [
      'Yes',
      'Okay',
      'Mmm... Yes',
    ];

    final List<String> possibleNoResponses = [
      'No',
      'Noup',
      'Not really',
    ];

    final Random random = Random();

    if (answer == 'yes') {
      final int randomIndex = random.nextInt(possibleYesResponses.length);
      translatedAnswer = possibleYesResponses[randomIndex];
    } else {
      final int randomIndex = random.nextInt(possibleNoResponses.length);
      translatedAnswer = possibleNoResponses[randomIndex];
    }

    return Message(
      text: translatedAnswer,
      fromWho: FromWho.bot,
      imageUrl: image,
    );
  }
}
