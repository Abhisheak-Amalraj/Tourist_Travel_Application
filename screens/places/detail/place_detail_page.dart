import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:yttravel/screens/places/logic/place_detail_logic.dart';
import 'package:yttravel/screens/places/model/place_detail_Vo.dart';
import 'package:yttravel/screens/places/utils/image_util.dart';
import 'package:yttravel/screens/places/utils/map_util.dart';

class PlateDetailPage extends StatelessWidget {
  const PlateDetailPage(this.plateId, {Key? key}) : super(key: key);
  final String plateId;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PlateDetailLogic>(
      create: (context) => PlateDetailLogic(),
      builder: (context, child) => PlateDetailBody(plateId),
    );
  }
}

class PlateDetailBody extends StatefulWidget {
  const PlateDetailBody(this.plateId, {Key? key}) : super(key: key);
  final String plateId;

  @override
  State<PlateDetailBody> createState() => _PlateDetailBodyState();
}

class _PlateDetailBodyState extends State<PlateDetailBody> {
  @override
  void initState() {
    super.initState();
    context.read<PlateDetailLogic>().getPlateDetail(widget.plateId);
  }

  @override
  Widget build(BuildContext context) {
    return Selector<PlateDetailLogic, PlateDetailVo?>(
      selector: (p0, p1) => p1.plateDetailVo.value,
      shouldRebuild: (previous, next) => previous != next,
      builder: (BuildContext context, value, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Place Detail'),
            actions: [
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  var lat = value?.result?.geometry?.location?.lat;
                  var lng = value?.result?.geometry?.location?.lng;
                  MapUtil.startMap(lat, lng);
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Icon(
                    Icons.map,
                    size: 20,
                  ),
                ),
              )
            ],
          ),
          body: value == null
              ? const Center(
                  child: Text('No Data'),
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              value.result?.name ?? '',
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              value.result?.editorialSummary?.overview ?? '',
                            ),
                            const SizedBox(height: 10),
                            Text(
                              value.result?.formattedAddress ?? '',
                            ),
                            const SizedBox(height: 10),
                            Text(
                              value.result?.openingHours?.weekdayText
                                      ?.join("\n") ??
                                  '',
                            ),
                            const SizedBox(height: 10),
                            RatingBar(
                              initialRating:
                                  value.result?.rating?.toDouble() ?? 0,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              ratingWidget: RatingWidget(
                                full: const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                half: const Icon(
                                  Icons.star_half,
                                  color: Colors.amber,
                                ),
                                empty: const Icon(
                                  Icons.star_outline,
                                  color: Colors.amber,
                                ),
                              ),
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: value.result?.photos?.length ?? 0,
                        itemBuilder: (context, index) {
                          var item = value.result?.photos![index];
                          return Container(
                            child: CachedNetworkImage(
                              imageUrl: ImageUtil.fullImage(
                                  item?.photoReference ?? ''),
                            ),
                          );
                        },
                      )
                    ],
                  ),
                ),
        );
      },
    );
  }
}
