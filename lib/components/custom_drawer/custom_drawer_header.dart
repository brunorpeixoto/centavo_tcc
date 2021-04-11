import 'package:centavo_tcc/screens/login/login_screen.dart';
import 'package:centavo_tcc/stores/page_store.dart';
import 'package:centavo_tcc/stores/user_manager_store.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CustomDrawerHeader extends StatelessWidget {

  final UserManagerStore userManagerStore = GetIt.I<UserManagerStore>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pop();
        GetIt.I<PageStore>().setPage(5);
        if(userManagerStore.isLoggedIn) {

        } else {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => LoginScreen())
          );
        }


      },
      child: Container(
        color: Colors.amberAccent,
        height: 95,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Icon(Icons.account_circle, color: Colors.brown, size: 35,),
            const SizedBox(width: 20,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    userManagerStore.isLoggedIn ?
                      userManagerStore.user.name
                        : 'Acesso de usuário!',
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    userManagerStore.isLoggedIn ?
                      userManagerStore.user.email
                        : 'Clique aqui',
                    style: TextStyle(
                      color: Colors.brown,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}