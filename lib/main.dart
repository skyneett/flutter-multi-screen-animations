import 'package:flutter/material.dart';

/// Punto de entrada principal de la aplicación
/// Esta es la primera función que se ejecuta cuando inicia la app
void main() {
  runApp(const MyApp());
}

/// Enumeración que define los diferentes estados/pantallas de la aplicación
/// Usar un enum es una buena práctica para manejar estados finitos y evitar errores
enum AppState {
  principal, // Estado inicial con los 3 botones
  pantalla1, // Primer estado secundario
  pantalla2, // Segundo estado secundario
  pantalla3,
  pantalla4, // Tercer estado secundario
  pantalla5,
  pantalla6,
}

/// Widget raíz de la aplicación (sin estado - StatelessWidget)
/// Este widget configura el tema y la estructura base de la app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Título de la aplicación (se muestra en el task manager del dispositivo)
      title: 'App Multi-Estado',

      // Configuración del tema visual de la aplicación
      theme: ThemeData(
        // Genera un esquema de colores basado en un color semilla
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        // Usa Material 3 para un diseño moderno
        useMaterial3: true,
      ),

      // Define la pantalla inicial de la aplicación
      home: const PaginaPrincipal(),
    );
  }
}

/// Widget principal con estado (StatefulWidget)
/// Este widget puede cambiar su estado interno y reconstruirse cuando sea necesario
class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({super.key});

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

/// Clase State que maneja el estado mutable de PaginaPrincipal
/// Aquí es donde se guarda y gestiona el estado actual de la aplicación
class _PaginaPrincipalState extends State<PaginaPrincipal> {
  // Variable que guarda el estado actual de la aplicación
  // Inicialmente está en el estado principal
  AppState _estadoActual = AppState.principal;

  /// Método para cambiar el estado de la aplicación
  /// Parámetro: nuevoEstado - El estado al que queremos cambiar
  void _cambiarEstado(AppState nuevoEstado) {
    setState(() {
      // setState() le indica a Flutter que el estado cambió
      // y que debe reconstruir el widget con los nuevos valores
      _estadoActual = nuevoEstado;
    });
  }

  /// Método para volver al estado principal desde cualquier otra pantalla
  void _volverAlInicio() {
    _cambiarEstado(AppState.principal);
  }

  @override
  Widget build(BuildContext context) {
    // Switch expression que retorna el widget apropiado según el estado actual
    // Es una forma elegante y clara de manejar múltiples estados
    return switch (_estadoActual) {
      AppState.principal => _buildPantallaPrincipal(),
      AppState.pantalla1 => _buildPantalla1(),
      AppState.pantalla2 => _buildPantalla2(),
      AppState.pantalla3 => _buildPantalla3(),
      AppState.pantalla4 => _buildPantalla4(),
      AppState.pantalla5 => _buildPantalla5(),
      AppState.pantalla6 => _buildPantalla6(),
    };
  }

