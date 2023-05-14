import 'package:flutter/material.dart';
import 'package:cricket_mania/app/utils/constants.dart';

class CustomInputWithError extends StatefulWidget {
  final Widget inputWidget;
  final Stream<String?> errorStream;

  const CustomInputWithError(
      {required this.inputWidget, required this.errorStream, Key? key})
      : super(key: key);

  @override
  _CustomInputWithErrorState createState() => _CustomInputWithErrorState();
}

class _CustomInputWithErrorState extends State<CustomInputWithError> {
  // final dataKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.inputWidget,
        StreamBuilder<String?>(
          // key: dataKey,
          stream: widget.errorStream,
          builder: (context, AsyncSnapshot<String?> snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              // Scrollable.ensureVisible(dataKey.currentContext);
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
                child: Text(
                  snapshot.data!,
                  style: captionGrey.copyWith(color: Colors.red),
                ),
              );
            } else {
              return Container();
            }
          },
        ),
      ],
    );
  }

  _CustomInputWithErrorState();
}
