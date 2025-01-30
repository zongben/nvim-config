# nvim-config

## Installation

### Remove existing configuration

For linux
```bash
# bash
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

For windows
```powershell
# powershell
# required
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak

# optional but recommended
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
```

### Clone repository

For linux
```bash
# bash
git clone https://github.com/zongben/nvim-config.git ~/.config/nvim
# or
git clone https://github.com/zongben/nvim-config.git ~/github/nvim
ln -s ~/github/nvim ~/.config/nvim
```

For windows
```powershell
# powershell
git clone https://github.com/zongben/nvim-config.git $env:LOCALAPPDATA\nvim
```
