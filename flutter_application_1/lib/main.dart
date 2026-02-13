import 'package:flutter/material.dart';

void main() {
  runApp(const ChatBotApp());
}

class ChatBotApp extends StatelessWidget {
  const ChatBotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AlertMe',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFE1EAED),
      ),
      home: const ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Message> _messages = [];
  final ScrollController _scrollController = ScrollController();

  bool _yaSaludo = false;

  final List<String> _respuestasSugeridas = [
    "Tengo miedo",
    "Me pegan",
    "Me humillan",
    "Me hacen bullying",
    "Pasa en mi casa",
    "Me siento mal"
  ];

  @override
  void initState() {
    super.initState();
    _messages.add(
      Message(
        text:
            "Bienvenido a AlertMe.\nSoy Lumi y estoy aquí para escucharte y orientarte.",
        isUser: false,
      ),
    );
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;

    setState(() {
      _messages.add(Message(text: text, isUser: true));
    });

    _controller.clear();
    _scrollToBottom();

    Future.delayed(const Duration(milliseconds: 300), () {
      final reply = generarRespuesta(text);
      setState(() {
        _messages.add(Message(text: reply, isUser: false));
      });
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  String normalizar(String texto) {
    texto = texto.toLowerCase();
    texto = texto.replaceAll("toy", "estoy");
    texto = texto.replaceAll("pos", "pues");
    texto = texto.replaceAll("pa ", "para ");
    texto = texto.replaceAll("ma ", "mamá ");
    texto = texto.replaceAll("k ", "que ");
    texto = texto.replaceAll("xq", "porque");
    return texto;
  }

  bool contiene(String texto, List<String> palabras) {
    for (var palabra in palabras) {
      if (texto.contains(palabra)) return true;
    }
    return false;
  }

  String generarRespuesta(String input) {
    input = normalizar(input);

    if (!_yaSaludo) {
      _yaSaludo = true;
      return "Hola. Soy Lumi. Puedes contarme lo que está pasando.";
    }

    // ================= EMOCIONES =================

    if (contiene(input, [
      "tengo miedo",
      "me da miedo",
      "estoy asustado",
      "ando asustado"
    ])) {
      return """
Entiendo que tengas miedo.

Sentirte así es válido.
Si estás en peligro inmediato llama al 911.

Busca un adulto o persona de confianza.
""";
    }

    if (contiene(input, [
      "ansiedad",
      "estoy ansioso",
      "no puedo respirar",
      "me siento nervioso"
    ])) {
      return """
Parece que estás sintiendo ansiedad.

Respira profundo conmigo.
No estás solo.

Hablar con alguien puede ayudarte mucho.
""";
    }

    if (contiene(input, [
      "me siento mal",
      "estoy triste",
      "ando bajoneado",
      "me siento solo"
    ])) {
      return """
Lamento que te sientas así.

Tus emociones importan.
Cuéntame qué está pasando.
""";
    }

    // ================= VIOLENCIA FÍSICA =================

    if (contiene(input, [
      "me pegan",
      "me golpean",
      "me empujan",
      "me madrearon",
      "me chingaron",
      "me fregaron"
    ])) {
      return """
Identifico violencia física.

Nadie tiene derecho a lastimarte.
Esto no es tu culpa.

Busca ayuda inmediata con un adulto o llama al 911.
""";
    }

    // ================= VIOLENCIA PSICOLÓGICA =================

    if (contiene(input, [
      "me gritan"
    ])) {
      return """
Que te griten constantemente no es normal.

Eso puede afectar cómo te sientes contigo mismo.
Mereces respeto.
""";
    }

    if (contiene(input, [
      "me humillan",
      "me traen de bajada",
      "me hacen menos"
    ])) {
      return """
Humillarte es violencia psicológica.

No mereces que te hagan sentir menos.
Tu valor no depende de lo que digan otros.
""";
    }

    if (contiene(input, [
      "me insultan",
      "me dicen inutil",
      "me dicen cosas feas"
    ])) {
      return """
Los insultos también son violencia.

Las palabras pueden doler mucho.
Hablar con alguien puede ayudarte.
""";
    }

    // ================= VIOLENCIA ESCOLAR =================

    if (contiene(input, [
      "bullying",
      "me hacen bullying",
      "me traen carrilla",
      "me molestan en la escuela"
    ])) {
      return """
Eso es violencia escolar.

No es tu culpa.
Puedes hablar con un maestro u orientador.

Mereces estudiar en paz.
""";
    }

    // ================= VIOLENCIA DOMÉSTICA =================

    if (contiene(input, [
      "en mi casa",
      "mi papá me pega",
      "mi mamá me pega",
      "mi padrastro"
    ])) {
      return """
La violencia en casa no es normal.

Tu hogar debe ser un lugar seguro.
Busca ayuda con un familiar, maestro o llama al 911 si estás en peligro.
""";
    }

    // ================= VIOLENCIA SEXUAL =================

    if (contiene(input, [
      "me tocaron",
      "me obligaron",
      "abuso",
      "violaron"
    ])) {
      return """
Eso es violencia sexual.

No es tu culpa.
Es importante buscar ayuda inmediata con autoridades o un adulto de confianza.

Si estás en peligro llama al 911.
""";
    }

    return "Te escucho. Cuéntame un poco más para poder ayudarte mejor.";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8D77AB),
        title: const Text(
          "AlertMe • Lumi",
          style: TextStyle(color: Color(0xFFFDC67F)),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ChatBubble(message: _messages[index]);
              },
            ),
          ),
          _sugerencias(),
          _inputArea(),
        ],
      ),
    );
  }

  Widget _sugerencias() {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _respuestasSugeridas.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFDC67F),
                foregroundColor: Colors.black,
              ),
              onPressed: () =>
                  _sendMessage(_respuestasSugeridas[index]),
              child: Text(_respuestasSugeridas[index]),
            ),
          );
        },
      ),
    );
  }

  Widget _inputArea() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      color: const Color(0xFFF9F6E6),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: "Escribe un mensaje...",
                border: InputBorder.none,
              ),
              onSubmitted: (value) => _sendMessage(value),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            color: const Color(0xFF8D77AB),
            onPressed: () => _sendMessage(_controller.text),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String text;
  final bool isUser;

  Message({required this.text, required this.isUser});
}

class ChatBubble extends StatelessWidget {
  final Message message;

  const ChatBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(6),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: message.isUser
              ? const Color(0xFF8D77AB)
              : const Color(0xFFFDC67F),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(
          message.text,
          style: TextStyle(
            color: message.isUser ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}