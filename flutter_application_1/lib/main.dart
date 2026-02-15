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
  "ando asustado",
  "tengo mucho miedo",
  "siento miedo",
  "me siento con miedo",
  "estoy aterrado",
  "tengo temor",
  "me siento inseguro",
  "tengo pánico",
  "estoy espantado",
  "me siento en peligro",
  "tengo miedo de que me lastimen",
  "tengo miedo de hablar",
  "me siento vulnerable",
  "estoy con miedo",
  "me da mucho miedo",
  "siento un miedo fuerte",
  "estoy nervioso del miedo",
  "tengo miedo de estar aquí",
  "me siento amenazado",
  "tengo miedo de que vuelva a pasar",
  "estoy paralizado del miedo",
  "siento miedo en el pecho",
  "tengo miedo y ansiedad",
  "me siento intranquilo",
  "tengo miedo de quedarme solo",
  "me siento desprotegido",
  "tengo miedo de pedir ayuda",
  "me siento frágil",
  "tengo miedo de que no me crean",
  "estoy con miedo todo el tiempo",
  "siento que no estoy a salvo",
  "tengo miedo de lo que pueda pasar",
  "me siento pequeño y asustado",
  "tengo miedo de reaccionar",
  "estoy asustado por dentro",
  "siento miedo constante",
  "tengo miedo de confiar",
  "me siento tenso por miedo",
  "tengo miedo de decir la verdad"
])) 
  // respuesta del bot para miedo

