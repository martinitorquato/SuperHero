import 'package:flutter/material.dart';
import 'package:sami_heroes/src/models/super_hero_model.dart';
import 'package:sami_heroes/src/pages/home/details/components/sami_hero_header.dart';

import '../../../i18n/app_locale.dart';
import '../../../models/super_hero_model.dart';

class DetailsPage extends StatefulWidget {
  final SamiHeroModel samiHero;

  const DetailsPage({Key key, @required this.samiHero}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  AppLocale _locale;
  @override
  Widget build(BuildContext context) {
    _locale = AppLocale.of(context);
    final double heightSpace = 8.0;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SamiHeroHeader(
              superHeroId: widget.samiHero.id,
              imageURL: widget.samiHero.image.url,
              name: widget.samiHero.name,
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  SizedBox(height: 16.0),
                  Text(_locale.getString('power_stats_label'),
                      style: textTheme.headline4),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text(
                                  _locale.getString('intelligence_label'),
                                  style: textTheme.caption
                                      .copyWith(fontWeight: FontWeight.bold)),
                            ),
                            Expanded(
                              child: Text(
                                widget.samiHero.getFieldOrDefaultValue(
                                  widget.samiHero.powerStats.intelligence,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('strength_label'),
                                    style: textTheme.caption.copyWith(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.samiHero.getFieldOrDefaultValue(
                                  widget.samiHero.powerStats.strength,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('speed_label'),
                                    style: textTheme.caption.copyWith(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.samiHero.getFieldOrDefaultValue(
                                  widget.samiHero.powerStats.speed,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(
                                    _locale.getString('durability_label'),
                                    style: textTheme.caption.copyWith(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.samiHero.getFieldOrDefaultValue(
                                  widget.samiHero.powerStats.durability,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('power_label'),
                                    style: textTheme.caption.copyWith(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.samiHero.getFieldOrDefaultValue(
                                  widget.samiHero.powerStats.power,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('combat_label'),
                                    style: textTheme.caption.copyWith(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.samiHero.getFieldOrDefaultValue(
                                  widget.samiHero.powerStats.combat,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(_locale.getString('biography_label'),
                      style: textTheme.headline4),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('fullname_label'),
                                    style: textTheme.caption.copyWith(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.samiHero.getFieldOrDefaultValue(
                                  widget.samiHero.biography.fullName,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(
                                    _locale.getString('alter_egos_label'),
                                    style: textTheme.caption.copyWith(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                                child:
                                    Text(widget.samiHero.biography.alterEgos)),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('aliases_label'),
                                    style: textTheme.caption.copyWith(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: List.generate(
                                  widget.samiHero.biography.aliases.length,
                                  (i) => Text(
                                      widget.samiHero.biography.aliases[i]),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(
                                    _locale.getString('place_birth_label'),
                                    style: textTheme.caption.copyWith(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                                child: Text(
                                    widget.samiHero.biography.placeOfBirth)),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(
                                    _locale.getString('first_appearance_label'),
                                    style: textTheme.caption.copyWith(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.samiHero.getFieldOrDefaultValue(
                                  widget.samiHero.biography.firstAppearance,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(
                                    _locale.getString('publisher_label'),
                                    style: textTheme.caption.copyWith(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.samiHero.getFieldOrDefaultValue(
                                  widget.samiHero.biography.publisher,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(
                                    _locale.getString('alignment_label'),
                                    style: textTheme.caption.copyWith(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                                child:
                                    Text(widget.samiHero.biography.alignment)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    _locale.getString('appearance_label'),
                    style: textTheme.headline4,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('gender_label'),
                                    style: textTheme.caption.copyWith(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.samiHero.getFieldOrDefaultValue(
                                  widget.samiHero.appearance.gender,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(
                              _locale.getString('race_label'),
                              style: textTheme.caption
                                  .copyWith(fontWeight: FontWeight.bold),
                            )),
                            Expanded(
                              child: Text(
                                widget.samiHero.getFieldOrDefaultValue(
                                  widget.samiHero.appearance.race,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('height_label'),
                                    style: textTheme.caption.copyWith(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                                child: Text(
                                    widget.samiHero.appearance.height.last)),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('weight_label'),
                                    style: textTheme.caption.copyWith(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                                child: Text(
                                    widget.samiHero.appearance.weight.last)),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(
                                    _locale.getString('eye_color_label'),
                                    style: textTheme.caption.copyWith(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.samiHero.getFieldOrDefaultValue(
                                  widget.samiHero.appearance.eyeColor,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(
                                    _locale.getString('hair_color_label'),
                                    style: textTheme.caption.copyWith(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.samiHero.getFieldOrDefaultValue(
                                  widget.samiHero.appearance.hairColor,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(_locale.getString('work_label'),
                      style: textTheme.headline4),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(
                                    _locale.getString('occupation_label'),
                                    style: textTheme.caption.copyWith(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.samiHero.getFieldOrDefaultValue(
                                  widget.samiHero.work.occupation,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(_locale.getString('base_label'),
                                    style: textTheme.caption.copyWith(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.samiHero.getFieldOrDefaultValue(
                                  widget.samiHero.work.base,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(_locale.getString('connections_label'),
                      style: textTheme.headline4),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(
                                    _locale
                                        .getString('group_affiliation_label'),
                                    style: textTheme.caption.copyWith(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.samiHero.getFieldOrDefaultValue(
                                  widget.samiHero.connections.groupAffiliation,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: heightSpace),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                                child: Text(
                                    _locale.getString('relatives_label'),
                                    style: textTheme.caption.copyWith(
                                        fontWeight: FontWeight.bold))),
                            Expanded(
                              child: Text(
                                widget.samiHero.getFieldOrDefaultValue(
                                  widget.samiHero.connections.relatives,
                                  _locale.getString('not_available_text'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
