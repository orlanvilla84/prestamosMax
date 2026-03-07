# PrestaMax 📱 — Guía completa para generar APK

## 📁 Estructura del proyecto
```
prestamax-app/
├── .devcontainer/
│   ├── devcontainer.json     ← Configuración Codespace automática
│   └── setup-android.sh      ← Instala Android SDK automáticamente
├── www/
│   └── index.html            ← App completa PrestaMax
├── capacitor.config.json
├── package.json
├── .gitignore
└── README.md
```

---

## 🚀 Paso 1 — Subir a GitHub

1. Ve a **github.com** → `New repository`
2. Nombre: `prestamax-app` → `Create repository`
3. En tu computador descomprime el ZIP
4. Sube todos los archivos al repositorio

---

## 💻 Paso 2 — Abrir en Codespace

1. En el repositorio → botón verde **`Code`**
2. Pestaña **`Codespaces`**
3. Clic **`Create codespace on main`**
4. Espera que cargue (~3 minutos) — instala todo automáticamente

---

## 🤖 Paso 3 — Generar el APK

Una vez abierto el Codespace, abre la terminal y ejecuta:

```bash
# Si el setup automático no corrió, ejecuta esto:
npm install
npx cap add android
npx cap sync android

# Compilar APK
cd android
chmod +x gradlew
./gradlew assembleDebug
```

⏳ La compilación tarda ~5 minutos la primera vez.

---

## 📦 Paso 4 — Descargar el APK

```bash
# Ver dónde quedó el APK
find . -name "*.apk" -type f
# Ruta: android/app/build/outputs/apk/debug/app-debug.apk
```

En Codespace (VS Code):
- Panel izquierdo → navega a `android/app/build/outputs/apk/debug/`
- Clic derecho sobre `app-debug.apk` → **Download**

---

## 📲 Paso 5 — Instalar en celulares

### Opción A — Directo por cable
```bash
# Con el celular conectado por USB y depuración USB activada:
adb install android/app/build/outputs/apk/debug/app-debug.apk
```

### Opción B — Compartir el APK
1. Sube `app-debug.apk` a Google Drive
2. En cada celular: abre el archivo desde Drive
3. **Ajustes → Seguridad → Instalar apps desconocidas** → Activar
4. Instalar ✅

---

## ⚠️ Requisitos del celular
- Android 6.0 o superior
- ~10MB de espacio libre

## 🔄 Actualizar la app
1. Modifica `www/index.html`
2. Ejecuta: `npx cap sync android && cd android && ./gradlew assembleDebug`
3. Descarga e instala el nuevo APK
