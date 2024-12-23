import 'package:brisas_wifi/models/UsuariosDTO.dart';
import 'package:brisas_wifi/screens/EventosScreen.dart';
import 'package:flutter/material.dart';
import 'package:brisas_wifi/methods/LoginUsuario.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final TextEditingController correoController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    correoController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (correoController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, completa todos los campos.')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      final input = LoginUsuario(
        correo: correoController.text,
        password: passwordController.text
      );

      // Llamar al método de login
      final perfil = await loginUsuario(input);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Bienvenido usuario ${perfil.nombre}'))
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Eventosscreen())
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error en el login: ${e.toString()}')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: <Widget>[
                const Image(
                  image: NetworkImage(
                    'https://resources.krowdy.com/krowdy/company/logos/2022-03-16T16-05-42-722Zzona-punto-brisas-del-titicaca-logo.jpg',
                  ),
                  width: 450,
                  height: 250,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.symmetric(vertical: 70.0),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: correoController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.lightBlue, width: 2),
                          ),
                          hintText: 'Ingrese su correo electrónico',
                          prefixIcon: const Icon(Icons.person),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4)),
                          hintText: 'Ingrese su contraseña',
                          prefixIcon: const Icon(Icons.password),
                        ),
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: 350,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: isLoading ? null : _handleLogin,
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : const Text('Ingresar'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.lightBlueAccent,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
