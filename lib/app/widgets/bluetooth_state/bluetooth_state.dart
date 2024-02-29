part of widgets;

enum BluetoothState {
  notPaired,
  pairedAndInRange,
  pairedAndNotInRange,
  bluetoothDisabled,
}

class AW_BluetoothState extends StatelessWidget {
  const AW_BluetoothState({@required this.widgetKey, @required this.bluetoothImage, @required this.bluetoothState = BluetoothState.notPaired, this.onTap});

  final Key? widgetKey;
  final String? bluetoothImage;
  final BluetoothState bluetoothState;
  final Function? onTap;

  bool _isImageEmpty() => bluetoothImage!.isEmpty;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap!(),
      child: Container(
        alignment: Alignment.topRight,
        height: 50,
        width: 50,
        key: widgetKey!,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (_isImageEmpty()) const SizedBox() else Container(child: SvgPicture.asset(bluetoothImage!)),
            const SizedBox(width: 2),
            Container(
              height: 6,
              width: 6,
              decoration: BoxDecoration(color: _getDotColor(bluetoothState), borderRadius: const BorderRadius.all(Radius.circular(20))),
            ),
            // if (bluetoothState == BluetoothState.notPaired)
            //   const SizedBox()
            // else
            //   Container(
            //     height: 6,
            //     width: 6,
            //     decoration: BoxDecoration(color: _getDotColor(bluetoothState), borderRadius: const BorderRadius.all(Radius.circular(20))),
            //   ),
          ],
        ),
      ),
    );
  }
}

Color _getDotColor(BluetoothState state) {
  if (state == BluetoothState.bluetoothDisabled) {
    return Colors.red;
  } else if (state == BluetoothState.pairedAndInRange) {
    return Colors.green;
  } else if (state == BluetoothState.pairedAndNotInRange) {
    return Colors.orange;
  } else {
    return Colors.orange;
  }
}
