// ignore_for_file: invalid_use_of_visible_for_testing_member
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class GetxController with ChangeNotifier, DiagnosticableTreeMixin {
  late State state;
  GetxController get() {
    return GetxController();
  }

  onInit() {}
  onReady() {}
  onDispose() {}

  update() {
    // ignore: invalid_use_of_protected_member
    if (this.state.mounted) this.state.setState(() {});
  }
}
