import 'package:centavo_tcc/components/custom_drawer/custom_drawer.dart';
import 'package:centavo_tcc/components/error_box.dart';
import 'package:centavo_tcc/models/ad.dart';
import 'package:centavo_tcc/screens/myads/myads_screen.dart';
import 'package:centavo_tcc/stores/page_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'components/HidePhoneField.dart';
import 'components/category_field.dart';
import 'components/cep_field.dart';
import 'components/images_field.dart';
import 'package:centavo_tcc/stores/donate_store.dart';

class DonateScreen extends StatefulWidget {
  DonateScreen({this.ad});

  final Ad ad;

  @override
  _DonateScreenState createState() => _DonateScreenState(ad);
}

class _DonateScreenState extends State<DonateScreen> {
  _DonateScreenState(Ad ad)
      : editing = ad != null,
        donateStore = DonateStore(ad ?? Ad());

  final DonateStore donateStore;

  bool editing;

  @override
  void initState() {
    super.initState();

    when((_) => donateStore.savedAd, () {
      if (editing)
        Navigator.of(context).pop(true);
      else {
        GetIt.I<PageStore>().setPage(0);
        Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => MyAdsScreen(initialPage: 1)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(
      fontWeight: FontWeight.w800,
      color: Colors.grey,
      fontSize: 18,
    );

    final contentPadding = const EdgeInsets.fromLTRB(16, 10, 12, 10);

    return Scaffold(
      drawer: editing ? null : CustomDrawer(),
      appBar: AppBar(
        title: Text(editing ? 'Editar Item' : 'Doar Item'),
        //elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Card(
            clipBehavior: Clip.antiAlias,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 8,
            child: Observer(builder: (_) {
              if (donateStore.loading)
                return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text('Salvando Anúncio',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.amberAccent,
                          )),
                      const SizedBox(
                        height: 16,
                      ),
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.amberAccent),
                      )
                    ],
                  ),
                );
              else
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Observer(builder: (_) {
                      return TextFormField(
                        initialValue: donateStore.title,
                        onChanged: donateStore.setTitle,
                        decoration: InputDecoration(
                          labelText: 'Título *',
                          labelStyle: labelStyle,
                          contentPadding: contentPadding,
                          errorText: donateStore.titleError,
                        ),
                      );
                    }),
                    Observer(builder: (_) {
                      return TextFormField(
                        initialValue: donateStore.description,
                        onChanged: donateStore.setDescription,
                        decoration: InputDecoration(
                          labelText: 'Descrição *',
                          labelStyle: labelStyle,
                          contentPadding: contentPadding,
                          errorText: donateStore.descriptionError,
                        ),
                        maxLines: null,
                      );
                    }),
                    CategoryField(donateStore),
                    CepField(donateStore),
                    HidePhoneField(donateStore),
                    ImagesField(donateStore),
                    Observer(builder: (_) {
                      return ErrorBox(
                        message: donateStore.error,
                      );
                    }),
                    Observer(builder: (_) {
                      return SizedBox(
                        height: 50,
                        child: GestureDetector(
                          onTap: donateStore.invalidSendPressed,
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            child: Text(
                              'Enviar',
                              style: TextStyle(fontSize: 18),
                            ),
                            color: Colors.purple,
                            disabledColor: Colors.purple.withAlpha(120),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            onPressed: donateStore.sendPressed,
                          ),
                        ),
                      );
                    }),
                  ],
                );
            }),
          ),
        ),
      ),
    );
  }
}
