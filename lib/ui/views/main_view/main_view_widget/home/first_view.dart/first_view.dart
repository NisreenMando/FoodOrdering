import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_shopping/core/data/models/api/model_home3.dart';
import 'package:easy_shopping/ui/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:easy_shopping/core/translations/app_translation.dart';

class FirstView extends StatefulWidget {
  final List<Restaurent> first;
  const FirstView({super.key, required this.first});

  @override
  State<FirstView> createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              tr('popular'),
              style: const TextStyle(color: AppColors.gray700, fontSize: 20),
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: widget.first.length,
                  itemBuilder: (context, index) {
                    return view(
                      iconpath: widget.first[index].iconpath,
                      typefood: widget.first[index].typefood,
                      country: widget.first[index].country,
                      ranking: widget.first[index].ranking,
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget view({
    String? iconpath,
    String? typefood,
    String? country,
    String? ranking,
  }) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: CachedNetworkImage(
              imageUrl: iconpath!,
              width: MediaQuery.of(context).size.width,
              height: size.longestSide / 2.3,
              fit: BoxFit.cover,
              alignment: Alignment.center),
        ),
        Padding(
          padding: EdgeInsets.only(left: size.width / 20, top: 8),
          child: Text(
            tr(typefood!),
            style: const TextStyle(
                fontSize: 16,
                color: AppColors.gray700,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25, top: size.height / 60),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/stars.png',
                width: 15,
                height: 15,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 3),
                child: Text(
                  '4.9',
                  style: TextStyle(color: AppColors.orange, fontSize: 11),
                ),
              ),
              Row(
                children: [
                  Text(
                    tr(ranking!),
                    style:
                        const TextStyle(color: AppColors.gray400, fontSize: 12),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: 3,
                    height: 3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.orange),
                  ),
                ],
              ),
              Text(
                tr(country!),
                style: const TextStyle(color: AppColors.gray400, fontSize: 12),
              )
            ],
          ),
        ),
        SizedBox(
          height: size.height / 25,
        )
      ],
    );
  }
}
