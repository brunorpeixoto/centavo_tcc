import 'package:cached_network_image/cached_network_image.dart';
import 'package:centavo_tcc/screens/ad/ad_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:centavo_tcc/models/ad.dart';
import 'package:centavo_tcc/stores/home_store.dart';
import 'package:centavo_tcc/helpers/extensions.dart';

class AdTile extends StatelessWidget {
  AdTile(this.ad);

  final Ad ad;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => AdScreen(ad)));
      },
      child: Container(
        height: 135,
        margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 8,
          child: Row(
            children: [
              SizedBox(
                height: 135,
                width: 127,
                child: Image.network(ad.images
                    .first), /*CachedNetworkImage(
                  imageUrl: ad.images.isEmpty
                      ? 'https://static.thenounproject.com/png/194055-200.png'
                      : ad.images.first,
                  fit: BoxFit.cover,
                ),*/
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ad.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${ad.created.formattedDate()} - '
                          '${ad.address.city.name} - '
                          '${ad.address.uf.initials}',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}