import 'package:facebook_interface/components/area_criar_post.dart';
import 'package:facebook_interface/components/area_story.dart';
import 'package:facebook_interface/components/botao_menu.dart';
import 'package:facebook_interface/components/card_post.dart';
import 'package:facebook_interface/dados/dados.dart';
import 'package:facebook_interface/modelos/postagem.dart';
import 'package:facebook_interface/uteis/paleta_cores.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            floating: true,
            centerTitle: false,
            title: const Text(
                "facebook",
              style: TextStyle(
                color: PaletaCores.azulFacebook,
                fontWeight: FontWeight.bold,
                fontSize: 28,
                letterSpacing: -1.2,
              ),
            ),
            actions: [
              BotaoMenu(
                icone: Icons.search,
                iconeTamanho: 30,
                onPressed: (){},
              ),
              BotaoMenu(
                icone: LineIcons.facebookMessenger,
                iconeTamanho: 30,
                onPressed: (){},
              )
            ],
          ),
          SliverToBoxAdapter(
            child: AreaCriarPost(
              usuario: usuarioAtual,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            sliver: SliverToBoxAdapter(
              child: AreaStory(
                usuario: usuarioAtual,
                estorias: estorias,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  (context, indice){
                    Postagem postagem = postagens[indice];
                    return CardPost(
                        postagem: postagem
                    );
                  },
                  childCount: postagens.length,
              )
          )
        ],
      ),
    );
  }
}
