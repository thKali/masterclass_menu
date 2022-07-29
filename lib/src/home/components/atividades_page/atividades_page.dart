import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:masterclass_menu/src/assets/db_icons.dart';

class AtividadesPage extends StatefulWidget {
  const AtividadesPage({Key? key}) : super(key: key);

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
            urlFonte: '',
          ),
          buildCard(
            context,
            icon: DBIcons.toys,
            title: 'Playground',
            quantidadeDeExercicios: 0,
            desc: 'Ambiente destinado a testes e estudos em geral.',
            urlFonte: '',
          ),
          buildCard(
            context,
            icon: DBIcons.glasses,
            title: 'Leitura de Mockup',
            quantidadeDeExercicios: 0,
            desc: 'Aplicação da técnica de leitura de mockup, contendo 2 exercícios.',
            urlFonte: '',
          ),
        ],
      ),
    );
  }

  Widget buildCard(BuildContext context,
      {required String title,
      required int quantidadeDeExercicios,
      required String desc,
      required String urlFonte, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.28,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Theme.of(context).colorScheme.primary,
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
                              ?.copyWith(fontSize: 12, color: Colors.white),
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
                        //TODO: launchurl
                        print('launchUrl $urlFonte');
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
                        onPressed: () {},
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
