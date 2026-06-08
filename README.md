# 🇪🇨 Ecuador Turístico — App Flutter

Aplicación móvil desarrollada en Flutter que presenta los principales sitios turísticos del Ecuador, con imágenes, descripciones, sistema de favoritos interactivo y navegación directa a Google Maps.

---

## 📋 Tabla de contenidos

- [Descripción general](#descripción-general)
- [Características](#características)
- [Capturas de pantalla](#capturas-de-pantalla)
- [Requisitos previos](#requisitos-previos)
- [Instalación](#instalación)
- [Estructura del proyecto](#estructura-del-proyecto)
- [Arquitectura y componentes](#arquitectura-y-componentes)
- [Sitios turísticos incluidos](#sitios-turísticos-incluidos)
- [Dependencias](#dependencias)
- [Configuración de Android](#configuración-de-android)
- [Cómo contribuir](#cómo-contribuir)

---

## Descripción general

**Ecuador Turístico** es una app informativa que permite al usuario explorar 10 destinos icónicos del Ecuador. Cada tarjeta muestra una imagen representativa del lugar, su ubicación, una descripción, un contador de favoritos interactivo y un botón directo a Google Maps para obtener rutas y detalles del lugar.

---

## Características

- **Listado visual de sitios turísticos** con tarjetas estilizadas (imagen, nombre, ubicación, descripción).
- **Sistema de favoritos interactivo** — cada tarjeta tiene un ícono de corazón que alterna entre activo/inactivo con animación, y actualiza el contador en tiempo real.
- **Integración con Google Maps** — el botón "Ver en Maps" abre el sitio directamente en la aplicación de Google Maps del dispositivo.
- **Botón Compartir** — preparado para implementar funcionalidad de compartir el destino.
- **AppBar expandible** con imagen de fondo y efecto parallax al hacer scroll.
- **Diseño responsivo** con tarjetas de bordes redondeados, sombras y colores temáticos verdes inspirados en la bandera de Ecuador.

---

## Capturas de pantalla

<img width="775" height="911" alt="image" src="https://github.com/user-attachments/assets/b7ca9e8c-9950-4151-8578-09d6edf70336" />

<img width="777" height="540" alt="image" src="https://github.com/user-attachments/assets/56ab9aea-aa0e-43ae-8446-a727c7652db1" />

---

## Requisitos previos

Antes de instalar y correr el proyecto, asegúrate de tener:

| Herramienta | Versión mínima | Enlace |
|-------------|----------------|--------|
| Flutter SDK | 3.12.1 | https://flutter.dev/docs/get-started/install |
| Dart SDK | 3.12.1 | Incluido con Flutter |
| Android Studio | Cualquier versión reciente | https://developer.android.com/studio |
| Android SDK | API 21+ (Android 5.0) | Configurable desde Android Studio |
| Java / JDK | 17 | Requerido por Gradle |

> También se puede usar VS Code con la extensión de Flutter.

---

## Estructura del proyecto

```
flutter_application_2/
│
├── android/                          # Configuración nativa Android
│   ├── app/
│   │   ├── build.gradle.kts          # Config de compilación (SDK, versiones)
│   │   └── src/
│   │       └── main/
│   │           ├── AndroidManifest.xml   # Permisos e intent-filters
│   │           └── kotlin/.../MainActivity.kt
│   ├── build.gradle.kts
│   ├── gradle.properties
│   └── settings.gradle.kts
│
├── images/                           # Imágenes de los sitios turísticos
│   ├── mitad_mundo.jpg
│   ├── cotopaxi.jpg
│   └── ...
│
├── lib/
│   └── main.dart                     # Código fuente principal (toda la lógica y UI)
│
├── test/
│   └── widget_test.dart              # Tests de widgets
│
├── web/                              # Soporte para Flutter Web
│   ├── index.html
│   └── manifest.json
│
├── pubspec.yaml                      # Dependencias y assets del proyecto
└── README.md
```

---

## Arquitectura y componentes

El proyecto usa una arquitectura simple de un solo archivo (`main.dart`) con separación de widgets por responsabilidad.

### Modelo de datos — `SitioTuristico`

```dart
class SitioTuristico {
  final String nombre;        // Nombre del destino
  final String ubicacion;     // Ciudad o provincia
  final String descripcion;   // Descripción breve
  final String imagen;        // Ruta local del asset (images/xxx.jpg)
  final String geolocalizacion; // URL de Google Maps con coordenadas
  final String emoji;         // Emoji representativo del lugar
}
```

### Widgets principales

| Widget | Tipo | Responsabilidad |
|--------|------|-----------------|
| `MyApp` | `StatelessWidget` | Punto de entrada, define el tema global |
| `HomeScreen` | `StatelessWidget` | Pantalla principal con `CustomScrollView` y `SliverAppBar` |
| `SitioCard` | `StatefulWidget` | Tarjeta individual de cada destino; maneja estado de favorito |
| `_SitioCardState` | `State` | Lógica de toggle favorito y apertura de Google Maps |

### Flujo de interacción — favoritos

```
Usuario toca ❤️
      │
      ▼
_toggleFavorite()
      │
      ├── isFavorite = !isFavorite
      ├── favoriteCount += isFavorite ? 1 : -1
      └── setState() → reconstruye el ícono y el contador
```

### Flujo de interacción — Google Maps

```
Usuario toca [Ver en Maps]
      │
      ▼
_openMaps()
      │
      ├── canLaunchUrl(uri) → true
      │         └── launchUrl(uri, LaunchMode.externalApplication)
      │                   └── Abre Google Maps nativo
      │
      └── canLaunchUrl(uri) → false
                └── SnackBar: "No se pudo abrir Google Maps"
```

---

## Sitios turísticos incluidos

| # | Nombre | Ubicación | Coordenadas |
|---|--------|-----------|-------------|
| 1 | 🌐 Mitad del Mundo | Quito | -0.0022, -78.4558 |
| 2 | 🌋 Volcán Cotopaxi | Latacunga | -0.6800, -78.4370 |
| 3 | 💧 Baños de Agua Santa | Tungurahua | -1.3969, -78.4247 |
| 4 | 🏞️ Laguna Quilotoa | Cotopaxi | -0.8556, -78.8974 |
| 5 | 🐢 Islas Galápagos | Galápagos | -0.9538, -90.9656 |
| 6 | 🌆 Malecón 2000 | Guayaquil | -2.1894, -79.8806 |
| 7 | 🌿 Parque Nacional Yasuní | Amazonía | -0.6748, -76.3980 |
| 8 | ⛪ Catedral Nueva | Cuenca | -2.9001, -79.0059 |
| 9 | 🚂 Nariz del Diablo | Alausí | -2.2034, -78.8487 |
| 10 | 🦜 Reserva Cuyabeno | Sucumbíos | -0.0200, -76.1600 |

---

## Dependencias

Definidas en `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.8   # Íconos estilo iOS
  url_launcher: ^6.3.1      # Abrir URLs y apps externas (Google Maps)

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^6.0.0     # Reglas de linting recomendadas
```

### Por qué `url_launcher`

El paquete `url_launcher` permite abrir URLs desde Flutter hacia aplicaciones del sistema operativo. En este proyecto se usa con `LaunchMode.externalApplication` para garantizar que el enlace se abra en la app nativa de Google Maps (y no en el navegador).

---

## Configuración de Android

### Permisos en `AndroidManifest.xml`

Para que `url_launcher` funcione correctamente en Android 11+, es necesario declarar los `<queries>` de intención:

```xml
<uses-permission android:name="android.permission.INTERNET"/>

<queries>
  <intent>
    <action android:name="android.intent.action.VIEW" />
    <data android:scheme="https" />
  </intent>
</queries>
```

Sin esta configuración, `canLaunchUrl()` retorna `false` en Android 11 o superior.

### Versiones de compilación (`build.gradle.kts`)

```kotlin
compileSdk = flutter.compileSdkVersion   // Definido por Flutter
minSdk    = flutter.minSdkVersion        // Android 5.0 (API 21) mínimo
targetSdk = flutter.targetSdkVersion
```

### JVM y Kotlin

```kotlin
compileOptions {
  sourceCompatibility = JavaVersion.VERSION_17
  targetCompatibility = JavaVersion.VERSION_17
}
kotlin {
  compilerOptions {
    jvmTarget = JvmTarget.JVM_17
  }
}
```

---

*Desarrollado por Jhosselin Naula❤️*
