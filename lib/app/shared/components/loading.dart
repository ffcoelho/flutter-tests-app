import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'loading.g.dart';

abstract class ILoading {
  void show();
  Future<void> hide();
}

@Injectable(singleton: false)
class Loading implements ILoading {
  OverlayEntry _entry;

  Loading() {
    _entry = OverlayEntry(
      builder: (context) {
        return Container(
          color: Colors.black.withOpacity(.3),
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  @override
  Future<void> hide() async {
    _entry.remove();
    await Future.delayed(Duration(milliseconds: 500));
  }

  @override
  void show() {
    FocusManager.instance.primaryFocus.unfocus();
  }
}