import 'package:flutter/material.dart';
import 'package:lista_clientes/pages/list_clientes.dart';

class ListCustomers extends StatelessWidget {
  final List<Client> clients = [
    Client(nombre: "Jhonatan", edad: 17, direccion: "Cuenca"),
    Client(nombre: "Jose", edad: 14, direccion: "ZAMORA"),
    Client(nombre: "Karla", edad: 15, direccion: "LOJA"),
    Client(nombre: "Bruno", edad: 16, direccion: "QUITO"),
    Client(nombre: "Lis", edad: 18, direccion: "ESMERALDAS"),
    Client(nombre: "Jessenia", edad: 19, direccion: "BABAOYO"),
    Client(nombre: "Luisa", edad: 21, direccion: "PICHINCHA"),
    Client(nombre: "Eli", edad: 20, direccion: "LOJA"),
    Client(nombre: "Maria", edad: 22, direccion: "GUAYAQUIL"),
    Client(nombre: "LOPEZ", edad: 24, direccion: "MORONA SANTIAGO"),
    Client(nombre: "SAULO", edad: 25, direccion: "ORELLANA"),
    Client(nombre: "ESTACIO", edad: 27, direccion: "MACAS"),
  ];
  ListCustomers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Center(child: Text("LISTA DE CLIENTES")),
      ),
      body: ListView.builder(
        itemCount: clients.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(clients[index].nombre),
            subtitle: Text("CIUDAD: ${clients[index].direccion}"),
            trailing: Text("\Edad: ${clients[index].edad}"),
          );
        },
      ),
    );
  }
}
