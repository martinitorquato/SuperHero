import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sami_heroes/src/pages/home/details/details_page.dart';
import 'package:sami_heroes/src/shared/cached_network_image.dart';
import '../../../models/super_hero_model.dart';

class SuperHeroItem extends StatelessWidget {
  final SamiHeroModel superHero;

  const SuperHeroItem({
    Key key,
    @required this.superHero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(superHero.name),
      leading: Hero(
        tag: superHero.id,
        child: CustomCachedNetworkImage(
          imageUrl: superHero.image.url,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Theme.of(context).primaryColor,
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => DetailsPage(samiHero: superHero),
        ),
      ),
    );
  }
}
