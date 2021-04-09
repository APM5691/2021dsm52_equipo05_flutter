import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_authentication_with_laravel_sanctum/providers/auth.dart';
import 'package:flutter_authentication_with_laravel_sanctum/No%20use/crear-usuario-screen.dart';
import 'package:flutter_authentication_with_laravel_sanctum/No%20use/formulario-usuario-screen.dart';
import 'package:flutter_authentication_with_laravel_sanctum/screen/catalogo_productos.dart';
import 'package:flutter_authentication_with_laravel_sanctum/screen/direcciones_screen.dart';
import 'package:flutter_authentication_with_laravel_sanctum/screen/login-screen-max.dart';
import 'package:flutter_authentication_with_laravel_sanctum/screen/login-screen.dart';
import 'package:flutter_authentication_with_laravel_sanctum/No%20use/posts-screen.dart';
import 'package:flutter_authentication_with_laravel_sanctum/screen/materiales_screen.dart';
import 'package:flutter_authentication_with_laravel_sanctum/screen/productos_screen.dart';
import 'package:flutter_authentication_with_laravel_sanctum/No%20use/usuarios-screen.dart';
import 'package:flutter_authentication_with_laravel_sanctum/screen/ventas_screen.dart';
import 'package:provider/provider.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<Auth>(builder: (context, auth, child) {
        if (auth.authenticated) {
          return ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(auth.user.name),
                accountEmail: Text(auth.user.email),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.orange,
                      Colors.white,
                    ],
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://randomuser.me/api/portraits/men/46.jpg")),
              ),
              ListTile(
                title: Text("Logout"),
                onTap: () {
                  Provider.of<Auth>(context, listen: false).logout();
                },
              ),
              ListTile(
                title: Text("Catalogo de productos"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CatalogoProductosScreen()));
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
              // ListTile(
              //   title: Text("Crear un nuevo usuario"),
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => CrearUsuarioScreen()));
              //   },
              // ),
              // ListTile(
              //   title: Text("Formulario"),
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => FormularioUsuario()));
              //   },
              // ),
              ListTile(
                title: Text("LoginMX"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreenMX()));
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
                title: Text("Ventas"),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => VentasScreen()));
                },
              ),
              ListTile(
                title: Text("Materiales"),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MaterialesScreen()));
                },
              ),
              ListTile(
                title: Text("Direcciones"),
                // leading: Icons.,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DireccionesScreen()));
                },
              ),
            ],
          );
        } else {
          return ListView(
            children: [
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
