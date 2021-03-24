import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication_with_laravel_sanctum/providers/auth.dart';
import 'package:flutter_authentication_with_laravel_sanctum/screen/crear-usuario-screen.dart';
import 'package:flutter_authentication_with_laravel_sanctum/screen/formulario-usuario-screen.dart';
import 'package:flutter_authentication_with_laravel_sanctum/screen/login-screen.dart';
import 'package:flutter_authentication_with_laravel_sanctum/screen/posts-screen.dart';
import 'package:flutter_authentication_with_laravel_sanctum/screen/productos_screen.dart';
import 'package:flutter_authentication_with_laravel_sanctum/screen/usuarios-screen.dart';
import 'package:provider/provider.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<Auth>(builder: (context, auth, child) {
        if (auth.authenticated) {
          return ListView(
            children: [
              ListTile(
                tileColor: Colors.orange,
                leading: Icon(Icons.account_circle_rounded),
                title: Text(auth.user.name),
                subtitle: Text(auth.user.primerApellido +
                    ' ' +
                    auth.user.segundoApellido +
                    ' ' +
                    auth.user.sexo),
              ),
              ListTile(
                title: Text("Posts"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PostsScreen()));
                },
              ),
              ListTile(
                title: Text("Lista de usuarios"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UsuariosScreen()));
                },
              ),
              ListTile(
                title: Text("-----------------------------------------------"),
              ),
              ListTile(
                title: Text("Lista de usuarios"),
                onTap: () {
                  print("Hola");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UsuariosScreen()));
                },
              ),
              ListTile(
                title: Text("Crear un nuevo usuario"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CrearUsuarioScreen()));
                },
              ),
              ListTile(
                title: Text("Formulario"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FormularioUsuario()));
                },
              ),
              ListTile(
                title: Text("Productos"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductosScreen()));
                },
              ),
              ListTile(
                title: Text("Productos"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductosScreen()));
                },
              ),
              ListTile(
                title: Text("Productos"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductosScreen()));
                },
              ),
              ListTile(
                title: Text("Productos"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductosScreen()));
                },
              ),
              ListTile(
                title: Text("Productos"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductosScreen()));
                },
              ),
              ListTile(
                title: Text("Productos"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductosScreen()));
                },
              ),
              ListTile(
                title: Text("Productos"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductosScreen()));
                },
              ),
              ListTile(
                title: Text("Productos"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductosScreen()));
                },
              ),
              ListTile(
                title: Text("Productos"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductosScreen()));
                },
              ),
            ],
          );
        } else {
          return ListView(
            children: [
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.account_circle_rounded),
                      title: Text('hola'),
                      subtitle: Text('hola'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text('Iniciar sesion*'),
                          onPressed: () {/* ... */},
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          child: const Text('Registarse*'),
                          onPressed: () {/* ... */},
                        ),
                        const SizedBox(width: 8),
                      ],
                    ),
                  ],
                ),
              ),
              ListTile(
                title: Text("Login"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
              ListTile(
                title: Text("Register"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
              ),
              ListTile(
                title: Text("Posts"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PostsScreen()));
                },
              ),
              ListTile(
                title: Text("-----------------------------------------------"),
              ),
              ListTile(
                title: Text("Lista de usuarios"),
                onTap: () {
                  print("Hola");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => UsuariosScreen()));
                },
              ),
              ListTile(
                title: Text("Crear un nuevo usuario"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CrearUsuarioScreen()));
                },
              ),
              ListTile(
                title: Text("Formulario"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FormularioUsuario()));
                },
              ),
              ListTile(
                title: Text("Productos"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductosScreen()));
                },
              ),
            ],
          );
        }
      }),
    );
  }
}
