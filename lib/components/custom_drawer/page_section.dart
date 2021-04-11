import 'package:centavo_tcc/components/custom_drawer/page_tile.dart';
import 'package:centavo_tcc/stores/page_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class PageSection extends StatelessWidget {

  final PageStore pageStore = GetIt.I<PageStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PageTile(
          label: 'Procurar',
          iconData: Icons.list,
          onTap: (){
            pageStore.setPage(0);
          },
          highlighted: pageStore.page == 0,
        ),
        PageTile(
          label: 'Doar item',
          iconData: Icons.favorite,
          onTap: (){
            pageStore.setPage(1);
          },
          highlighted: pageStore.page == 1,
        ),
        PageTile(
          label: 'Solicitar item',
          iconData: Icons.edit,
          onTap: (){
            pageStore.setPage(2);
          },
          highlighted: pageStore.page == 2,
        ),
        PageTile(
          label: 'Chat',
          iconData: Icons.chat,
          onTap: (){
            pageStore.setPage(3);
          },
          highlighted: pageStore.page == 3,
        ),
        PageTile(
          label: 'Favoritos',
          iconData: Icons.save,
          onTap: (){
            pageStore.setPage(4);
          },
          highlighted: pageStore.page == 4,
        ),
        PageTile(
          label: 'Minha Conta',
          iconData: Icons.person,
          onTap: (){
            pageStore.setPage(5);
          },
          highlighted: pageStore.page == 5,
        )
      ],
    );
  }
}