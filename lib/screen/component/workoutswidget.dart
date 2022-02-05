import 'package:flutter/material.dart';

import '../../constants.dart';

class WorkOutsWidget extends StatefulWidget {
  const WorkOutsWidget(
      {Key? key,
      required this.headTitle,
      required this.headSubtitle,
      required this.child,
      required this.isSeconPage})
      : super(key: key);
  final String headTitle;
  final String headSubtitle;
  final Widget child;
  final bool isSeconPage;
  @override
  _WorkOutsWidgetState createState() => _WorkOutsWidgetState();
}

class _WorkOutsWidgetState extends State<WorkOutsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: linearBoxDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: kDefaultSize * 2),
            WorkoutsHeader(
                isAppBackButton: widget.isSeconPage,
                title: widget.headTitle,
                subtitle: widget.headSubtitle),
            WorkoutsBody(
              bodyWidget: widget.child,
            )
          ],
        ),
      ),
    );
  }
}

class WorkoutsHeader extends StatelessWidget {
  const WorkoutsHeader({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.isAppBackButton,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final bool isAppBackButton;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              isAppBackButton
                  ? IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: kDefaultSize * 1.7,
                        color: Colors.white,
                      ),
                    )
                  : Container(),
              Text(
                title,
                style:
                    TextStyle(color: Colors.white, fontSize: kDefaultSize * 2),
              ),
            ],
          ),
          isAppBackButton ? Container() : SizedBox(height: kDefaultSize / 2),
          isAppBackButton
              ? Container()
              : Text(
                  subtitle,
                  style: TextStyle(
                      color: Colors.white, fontSize: kDefaultSize * .8),
                ),
        ],
      ),
    );
  }
}

class WorkoutsBody extends StatelessWidget {
  const WorkoutsBody({
    Key? key,
    required this.bodyWidget,
  }) : super(key: key);
  final Widget bodyWidget;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: borderTopLRBoxDec,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(kDefaultSize),
              child: Column(
                children: [
                  bodyWidget,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
