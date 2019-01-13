/// Hecho por Rurick Maqueo Poisot
/// mail: rurick.mpoisot@gmail.com
/// github: github.com/skintigth
///

/// El Widget que regresa es un InkWell con:
///   la imagen de la estacion
///   Su nombre
///   Su linea
/// permite hacer Tap a los elementos
///
/// Tambien contiene al final del documento todas las estaciones
/// de todos los sistemas de transporte
///

import 'package:flutter/material.dart';
import 'package:metroapp/screens/estacionscreen.dart';
import 'package:metroapp/models/objetosuperestacion.dart';

class EstacionWidget extends StatelessWidget{

  static const String simboloAuxiliar = 'graphics/sistemas/';

  final ObjetoSuperEstacion estacion;
  //Constructor
  EstacionWidget(this.estacion);

  //Genera el widget toucheable con los datos de la estacion.
  @override
  Widget build(BuildContext context) {
    return InkWell( //Inkwell permite el onTap
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EstacionScreen(estacion: estacion,)),
        );
      },
      child: Container( //Contenedor para contener los subwidgets
        padding: EdgeInsets.symmetric(
          vertical:8.0,
          horizontal: 8.0,
        ),
        child: Row( //Row para ordenar el contenedor
          children: <Widget>[
            Image.asset( //Imagen, muestra el simbolo de la estacion
              estacion.simbolo,
              scale: 1.8, //Se escala para que se vea bien
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column( //Organiza los textos a mostrar
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(estacion.nombre, style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('Lat: ${estacion.latitud} Long: ${estacion.longitud}',),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

