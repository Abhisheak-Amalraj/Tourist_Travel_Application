import 'package:flutter/material.dart';
import 'package:yttravel/screens/places/logic/place_logic.dart';
import 'package:yttravel/screens/places/model/distanceVo.dart';
import 'package:yttravel/screens/places/model/placeVo.dart';
import 'package:provider/provider.dart';

class DistanceView extends StatefulWidget {
  const DistanceView(this.item, {Key? key}) : super(key: key);
  final Results item;

  @override
  State<DistanceView> createState() => _DistanceViewState();
}

class _DistanceViewState extends State<DistanceView> {
  late ValueNotifier<DistanceVo?> distanceNotifier;
  String? distance;
  String? duration;

  void _onChange() {
    var value = distanceNotifier.value;
    if (value != null) {
      if (value.plateId != null && widget.item.placeId == value.plateId) {
        setState(() {
          distance = value.rows?[0].elements?[0].distance?.text ?? '';
          duration = value.rows?[0].elements?[0].duration?.text ?? '';
        });
      }
    }
  }

  void _init() {
    var logic = context.read<PlateLogic>();
    distanceNotifier = logic.distance;
    distanceNotifier.addListener(_onChange);
    var plateId = widget.item.placeId;
    var hasContainer =
        logic.distanceList.any((element) => element.plateId == plateId);
    if (plateId != null && hasContainer == false) {
      logic.getDistance(widget.item.geometry?.location?.lat,
          widget.item.geometry?.location?.lng, widget.item.placeId);
    }
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(covariant DistanceView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.item != widget.item) {
      distanceNotifier.removeListener(_onChange);
      _init();
    }
  }

  @override
  void dispose() {
    distanceNotifier.removeListener(_onChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${distance ?? '--'},${duration ?? '--'}',
        ),
        const Icon(Icons.directions_run, size: 16),
      ],
    );
  }
}
