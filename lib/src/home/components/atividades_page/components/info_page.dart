import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({
    Key? key,
    required this.callback,
    required this.switchDarkMode,
    required this.items,
    required this.title,
  }) : super(key: key);

  final void Function() switchDarkMode;
  final String title;
  final List items;

  final AppBar Function(
    BuildContext context, {
    required void Function() callback,
    int? selectedIndex,
    String? title,
  }) callback;

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: widget.callback(context,
          callback: widget.switchDarkMode, title: widget.title),
      body: widget.items.isEmpty
          ? Center(
              child: Text(
                'Ainda não há exercícios.',
                style: Theme.of(context).textTheme.headline1,
              ),
            )
          : ListView(
              children: List.generate(widget.items.length,
                  (index) => buildRowExercicio(index, widget.items[index])),
            ),
    );
  }

  Container buildRowExercicio(int numeroExercicio, String route) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(route);
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      child: Text(
                        '$numeroExercicio',
                        style: Theme.of(context).textTheme.headline2?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface),
                      ),
                    ),
                    Text(
                      'Exercício ${numeroExercicio.toString().padLeft(2, '0')}',
                      style: Theme.of(context).textTheme.headline2?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
