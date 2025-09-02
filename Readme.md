# KVM Dev Environment

Setup a Docker based development environment for GATech - CS 6210 - Project 1: KVM.  

### Prerequisites
- [Docker Desktop - WSL2](https://www.docker.com/)
- [Visual Studio Code](https://code.visualstudio.com/)  

- VSCode Extensions: 
  - [Remote Development](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.vscode-remote-extensionpack) / Dev Containers
  - [C/C++ Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools-extension-pack)

---

### Setup

1. **Open folder in VS Code**  

2. **Dev Containers: Open Folder in Container** / **Dev Containers: Reopen in Container**  
   Press 'F1' or 'Ctrl+Shift+P'.

3. **Wait 5-10 minutes (Depend on machine)**  
   If complete successfully, terminal will print out list of 8 new vms . Or use "virt-manager" to check it.
   
4. **Edit %UserProfile%\.wslconfig** + **Reset**  
```
[wsl2]
# Enable nested virtualization
nestedVirtualization=true

# Sets the VM to use 4 processors
processors=4

# Limits VM memory to use no more than 16 GB
memory=16GB
```

Goodluck!  
VD
