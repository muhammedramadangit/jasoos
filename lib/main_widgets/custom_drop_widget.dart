import 'package:flutter/material.dart';
import 'package:jasoos/helper/text_styles.dart';

class CustomDropWidget extends StatefulWidget {
  final Widget? title;
  final String? text;
  final Widget? child;
  final bool? isOpen;
  const CustomDropWidget({super.key, this.child, this.isOpen, this.title, this.text});

  @override
  State<CustomDropWidget> createState() => _CustomDropWidgetState();
}

class _CustomDropWidgetState extends State<CustomDropWidget> {
  bool? isOpen;

  @override
  void initState() {
    isOpen = widget.isOpen ?? true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() => isOpen = !isOpen!);
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Row(
            children: [
              Expanded(
                child: widget.title ?? Text(
                  widget.text ?? "",
                  style: AppTextStyles.w600.copyWith(fontSize: 18),
                ),
              ),
              SizedBox(width: 10),
              Icon(isOpen == false ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_up),
            ],
          ),
        ),
        isOpen == true ? widget.child ?? SizedBox() : SizedBox(),
      ],
    );
  }
}