{
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
  "me pegaron",
  "me pegan",
  "me golpearon",
  "me golpean",
  "me dieron golpes",
  "me dieron una golpiza",
  "me lastimaron",
  "me hicieron daño",
  "me empujaron",
  "me empujan",
  "me aventaron",
  "me aventaron al suelo",
  "me tiraron",
  "me jalonearon",
  "me zarandearon",
  "me cachetearon",
  "me dieron una cachetada",
  "me patearon",
  "me dieron patadas",
  "me dieron puñetazos",
  "me dieron golpes fuertes",
  "me madrearon",
  "me chingaron",
  "me fregaron",
  "me dieron en la cara",
  "me pegaron fuerte",
  "me dejaron moretones",
  "me dejaron marcas",
  "me lastimaron físicamente",
  "me agredieron",
  "me atacaron",
  "me violentaron",
  "me hicieron violencia",
  "me hicieron daño físico",
  "me agarraron a golpes",
  "me golpearon varias veces",
  "me pegaron con las manos",
  "me pegaron con los puños",
  "me pegaron sin razón",
  "me pegaron en mi casa",
  "me pegaron hoy",
  "me pegaron ayer",
  "me pegaron muchas veces",
  "me pegaron otra vez",
  "me pegaron y me duele",
  "me pegaron y tengo miedo",
  "me pegaron y lloré",
  "me pegaron y no pude defenderme",
  "me pegaron y me lastimé",
  "me pegaron contra la pared",
  "me empujaron fuerte",
  "me tiraron al piso",
  "me patearon en el suelo",
  "me pegaron en la escuela",
  "me pegaron en mi casa",
  "me pegaron en la calle",
  "me golpearon sin parar",
  "me pegaron entre varios",
  "me atacaron físicamente",
  "me hicieron daño con golpes",
  "me maltrataron",
  "me trataron con violencia",
  "me hicieron daño a golpes",
  "me pegaron aunque dije que no",
  "me pegaron y me dolió mucho",
  "me golpearon muy feo",
  "me pegaron hasta cansarse",
  "me dieron una paliza",
  "me dieron una tunda",
  "me dieron una madriza",
  "me dieron una chinga",
  "me dejaron adolorido",
  "me dejaron lastimado",
  "me dejaron tirado",
  "me dejaron sangrando",
  "me golpearon y me asusté",
  "me pegaron y tengo marcas",
  "me pegaron y no fue un juego",
  "me pegaron de verdad",
  "me pegaron sin motivo",
  "me pegaron con coraje",
  "me pegaron por culpa de alguien",
  "me pegaron y no es la primera vez"
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
  "me hacen bulling",
  "me hacen bullyng",
  "me molestan",
  "me molestan mucho",
  "se burlan de mi",
  "se ríen de mi",
  "me traen carrilla",
  "me cargan carrilla",
  "me hacen burla",
  "se burlan de mi en la escuela",
  "me molestan en la escuela",
  "me molestan en el salon",
  "me molestan en clase",
  "me fastidian",
  "me fastidian siempre",
  "me acosan",
  "me acosan en la escuela",
  "me hacen sentir mal",
  "me humillan",
  "me humillan frente a otros",
  "me humillan en publico",
  "me insultan",
  "me dicen cosas feas",
  "me dicen apodos",
  "me ponen apodos",
  "me ofenden",
  "me critican",
  "me gritan",
  "me tratan mal",
  "me ignoran",
  "me hacen a un lado",
  "me excluyen",
  "no me dejan participar",
  "me dejan solo",
  "me aislan",
  "me hacen menos",
  "me menosprecian",
  "me ridiculizan",
  "me hacen quedar mal",
  "hablan mal de mi",
  "dicen cosas malas de mi",
  "me señalan",
  "me amenazan",
  "me empujan",
  "me pegan en la escuela",
  "me esconden mis cosas",
  "me quitan mis cosas",
  "me rompen mis cosas",
  "me roban mis cosas",
  "me avientan cosas",
  "me hacen bromas pesadas",
  "me hacen bromas crueles",
  "me hacen bromas que duelen",
  "me hacen sentir miedo",
  "me hacen sentir inseguro",
  "me hacen sentir pequeño",
  "me hacen sentir tonto",
  "me hacen sentir inutil",
  "me hacen sentir raro",
  "me hacen sentir diferente",
  "me hacen sentir vergüenza",
  "me hacen sentir solo",
  "me hacen sentir triste",
  "me hacen sentir mal todos los dias",
  "me molestan todos los dias",
  "me molestan siempre",
  "me molestan por mi apariencia",
  "me molestan por como soy",
  "me molestan por como hablo",
  "me molestan por mi forma de ser",
  "me molestan por mi cuerpo",
  "me molestan por mi voz",
  "me molestan por mi ropa",
  "me molestan por mi color de piel",
  "me molestan por mi acento",
  "me molestan por mi forma de pensar",
  "me molestan aunque diga que paren",
  "me molestan y no paran",
  "me molestan y me duele",
  "me molestan y me hacen llorar",
  "me molestan y nadie hace nada",
  "me molestan y tengo miedo"
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
  "pasa en mi casa",
  "todo pasa en mi casa",
  "en mi hogar",
  "en mi familia",
  "mi papá me pega",
  "mi mamá me pega",
  "mi padrastro me pega",
  "mi madrastra me pega",
  "mi papá me golpea",
  "mi mamá me golpea",
  "mi padrastro me golpea",
  "mi papá me grita",
  "mi mamá me grita",
  "mi padrastro me grita",
  "me gritan en mi casa",
  "me insultan en mi casa",
  "me humillan en mi casa",
  "me tratan mal en mi casa",
  "me hacen sentir mal en mi casa",
  "me hacen llorar en mi casa",
  "tengo miedo en mi casa",
  "no me siento seguro en mi casa",
  "no me siento a salvo en mi casa",
  "me lastiman en mi casa",
  "me pegan en mi casa",
  "me golpean en mi casa",
  "me empujan en mi casa",
  "me maltratan en mi casa",
  "me castigan con golpes",
  "me castigan muy feo",
  "me castigan con violencia",
  "me castigan a gritos",
  "me amenazan en mi casa",
  "me asustan en mi casa",
  "me dicen cosas feas en mi casa",
  "me dicen que no valgo",
  "me hacen sentir inutil en mi casa",
  "me hacen sentir miedo todos los dias",
  "me hacen sentir pequeño en mi casa",
  "me controlan en mi casa",
  "no me dejan hablar en mi casa",
  "no me dejan salir en mi casa",
  "me quitan mis cosas en mi casa",
  "me encierran en mi casa",
  "me ignoran en mi casa",
  "me hacen la ley del hielo",
  "discuten con violencia en mi casa",
  "hay mucha violencia en mi casa",
  "hay gritos en mi casa",
  "hay golpes en mi casa",
  "hay peleas en mi casa",
  "hay maltrato en mi casa",
  "hay abuso en mi casa",
  "mi papá le pega a mi mamá",
  "mi mamá le pega a mi papá",
  "se pelean mis papás",
  "mis papás se golpean",
  "veo violencia en mi casa",
  "escucho gritos en mi casa",
  "escucho golpes en mi casa",
  "rompen cosas en mi casa",
  "avientan cosas en mi casa",
  "tengo miedo de volver a casa",
  "no quiero estar en mi casa",
  "mi casa no es segura",
  "no me siento bien en mi casa",
  "me hacen daño en mi familia",
  "mi familia me lastima",
  "mi familia me maltrata",
  "mi familia me grita",
  "mi familia me pega",
  "mi padrastro me da miedo",
  "mi papá me da miedo",
  "mi mamá me da miedo",
  "me duele estar en mi casa",
  "me siento atrapado en mi casa",
  "no tengo paz en mi casa",
  "en mi casa hay abuso"
])) {
      return """
La violencia en casa no es normal.

Tu hogar debe ser un lugar seguro.
Busca ayuda con un familiar, maestro o llama al 911 si estás en peligro.
""";
    }

    // ================= VIOLENCIA SEXUAL =================

    if (contiene(input, [
  "violencia sexual",
  "abuso sexual",
  "abuso",
  "me abusaron",
  "abusaron de mi",
  "me tocaron",
  "me tocaron sin permiso",
  "me tocaron donde no debian",
  "me tocaron partes privadas",
  "me tocaron mi cuerpo",
  "me obligaron",
  "me obligaron a hacer cosas",
  "me forzaron",
  "me forzaron a hacer algo",
  "me hicieron cosas que no queria",
  "me hicieron sentir sucio",
  "me hicieron sentir incomodo",
  "me hicieron sentir miedo",
  "me lastimaron sexualmente",
  "me agredieron sexualmente",
  "me acosaron sexualmente",
  "me manosearon",
  "me besaron sin permiso",
  "me agarraron sin mi consentimiento",
  "me tocaron aunque dije que no",
  "me tocaron a la fuerza",
  "me tocaron mientras dormia",
  "me tocaron en mi casa",
  "me tocaron en la escuela",
  "me tocaron en la calle",
  "me tocaron un familiar",
  "me tocó alguien de confianza",
  "alguien abuso de mi",
  "alguien me hizo cosas sexuales",
  "me hicieron algo sexual",
  "me obligaron a ver cosas",
  "me obligaron a tocar",
  "me obligaron a desvestirme",
  "me obligaron a callar",
  "me amenazaron para hacer cosas",
  "me dijeron que no dijera nada",
  "me chantajearon",
  "me usaron",
  "me usaron sexualmente",
  "me violaron",
  "me intentaron violar",
  "intento de violacion",
  "hubo violacion",
  "me penetraron",
  "me lastimaron en mis partes",
  "me hicieron daño intimo",
  "me dolio lo que me hicieron",
  "me dejaron con miedo",
  "me dejaron traumado",
  "me paso algo sexual",
  "me paso algo muy malo",
  "me paso algo que no queria",
  "no fue consensuado",
  "no di permiso",
  "no queria eso",
  "no pude decir que no",
  "no pude defenderme",
  "me senti obligado",
  "me senti presionado",
  "me senti amenazado",
  "me senti asustado",
  "me senti atrapado",
  "me senti violado",
  "me senti invadido",
  "me senti usado",
  "me senti sucio",
  "me senti culpable",
  "me senti avergonzado",
  "fue abuso",
  "fue violencia sexual",
  "fue una agresion sexual",
  "me dañaron sexualmente",
  "me hicieron daño grave",
  "me paso algo muy grave",
  "me hicieron algo ilegal"
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