import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yttravel/screens/places/logic/place_logic.dart';
import 'package:yttravel/screens/places/model/placeVo.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:yttravel/screens/places/utils/image_util.dart';
import 'package:yttravel/screens/places/widget/distance_view.dart';

import 'detail/place_detail_page.dart';

class PlateLibraryPage extends StatefulWidget {
  const PlateLibraryPage({Key? key}) : super(key: key);

  @override
  State<PlateLibraryPage> createState() => _PlateLibraryPageState();
}

class _PlateLibraryPageState extends State<PlateLibraryPage> {
  @override
  Widget build(BuildContext context) {
    return Selector<PlateLogic, List<Results>>(
      builder: (context, value, child) {
        if (value.isEmpty) return const Center(child: Text('no data'));
        return ListView.builder(
          padding: const EdgeInsets.only(top: 8),
          itemCount: value.length,
          itemBuilder: (context, index) {
            var item = value[index];
            return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return PlateDetailPage(item.placeId ?? '');
                  },
                ));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            ImageUtil.fullImage(
                                item.photos?[0].photoReference ?? ''),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name ?? '',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                              '${item.geometry?.location?.lat ?? ''},${item.geometry?.location?.lng ?? ''}'),
                          const SizedBox(height: 10),
                          DistanceView(item),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
      selector: (context, logic) => logic.library.value ?? [],
      shouldRebuild: (previous, next) => previous != next,
    );
  }
}
