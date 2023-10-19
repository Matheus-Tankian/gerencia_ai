import 'package:flutter/material.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Container(
              color: const Color(0xffF9A826),
              width: double.infinity,
              height: double.infinity,
              child: const Padding(
                padding: EdgeInsets.only(left: 30, top: 70),
                child: Text(
                  'Register',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 34,
              left: -2,
              child: Container(
                height: 20,
                width: 20,
                decoration: const BoxDecoration(
                  color: Color(0xffFFB133),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            ),
            Positioned(
              top: -80,
              left: 240,
              child: Container(
                height: 250,
                width: 250,
                decoration: const BoxDecoration(
                  color: Color(0xffFFB133),
                  borderRadius: BorderRadius.all(Radius.circular(125)),
                ),
              ),
            ),
            Positioned(
              top: 160,
              left: 30,
              child: Container(
                height: 80,
                width: 80,
                decoration: const BoxDecoration(
                  color: Color(0xffFFB133),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
              ),
            ),
            Positioned(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 44,
                    horizontal: 28,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // Alinhe os elementos ao centro
                    children: [
                      const Text(
                        'Nome',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          hintText: 'Insira seu nome',
                          hintStyle: TextStyle(
                            color: Color(0xffADADAD),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Email',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const TextField(
                        decoration: InputDecoration(
                          hintText: 'Insira seu email',
                          hintStyle: TextStyle(
                            color: Color(0xffADADAD),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Senha',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.visibility_off),
                            onPressed: () {
                              //visibility_off
                              // visibility
                            },
                          ),
                          hintText: 'Insira sua password',
                          hintStyle: const TextStyle(
                            color: Color(0xffADADAD),
                          ),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Confirme sua senha novamente',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.visibility_off),
                            onPressed: () {
                              //visibility_off
                              // visibility
                            },
                          ),
                          hintText: 'Insira sua password',
                          hintStyle: const TextStyle(
                            color: Color(0xffADADAD),
                          ),
                        ),
                        obscureText: true,
                      ),
                      const SizedBox(height: 38),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Color(0xffF9A826),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          height: 50,
                          child: const Center(
                            child: Text(
                              'Salvar',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