  /// ============================================================================
  /// SCAFFOLD PRINCIPAL
  /// Pantalla inicial que muestra los 3 botones para navegar a otros estados
  /// ============================================================================
  Widget _buildPantallaPrincipal() {
    return Scaffold(
      // AppBar: Barra superior de la aplicación
      appBar: AppBar(
        // Título centrado en la barra superior
        title: const Text('Pantalla Principal'),
        // Color de fondo de la barra usando el color primario del tema
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Centra el título en la barra (especialmente útil para iOS)
        centerTitle: true,
      ),

      // Body: Contenido principal de la pantalla
      body: Center(
        // Padding: Añade espacio alrededor del contenido para mejor visualización
        child: Padding(
          padding: const EdgeInsets.all(20.0),

          // Column: Organiza los widgets hijos en una columna vertical
          child: Column(
            // Centra los elementos verticalmente en la pantalla
            mainAxisAlignment: MainAxisAlignment.center,
            // Extiende la columna al ancho completo disponible
            crossAxisAlignment: CrossAxisAlignment.stretch,

            // Lista de widgets hijos
            children: [
              // Widget de texto para el título principal con animación de fade
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 800),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value.clamp(0.0, 1.0),
                    child: Transform.translate(
                      offset: Offset(0, 20 * (1 - value)),
                      child: child,
                    ),
                  );
                },
                child: const Text(
                  'Selecciona una opción',
                  // TextAlign.center centra el texto horizontalmente
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),

              // SizedBox: Crea un espacio vacío entre widgets
              const SizedBox(height: 40),

              // Primer botón - Lleva al Estado 1
              // AnimatedScale hace que el botón se "hunda" al presionarlo
              AnimatedScale(
                scale: 1.0,
                duration: const Duration(milliseconds: 100),
                child: ElevatedButton(
                  // onPressed: Función que se ejecuta al presionar el botón
                  onPressed: () => _cambiarEstado(AppState.pantalla1),
                  // Estilo del botón
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Ir a Pantalla 1',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),

              // Espacio entre botones
              const SizedBox(height: 20),

              // Segundo botón - Lleva al Estado 2
              ElevatedButton(
                onPressed: () => _cambiarEstado(AppState.pantalla2),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Ir a Pantalla 2',
                  style: TextStyle(fontSize: 18),
                ),
              ),

              // Espacio entre botones
              const SizedBox(height: 20),

              // Tercer botón - Lleva al Estado 3
              ElevatedButton(
                onPressed: () => _cambiarEstado(AppState.pantalla3),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Ir a Pantalla 3',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              // Cuarto botón - Lleva al Estado 4
              ElevatedButton(
                onPressed: () => _cambiarEstado(AppState.pantalla4),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 66, 58, 46),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Ir a Pantalla 4',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              // Quinto botón - Lleva al Estado 5
              ElevatedButton(
                onPressed: () => _cambiarEstado(AppState.pantalla5),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Ir a Pantalla 5',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              // Sexto botón - Lleva al Estado 6
              ElevatedButton(
                onPressed: () => _cambiarEstado(AppState.pantalla6),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Ir a Pantalla 6',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ============================================================================
  /// SCAFFOLD ESTADO 1
  /// Primera pantalla secundaria con título, contenedor y botón de regreso
  /// ============================================================================
  Widget _buildPantalla1() {
    return Scaffold(
      // AppBar con el título del estado 1
      appBar: AppBar(
        title: const Text('Pantalla 1'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      // Body con el contenido del estado 1
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),

          // Column principal que contiene todos los elementos
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Widget de título para esta pantalla con animación
              TweenAnimationBuilder<double>(
                key: UniqueKey(),
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 600),
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value.clamp(0.0, 1.0),
                    child: Transform.scale(
                      scale: 0.5 + (0.5 * value),
                      child: child,
                    ),
                  );
                },
                child: const Text(
                  '¡Bienvenido a la Pantalla 1!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Espacio entre el título y el contenedor
              const SizedBox(height: 30),

              // Container: Widget que permite aplicar decoración y dimensiones
              // TweenAnimationBuilder añade una animación de entrada suave
              TweenAnimationBuilder<double>(
                key: UniqueKey(),
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value.clamp(0.0, 1.0),
                    child: Transform.scale(
                      scale: 0.8 + (0.2 * value),
                      child: child,
                    ),
                  );
                },
                child: Container(
                  // Añade padding interno al contenedor
                  padding: const EdgeInsets.all(20),

                  // Decoración del contenedor (borde, color de fondo, sombra)
                  decoration: BoxDecoration(
                    // Color de fondo del contenedor
                    color: Colors.blue.shade50,
                    // Bordes redondeados
                    borderRadius: BorderRadius.circular(16),
                    // Sombra para dar efecto de profundidad
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.3),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),

                  // Column dentro del contenedor
                  child: Column(
                    children: [
                      // Widget de texto para párrafo informativo
                      const Text(
                        'Esta es la primera pantalla de la aplicación. '
                        'Aquí puedes mostrar información específica del estado 1. '
                        'Los contenedores permiten agrupar widgets y aplicar estilos '
                        'como bordes, sombras y colores de fondo.',
                        style: TextStyle(fontSize: 16, height: 1.5),
                        textAlign: TextAlign.justify,
                      ),

                      // Espacio entre el texto y el botón
                      const SizedBox(height: 20),

                      // Botón para volver a la pantalla principal
                      ElevatedButton.icon(
                        onPressed: _volverAlInicio,
                        // icon: Añade un ícono al botón (flecha hacia atrás)
                        icon: const Icon(Icons.arrow_back),
                        label: const Text(
                          'Volver al Inicio',
                          style: TextStyle(fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ============================================================================
  /// SCAFFOLD ESTADO 2
  /// Segunda pantalla secundaria con título, contenedor y botón de regreso
  /// ============================================================================
  Widget _buildPantalla2() {
    return Scaffold(
      // AppBar con el título del estado 2
      appBar: AppBar(
        title: const Text('Pantalla 2'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      // Body con el contenido del estado 2
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),

          // Column principal que contiene todos los elementos
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Widget de título para esta pantalla - Animación deslizamiento izquierda
              TweenAnimationBuilder<double>(
                key: UniqueKey(),
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeOutCubic,
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(-100 * (1 - value), 0),
                    child: Opacity(
                      opacity: value.clamp(0.0, 1.0),
                      child: child,
                    ),
                  );
                },
                child: const Text(
                  '¡Bienvenido a la Pantalla 2!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Espacio entre el título y el contenedor
              const SizedBox(height: 30),

              // Container decorado con el contenido - Animación fade + rotación
              TweenAnimationBuilder<double>(
                key: UniqueKey(),
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOutBack,
                builder: (context, value, child) {
                  return Transform.rotate(
                    angle: (1 - value) * 0.1,
                    child: Opacity(
                      opacity: value.clamp(0.0, 1.0),
                      child: child,
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.3),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),

                  // Column dentro del contenedor
                  child: Column(
                    children: [
                      // Widget de texto para párrafo informativo
                      const Text(
                        'Esta es la segunda pantalla de la aplicación. '
                        'Cada pantalla mantiene su propio diseño y colores. '
                        'El manejo de estados permite que la aplicación sea '
                        'interactiva y responda a las acciones del usuario de '
                        'manera eficiente y organizada.',
                        style: TextStyle(fontSize: 16, height: 1.5),
                        textAlign: TextAlign.justify,
                      ),

                      // Espacio entre el texto y el botón
                      const SizedBox(height: 20),

                      // Botón para volver a la pantalla principal
                      ElevatedButton.icon(
                        onPressed: _volverAlInicio,
                        icon: const Icon(Icons.arrow_back),
                        label: const Text(
                          'Volver al Inicio',
                          style: TextStyle(fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ============================================================================
  /// SCAFFOLD ESTADO 3
  /// Tercera pantalla secundaria con título, contenedor y botón de regreso
  /// ============================================================================
  Widget _buildPantalla3() {
    return Scaffold(
      // AppBar con el título del estado 3
      appBar: AppBar(
        title: const Text('Pantalla 3'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      // Body con el contenido del estado 3
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),

          // Column principal que contiene todos los elementos
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Widget de título para esta pantalla - Animación rebote desde arriba
              TweenAnimationBuilder<double>(
                key: UniqueKey(),
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 900),
                curve: Curves.bounceOut,
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(0, -200 * (1 - value)),
                    child: Opacity(
                      opacity: value.clamp(0.0, 1.0),
                      child: child,
                    ),
                  );
                },
                child: const Text(
                  '¡Bienvenido a la Pantalla 3!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Espacio entre el título y el contenedor
              const SizedBox(height: 30),

              // Container decorado con el contenido - Animación de pulsación
              TweenAnimationBuilder<double>(
                key: UniqueKey(),
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 1000),
                curve: Curves.elasticOut,
                builder: (context, value, child) {
                  return Transform.scale(scale: value, child: child);
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.3),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),

                  // Column dentro del contenedor
                  child: Column(
                    children: [
                      // Widget de texto para párrafo informativo
                      const Text(
                        'Esta es la tercera pantalla de la aplicación. '
                        'El uso de setState() permite que Flutter redibuje solo '
                        'las partes necesarias de la interfaz, haciendo que las '
                        'aplicaciones sean rápidas y eficientes. Esta es una de '
                        'las características principales de Flutter.',
                        style: TextStyle(fontSize: 16, height: 1.5),
                        textAlign: TextAlign.justify,
                      ),

                      // Espacio entre el texto y el botón
                      const SizedBox(height: 20),

                      // Botón para volver a la pantalla principal
                      ElevatedButton.icon(
                        onPressed: _volverAlInicio,
                        icon: const Icon(Icons.arrow_back),
                        label: const Text(
                          'Volver al Inicio',
                          style: TextStyle(fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPantalla4() {
    return Scaffold(
      // AppBar con el título del estado 3
      appBar: AppBar(
        title: const Text('Pantalla 4'),
        backgroundColor: const Color.fromARGB(255, 66, 58, 46),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),

      // Body con el contenido del estado 3
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),

          // Column principal que contiene todos los elementos
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Widget de título para esta pantalla - Animación deslizamiento derecha
              TweenAnimationBuilder<double>(
                key: UniqueKey(),
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOutQuad,
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(150 * (1 - value), 0),
                    child: Opacity(
                      opacity: value.clamp(0.0, 1.0),
                      child: child,
                    ),
                  );
                },
                child: const Text(
                  '¡Bienvenido a la Pantalla 4!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 66, 58, 46),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Espacio entre el título y el contenedor
              const SizedBox(height: 30),

              // Container decorado con el contenido - Animación flip
              TweenAnimationBuilder<double>(
                key: UniqueKey(),
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 900),
                curve: Curves.easeOut,
                builder: (context, value, child) {
                  return Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY((1 - value) * 3.14159 / 2),
                    alignment: Alignment.center,
                    child: Opacity(
                      opacity: value.clamp(0.0, 1.0),
                      child: child,
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.3),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),

                  // Column dentro del contenedor
                  child: Column(
                    children: [
                      // Widget de texto para párrafo informativo
                      const Text(
                        'Esta es la cuarta pantalla de la aplicación. '
                        'El uso de setState() permite que Flutter redibuje solo '
                        'las partes necesarias de la interfaz, haciendo que las '
                        'aplicaciones sean rápidas y eficientes. Esta es una de '
                        'las características principales de Flutter.',
                        style: TextStyle(fontSize: 16, height: 1.5),
                        textAlign: TextAlign.justify,
                      ),

                      // Espacio entre el texto y el botón
                      const SizedBox(height: 20),

                      // Botón para volver a la pantalla principal
                      ElevatedButton.icon(
                        onPressed: _volverAlInicio,
                        icon: const Icon(Icons.arrow_back),
                        label: const Text(
                          'Volver al Inicio',
                          style: TextStyle(fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                            255,
                            66,
                            58,
                            46,
                          ),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// ============================================================================
  /// SCAFFOLD ESTADO 5
  /// Quinta pantalla secundaria con imagen de red y animación
  /// ============================================================================
  Widget _buildPantalla5() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 5'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Título con animación de zoom
              TweenAnimationBuilder<double>(
                key: UniqueKey(),
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 700),
                curve: Curves.easeOutBack,
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: Opacity(
                      opacity: value.clamp(0.0, 1.0),
                      child: child,
                    ),
                  );
                },
                child: const Text(
                  '¡Bienvenido a la Pantalla 5!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.purple,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              // Imagen de red con animación
              TweenAnimationBuilder<double>(
                key: UniqueKey(),
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 1000),
                curve: Curves.easeIn,
                builder: (context, value, child) {
                  return Opacity(
                    opacity: value.clamp(0.0, 1.0),
                    child: Transform.scale(
                      scale: 0.7 + (0.3 * value),
                      child: child,
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    'https://www.publicdomainpictures.net/pictures/50000/nahled/networking.jpg',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 200,
                        color: Colors.purple.shade100,
                        child: const Icon(
                          Icons.error,
                          size: 50,
                          color: Colors.purple,
                        ),
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        height: 200,
                        color: Colors.purple.shade100,
                        child: Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.3),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'Esta es la quinta pantalla con una imagen de networking. '
                      'Las imágenes se cargan desde internet usando Image.network(). '
                      'Se incluyen estados de carga y error para mejor experiencia.',
                      style: TextStyle(fontSize: 16, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: _volverAlInicio,
                      icon: const Icon(Icons.arrow_back),
                      label: const Text(
                        'Volver al Inicio',
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
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

  /// ============================================================================
  /// SCAFFOLD ESTADO 6
  /// Sexta pantalla secundaria con imagen de red y animación diferente
  /// ============================================================================
  Widget _buildPantalla6() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 6'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Título con animación de rotación y fade
              TweenAnimationBuilder<double>(
                key: UniqueKey(),
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOut,
                builder: (context, value, child) {
                  return Transform.rotate(
                    angle: (1 - value) * 6.28, // 2 vueltas completas
                    child: Opacity(
                      opacity: value.clamp(0.0, 1.0),
                      child: child,
                    ),
                  );
                },
                child: const Text(
                  '¡Bienvenido a la Pantalla 6!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 30),
              // Imagen de red con animación de deslizamiento
              TweenAnimationBuilder<double>(
                key: UniqueKey(),
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(milliseconds: 1200),
                curve: Curves.elasticOut,
                builder: (context, value, child) {
                  return Transform.translate(
                    offset: Offset(0, 100 * (1 - value)),
                    child: Opacity(
                      opacity: value.clamp(0.0, 1.0),
                      child: child,
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSp-VRO8lXL94e-NOcV-yl1eBalo9e2wteN0g&s',
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 200,
                        color: Colors.teal.shade100,
                        child: const Icon(
                          Icons.error,
                          size: 50,
                          color: Colors.teal,
                        ),
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        height: 200,
                        color: Colors.teal.shade100,
                        child: Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                : null,
                            color: Colors.teal,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.3),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      'Esta es la sexta y última pantalla de la aplicación con datos binarios. '
                      'El sistema de navegación por estados es simple pero efectivo '
                      'para aplicaciones pequeñas y medianas. Flutter ofrece también '
                      'otros métodos de navegación más avanzados.',
                      style: TextStyle(fontSize: 16, height: 1.5),
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: _volverAlInicio,
                      icon: const Icon(Icons.arrow_back),
                      label: const Text(
                        'Volver al Inicio',
                        style: TextStyle(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
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
