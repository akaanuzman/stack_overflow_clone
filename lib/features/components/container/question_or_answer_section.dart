import 'package:flutter/material.dart';
import '../../../core/base/base_singleton.dart';
import '../../../core/extensions/ui_extensions.dart';

import '../../../uikit/decoration/special_container_decoration.dart';

class QuestionOrAnswerSection extends StatelessWidget with BaseSingleton {
  final String content;
  const QuestionOrAnswerSection({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.maxFinite,
      padding: context.padding2x,
      decoration: SpecialContainerDecoration(
        context: context,
        color: colors.grey3,
      ),
      child: Text(content),
    );
  }
}
