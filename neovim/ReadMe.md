## 前期准备
如果你的电脑首次安装neovim，那么需要提前准备好python3和nodejs环境，并且安装neovim相关包

```sh
pip install pynvim
npm i -g neovim
```

# 安装ide_config
```sh
nvim
:PackerInstall
:MasonInstall
```

# 安装lvim-config
```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim %LOCALAPPDATA%\nvim-data\site\pack\packer\start\packer.nvim
git clone https://github.com/lunarvim/lunarvim %APPDATA%\lunarvim\lvim
cd /d %appdata%\lunarvim\lvim
git reset --hard 9bc82e4e684aa548eb0765734ec4e83f16c78b4c

if not exist %LOCALAPPDATA%\nvim (mkdir %LOCALAPPDATA%\nvim)
cp %APPDATA%\lunarvim\lvim\utils\installer\config.example.lua %LOCALAPPDATA%\nvim\config.lua

nvim -u %appdata%/lunarvim/lvim/init.lua --cmd "set runtimepath+=%appdata%/lunarvim/lvim" -c :LvimSyncCorePlugins
```