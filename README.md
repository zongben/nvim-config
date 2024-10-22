# nvim-config

## Installation

### Remove existing configuration

For linux
```bash
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```

For windows
```powershell
# required
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak

# optional but recommended
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak
```

### Clone repository

For linux
```bash
git clone https://github.com/ZongBen/nvim-config.git ~/.config/nvim
```

For windows
```powershell
git clone https://github.com/ZongBen/nvim-config.git $env:LOCALAPPDATA\nvim
```
