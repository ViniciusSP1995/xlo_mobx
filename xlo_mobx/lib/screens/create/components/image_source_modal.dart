import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageSourceModal extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
     if (!Platform.isAndroid) {
       return BottomSheet(
          onClosing: () {},
          builder: (_) => Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                FlatButton(
                  child: const Text('Câmera'),
                ),
                FlatButton(
                  child: const Text('Galeria'),
                )
              ]));
     } else {
       return CupertinoActionSheet(
         title: const Text('Selecionar foto para o anpuncio'),
         message: const Text('Escolha a orgiem da foto'),
         cancelButton: CupertinoActionSheetAction(
           child: const Text('Cancelar',
           style: TextStyle(color: Colors.red),
           ),
           
           onPressed: () {
             Navigator.of(context).pop();
           }
         ),
         actions: [ 
           CupertinoActionSheetAction(
             child: const Text('Câmera'),
             onPressed: () {}
           ),
           CupertinoActionSheetAction(child: const Text('Galeria'), onPressed: () {}),

         ]
       );
     }
    
  }
}