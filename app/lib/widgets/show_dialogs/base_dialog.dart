import 'package:flutter/material.dart';

// 다이얼로그의 추상 클래스
// (StatelessWidget을 상속받으므로, 자식들도 자동으로 위젯이 됩니다)
abstract class BaseDialog extends StatelessWidget {
  const BaseDialog({super.key});
}

// 2. BaseDialog를 상속받은 녀석들은 모두 이 기능을 가집니다.
extension BaseDialogExtension on BaseDialog {
  Future<T?> show<T>(BuildContext context, {bool barrierDismissible = true}) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => this,
    );
  }
}
