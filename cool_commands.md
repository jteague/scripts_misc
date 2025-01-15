# Sublime license 
**linux:**

sudo perl -pi -e 's/\x80\x79\x05\x00\x0F\x94\xC2/\xC6\x41\x05\x01\xB2\x00\x90/' /opt/sublime_text/sublime_text

**mac**

sudo perl -pi -e 's/\x09\x15\x40\x39\x24\x55\x0f\x94\x2a\x79\x1f\x53\x08\x11\x40\x39\x8b\x00\x80\x52\x2b\x01\x1f\x33/\x29\x00\x80\x52\x09\x15\x00\x39\x0a\x00\x80\x52\x8b\x00\x80\x52\x1f\x20\x03\xd5\x08\x11\x40\x39/' /Applications/Sublime\ Text.app/Contents/MacOS/sublime_text

sudo codesign --sign - --force --deep /Applications/Sublime\ Text.app

**more info:**

https://gist.github.com/skoqaq/3f3e8f28e23c881143cef9cf49d821ff

# Windows Activation Scripts
https://github.com/massgravel/Microsoft-Activation-Scripts
irm https://get.activated.win | iex
