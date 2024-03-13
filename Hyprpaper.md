# Hyprpaper

## Installation on Fedora 39

1. Install the following dependencies:

```bash
sudo dnf install wayland-devel wayland-protocols-devel pango-devel cairo-devel file-devel libglvnd-devel libglvnd-core-devel libjpeg-turbo-devel libwebp-devel gcc-c++ cmake wlroots wlroots-devel build-ninja
```

2. Install Hyprlang:

```bash
git clone https://github.com/hyprwm/hyprlang
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target hyprlang -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
sudo cmake --install ./build
```

3. Install Hyprpaper:

```bash
CMAKE_C_COMPILER=/usr/bin/gcc CMAKE_CXX_COMPILER=/usr/bin/g++ CMAKE_MAKE_PROGRAM=/usr/bin/ninja make all
```

