import 'package:flutter/material.dart';

class GetBuilder<T> extends StatefulWidget {
  final T init;
  final Scaffold Function(T) builder;

  GetBuilder({
    required this.init,
    required this.builder,
  }) {}

  getBuilder() {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("${widget.init.runtimeType}"),
    //   ),
    // );
    return this.builder(init);
  }

  @override
  State<GetBuilder> createState() => GetBuilderState();
}

class GetBuilderState extends State<GetBuilder> {
  @override
  void initState() {
    (widget.init).state = this;
    widget.init.onInit();
    super.initState();
  }

  @override
  void dispose() {
    widget.init.onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    (widget.init).state = this;
    return Material(
      child: widget.getBuilder(),
    );
    // var c = LoginController();
    // return MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (_) => c),
    //     // ChangeNotifierProvider(create: (_) => LoginController()),
    //   ],
    //   child: Consumer<T>(
    //     builder: (context, changeNotifier, child) {
    //       return builder(changeNotifier);
    //     },
    //   ),
    // );
  }
}
