#!/bin/bash
# Setup Android SDK in Codespace
echo "📦 Instalando Android SDK..."

# Variables
ANDROID_HOME=/opt/android-sdk
CMDLINE_TOOLS_VERSION="11076708"
CMDLINE_TOOLS_URL="https://dl.google.com/android/repository/commandlinetools-linux-${CMDLINE_TOOLS_VERSION}_latest.zip"

# Install dependencies
sudo apt-get update -q
sudo apt-get install -y -q wget unzip

# Download command line tools
mkdir -p $ANDROID_HOME/cmdline-tools
wget -q $CMDLINE_TOOLS_URL -O /tmp/cmdline-tools.zip
unzip -q /tmp/cmdline-tools.zip -d /tmp/cmdline-tools-extracted
mv /tmp/cmdline-tools-extracted/cmdline-tools $ANDROID_HOME/cmdline-tools/latest
rm /tmp/cmdline-tools.zip

# Set environment variables
echo "export ANDROID_HOME=$ANDROID_HOME" >> ~/.bashrc
echo "export ANDROID_SDK_ROOT=$ANDROID_HOME" >> ~/.bashrc
echo "export PATH=\$PATH:\$ANDROID_HOME/cmdline-tools/latest/bin:\$ANDROID_HOME/platform-tools:\$ANDROID_HOME/build-tools/34.0.0" >> ~/.bashrc
export ANDROID_HOME=$ANDROID_HOME
export ANDROID_SDK_ROOT=$ANDROID_HOME
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools

# Accept licenses and install SDK
yes | sdkmanager --licenses > /dev/null 2>&1
sdkmanager "platforms;android-34" "build-tools;34.0.0" "platform-tools" > /dev/null 2>&1

echo "✅ Android SDK instalado en $ANDROID_HOME"

# Add android platform to capacitor
npx cap add android 2>/dev/null || true
npx cap sync android 2>/dev/null || true

echo "✅ Proyecto listo. Ejecuta: cd android && ./gradlew assembleDebug"
