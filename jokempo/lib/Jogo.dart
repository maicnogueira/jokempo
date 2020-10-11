import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {
  var _imagemApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção";

  void _opcaoSelecionada (String escolhaUsuario){
    var opcao = ["pedra", "papel", "tesoura"];
    var numero = Random().nextInt(3);
    var escolhaApp = opcao[numero];

    switch(escolhaApp){
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("images/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    if(escolhaUsuario == "pedra" && escolhaApp == "tesoura" || escolhaUsuario == "tesoura" && escolhaApp == "papel" || escolhaUsuario == "papel" && escolhaApp == "pedra"){
      setState(() {
        this._mensagem = "Você ganhou";
      });
    }else if(escolhaApp == "pedra" && escolhaUsuario == "tesoura" || escolhaApp == "tesoura" && escolhaUsuario == "papel" || escolhaApp == "papel" && escolhaUsuario == "pedra"){
      setState(() {
        this._mensagem = "Você perdeu!";
      });
    }else{
      this._mensagem = "Empatou!";
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jokempô"),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 32, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Escolha do App:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                      fontWeight: FontWeight.w900
                  ),
                ),
              ),
              Image(image: this._imagemApp,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(this._mensagem,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                    fontWeight: FontWeight.w900
                  ),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(onTap: ()=> _opcaoSelecionada("pedra"), child: Image.asset("images/pedra.png", width: 80,),),
                  GestureDetector(onTap: ()=> _opcaoSelecionada("papel"), child: Image.asset("images/papel.png", width: 80,),),
                  GestureDetector(onTap: ()=> _opcaoSelecionada("tesoura"), child: Image.asset("images/tesoura.png", width: 80,),)
                ],
              )
            ]
          ),
        ),
      ),
    );
  }
}
