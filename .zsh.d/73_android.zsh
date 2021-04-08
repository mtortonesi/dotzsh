# Add Android SDK tools to PATH if needed
if [ -d /opt/android-sdk/tools ]
then
  PATH="$PATH:/opt/android-sdk/tools"
fi
if [ -d /opt/android-sdk/platform-tools ]
then
  PATH="$PATH:/opt/android-sdk/platform-tools"
fi
