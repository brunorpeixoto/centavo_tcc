import 'package:centavo_tcc/models/category.dart';
import 'package:centavo_tcc/screens/category/category_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:centavo_tcc/stores/donate_store.dart';
import 'package:mobx/mobx.dart';

class CategoryField extends StatelessWidget {
  CategoryField(this.donateStore);

  final DonateStore donateStore;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Column(
        children: [
          ListTile(
            title: Text(
              'Categoria *',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
            subtitle: donateStore.category == null
                ? null
                : Text(
                    '${donateStore.category.description}',
                    style: TextStyle(color: Colors.black, fontSize: 17),
                  ),
            trailing: Icon(Icons.keyboard_arrow_down),
            onTap: () async {
              final category = await showDialog(
                context: context,
                builder: (_) => CategoryScreen(
                  showAll: false,
                  selected: donateStore.category,
                ),
              );
              if (category != null) {
                donateStore.setCategory(category);
              }
            },
          ),
          if (donateStore.categoryError != null)
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.red)),
              ),
              padding: const EdgeInsets.fromLTRB(16, 8, 0, 0),
              child: Text(
                donateStore.categoryError,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
            )
          else
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey[500]),
                ),
              ),
            )
        ],
      );
    });
  }
}
