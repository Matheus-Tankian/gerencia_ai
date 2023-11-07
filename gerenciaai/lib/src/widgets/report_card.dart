import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  final String title;
  const ReportCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Relatorio $title',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: const Color(0xfff9a826),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: title == 'Anual',
                replacement: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Informe:',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      height: 40,
                      width: 120,
                      child: TextField(
                        keyboardType: TextInputType.datetime,
                        controller: textController,
                        decoration: const InputDecoration(
                          hintText: 'Mes',
                          hintStyle: TextStyle(
                            color: Color(0xffADADAD),
                          ),
                          prefixIcon: Icon(
                            Icons.calendar_month,
                            color: Color(0xffF9A826),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: false == false
                                  ? Colors.red
                                  : Color(0xffF9A826),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      height: 40,
                      width: 120,
                      child: TextField(
                        keyboardType: TextInputType.datetime,
                        controller: textController,
                        decoration: const InputDecoration(
                          hintText: 'Ano',
                          hintStyle: TextStyle(
                            color: Color(0xffADADAD),
                          ),
                          prefixIcon: Icon(
                            Icons.calendar_month,
                            color: Color(0xffF9A826),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: false == false
                                  ? Colors.red
                                  : Color(0xffF9A826),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xfff9a826),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'Informe o Ano:',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      height: 40,
                      width: 180,
                      child: TextField(
                        keyboardType: TextInputType.datetime,
                        controller: textController,
                        decoration: const InputDecoration(
                          hintText: 'Ano',
                          hintStyle: TextStyle(
                            color: Color(0xffADADAD),
                          ),
                          prefixIcon: Icon(
                            Icons.calendar_month,
                            color: Color(0xffF9A826),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: false == false
                                  ? Colors.red
                                  : Color(0xffF9A826),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          color: Color(0xfff9a826),
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: 'Gerencia ',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFFFF941A),
                      ),
                      children: [
                        TextSpan(
                          text: 'AÍ',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF706E7A),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text('Data: 10/10/2023'),
                ],
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  'Relatorio Mensal de Maio',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Nome do fiscal',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Periodo entre 01/04/2023 ate 30/04/2023',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Notas Fiscais',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Nome',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                    Text(
                      'Data',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                    Text(
                      'Valor',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              const Divider(
                height: 1,
                color: Colors.black,
              ),
              const SizedBox(height: 4),
              Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 6,
                        ),
                        color: index % 2 == 0
                            ? const Color.fromARGB(255, 167, 166, 166)
                            : Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'nota$index',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              '0$index/10/2023',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'R\$ ${index}00',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Quantidade: 12',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                    Text(
                      'Valor: 5000',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepOrange,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
