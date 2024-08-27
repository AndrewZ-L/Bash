echo "=== Informações Do Sistema ==="
echo ""
echo "Sistema Operacional:" $(uname)
echo "CPU:" $(cat /proc/cpuinfo | grep 'model name' | uniq)
echo "Memoria Total:" $(cat /proc/meminfo | awk '/MemTotal/ {print $2/1024/1024"GB"}')
echo "Espaço em disco total:" $(wmic computersystem get totalphysicalmemory)
echo ""
echo "=== Informações de usuário ==="
echo ""
echo "Nome de usuario:" $(whoami)
echo "Diretorio home:" $(pwd ~)
echo "Diretorio atual:" $(pwd)
echo "Usuarios Logados:" $(net user)
