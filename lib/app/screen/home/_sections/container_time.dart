part of 'package:r5/app/screen/home/page.dart';

class ContainerTime extends StatelessWidget {
  const ContainerTime({
    super.key,
    required this.dateTime,
  });

  final ItemTime dateTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
        VerifikSpacing.sl,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10.0,
        ),
        color: Colors.blue,
      ),
      child: Row(
        children: [
          if (dateTime.day > 0) ...[
            VerifikText.labelText(
              label: '${dateTime.day}d',
              color: Colors.white,
              textOverflow: TextOverflow.ellipsis,
            ),
          ],
          if (dateTime.hour > 0 && dateTime.hour < 25) ...[
            VerifikText.labelText(
              label: '${dateTime.hour}h',
              color: Colors.white,
              textOverflow: TextOverflow.ellipsis,
            ),
          ],
          if (dateTime.minute >= 0 && dateTime.minute < 60) ...[
            VerifikText.labelText(
              label: dateTime.minute == 0 ? '1m' : '${dateTime.minute}m',
              color: Colors.white,
              textOverflow: TextOverflow.ellipsis,
            ),
          ]
        ],
      ),
    );
  }
}
