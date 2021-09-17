import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:api_rxdart/bloc/main_bloc.dart';
import 'package:api_rxdart/models/color_response.dart';

class ColorWidget extends StatefulWidget {
  const ColorWidget({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ColorWidgetState();
  }
}

class _ColorWidgetState extends State<ColorWidget> {
  @override
  void initState() {
    super.initState();
    bloc.getColor();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ColorResponse>(
      stream: bloc.subject.stream,
      builder: (context, AsyncSnapshot<ColorResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.error.isNotEmpty) {
            return errorWidget(snapshot.data!.error);
          }
          return userWidget(snapshot.data!);
        } else if (snapshot.hasError) {
          return errorWidget(snapshot.error.toString());
        } else {
          return loadingWidget();
        }
      },
    );
  }

  Widget loadingWidget() {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [Text("Loading data..."), CircularProgressIndicator()],
        ));
  }

  Widget errorWidget(String error) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Error: $error"),
          ],
        ));
  }

  Widget userWidget(ColorResponse data) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Color"),
          ],
        ));
  }
}