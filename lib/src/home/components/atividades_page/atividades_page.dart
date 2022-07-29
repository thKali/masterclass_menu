import 'package:flutter/material.dart';
import 'package:masterclass_menu/src/assets/db_icons.dart';
import 'package:masterclass_menu/src/home/components/atividades_page/components/info_page.dart';
import 'package:url_launcher/url_launcher.dart';

class AtividadesPage extends StatefulWidget {
  const AtividadesPage(
      {Key? key, required this.appBarBuilder, required this.switchDarkMode})
      : super(key: key);
  final AppBar Function(
    BuildContext context, {
    required void Function() callback,
    int? selectedIndex,
    String? title,
  }) appBarBuilder;

  final void Function() switchDarkMode;

  @override
  State<AtividadesPage> createState() => _AtividadesPageState();
}

class _AtividadesPageState extends State<AtividadesPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView(
        children: [
          buildCard(
            context,
            icon: DBIcons.running,
            title: 'Animações',
            quantidadeDeExercicios: 0,
            desc:
                'Estuda sobre animações implicitas e controladas contendo quatro exercícios e dois estudos.',
            urlFonte: 'http://google.com',
            items: [],
          ),
          buildCard(
            context,
            icon: DBIcons.toys,
            title: 'Playground',
            quantidadeDeExercicios: 0,
            desc: 'Ambiente destinado a testes e estudos em geral.',
            urlFonte: 'https://google.com',
            items: [],
          ),
          buildCard(
            context,
            icon: DBIcons.glasses,
            title: 'Leitura de Mockup',
            quantidadeDeExercicios: 0,
            desc:
                'Aplicação da técnica de leitura de mockup, contendo 2 exercícios.',
            urlFonte: 'asuhduhasud',
            items: [
              '/tinder',
              '/mockup',
              '/animacao-implicita',
            ],
          ),
        ],
      ),
    );
  }

  sendToNewPage(items) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => InfoPage(
            callback: widget.appBarBuilder,
            switchDarkMode: widget.switchDarkMode,
            title: 'Leitura de Mockup',
            items: items),
      ),
    );
  }

  Widget buildCard(
    BuildContext context, {
    required String title,
    required int quantidadeDeExercicios,
    required String desc,
    required String urlFonte,
    required IconData icon,
    required List<String> items,
  }) {
    Future<void> _launchUrl(String _url) async {
      try {
        if (!await launchUrl(Uri.parse(_url),
            mode: LaunchMode.externalApplication)) {
          throw 'Could not launch $_url';
        }
      } catch (err) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Alerta'),
            content:
                const Text('O Link está quebrado, alerte o desenvolvedor!'),
            actions: [
              TextButton(
                onPressed: () {
                  if (Navigator.of(context).canPop()) {
                    Navigator.pop(context);
                  }
                },
                child: const Text('Ok'),
              )
            ],
          ),
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.28,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          child: Icon(
                            icon,
                            color: Theme.of(context).colorScheme.secondary,
                            size: 32,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          title,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text('Exercícios: '),
                        const SizedBox(width: 8),
                        Text(
                          '$quantidadeDeExercicios',
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              ?.copyWith(
                                  fontSize: 12,
                                  color: Theme.of(context).colorScheme.surface),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  desc,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        _launchUrl(urlFonte);
                      },
                      child: Row(
                        children: [
                          const Icon(
                            DBIcons.git,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Acessar código fonte',
                            style: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 118,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        onPressed: () => sendToNewPage(items),
                        child: Text(
                          'Ver mais',
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              ?.copyWith(fontSize: 12, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
