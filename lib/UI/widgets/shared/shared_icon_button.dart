import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SharedIconButton extends StatefulWidget {
  const SharedIconButton({
    super.key,
    required this.icon,
    this.onTap,
  });
  final IconData icon;
  final Function()? onTap;

  @override
  State<SharedIconButton> createState() => _SharedIconButtonState();
}

class _SharedIconButtonState extends State<SharedIconButton> {
  late Color color;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    color = Theme.of(context).colorScheme.onBackground;
  }

  @override
  Widget build(BuildContext context) {
    DeviceScreenType deviceType = getDeviceType(MediaQuery.of(context).size);
    double width = MediaQuery.of(context).size.width;
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          color = Theme.of(context).colorScheme.secondary;
        });
      },
      onExit: (event) {
        setState(() {
          color = Theme.of(context).colorScheme.onBackground;
        });
      },
      child: IconButton(
        onPressed: widget.onTap,
        iconSize: width * .02,
        icon: Icon(
          widget.icon,
          color: color,
          size: (deviceType == DeviceScreenType.mobile) ? width * .08 : null,
        ),
      ),
    );
  }
}

class SharedTextIconButton extends StatefulWidget {
  const SharedTextIconButton({Key? key, required this.text, this.onTap}) : super(key: key);
  final String text;
  final Function()? onTap;

  @override
  State<SharedTextIconButton> createState() => _SharedTextIconButtonState();
}

class _SharedTextIconButtonState extends State<SharedTextIconButton> {
  late Color color;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    color = Theme.of(context).colorScheme.onBackground;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          color = Theme.of(context).colorScheme.secondary;
        });
      },
      onExit: (event) {
        setState(() {
          color = Theme.of(context).colorScheme.onBackground;
        });
      },
      child: IconButton(
        onPressed: widget.onTap,
        icon: Text(widget.text, style: TextStyle(color: color, fontFamily: 'PixelifySans')),
      ),
    );
  }
}
