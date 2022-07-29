import 'package:flutter/material.dart';
import 'package:masterclass_menu/src/assets/db_icons.dart';

class DevPage extends StatefulWidget {
  const DevPage({Key? key}) : super(key: key);

  @override
  State<DevPage> createState() => _DevPageState();
}

class _DevPageState extends State<DevPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        clipBehavior: Clip.antiAlias,
                        child: Image.network(
                            'https://avatars.githubusercontent.com/u/100535432?v=4'),
                      ),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.background,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Kali',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'Um programador lelé da cuca, cheio de coisas pra fazer mas não sabe bem por onde começar. Prazer! :p',
                      style: Theme.of(context).textTheme.bodyText2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(DBIcons.whatsapp),
                        onPressed: () {
                          
                        },
                      ),
                      IconButton(
                        icon: const Icon(DBIcons.gitAlt),
                        onPressed: () {

                        },
                      ),
                      IconButton(
                        icon: const Icon(DBIcons.instagram),
                        onPressed: () {

                        },
                      ),
                      IconButton(
                        icon: const Icon(DBIcons.facebook),
                        onPressed: () {
                          
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Tecnologias Favoritas',
              style:
                  Theme.of(context).textTheme.headline2?.copyWith(fontSize: 12),
            ),
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Align(
                child: SizedBox(
                  width: 90,
                  height: 90,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(DBIcons.flutter, size: 36),
                          const SizedBox(height: 4),
                          Text(
                            'Flutter',
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 8),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Habilidades e Competências',
              style:
                  Theme.of(context).textTheme.headline2?.copyWith(fontSize: 12),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
              child: Column(
                children: [
                  buildHabilityRow(context, 'Dart/Flutter', 0.83),
                  const SizedBox(height: 16),
                  buildHabilityRow(context, 'Git', 0.74),
                  const SizedBox(height: 16),
                  buildHabilityRow(context, 'Javascript', 0.64),
                  const SizedBox(height: 16),
                  buildHabilityRow(context, 'Python', 0.54),
                  const SizedBox(height: 16),
                  buildHabilityRow(context, 'Advpl', 0.44),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Row buildHabilityRow(
      BuildContext context, String hability, double porcentagem) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(hability),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.background,
          ),
          height: 10,
          width: 200,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 200 * porcentagem,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
