<h1 align="center">🌟 NixOS Configuration</h1>

<p align="center">
  <em>Home-Manager, Flakes</em>
</p>

## 📦 Install

```bash
# Clone
git clone https://github.com/kappucin/nixos.git 

# Copy NixOS Configs
sudo cp -r ./nixos/modules /etc/nixos/
sudo cp -r ./nixos/hosts /etc/nixos/
sudo cp ./nixos/flake.nix /etc/nixos/

# Copy home-manager config
cp -r ./nixos/home-manager/* ~/.config/home-manager/ 
