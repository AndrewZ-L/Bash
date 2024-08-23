import requests
import socket
import re

# Função para verificar se uma porta está aberta
def porta_aberta(host, port):
    s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    s.settimeout(1)
    try:
        s.connect((host, port))
        s.close()
        return True
    except:
        return False
# URL base
def get_user_url():
    url = input("Digite a URL desejada: ")
    
    # Sanitização básica da URL
    url = re.sub(r'[^\w:/.-]', '', url)
    
    # Verificação simples de formato
    if not re.match(r'^https?://', url):
        raise ValueError("URL inválida. Certifique-se de que comece com http:// ou https://")
    
    return url

url = get_user_url()

# Arquivos para salvar os resultados
diretorios_encontrados = open("diretorios_encontrados.txt", "w")
diretorios_nao_encontrados = open("diretorios_que_nao_existem.txt", "w")

# Lendo os diretórios do arquivo
with open("subdomains.txt", "r") as diretorios:
    for diretorio in diretorios:
        urlcompleta = url + "/" + diretorio.strip()

        try:
            response = requests.get(urlcompleta)

            if 200 <= response.status_code < 300:
                print(f"Status: {response.status_code} - diretório {urlcompleta} encontrado")
                diretorios_encontrados.write(urlcompleta + "\n")
                
                # Lendo os arquivos do diretório
                with open("arquivos.txt", "r") as arquivos:
                    for arquivo in arquivos:
                        urlcompleta2 = urlcompleta + "/" + arquivo.strip()

                        try:
                            response2 = requests.get(urlcompleta2)
                            if 200 <= response2.status_code < 300:
                                print(f"    Status: {response2.status_code} foi encontrado o arquivo {urlcompleta2} !!!!!!!!!!!!!!")
                        except:
                            pass
            elif response.status_code == 404:
                diretorios_nao_encontrados.write(urlcompleta + "\n")

        except:
            diretorios_nao_encontrados.write(urlcompleta + "\n")

# Fechando os arquivos
diretorios_encontrados.close()
diretorios_nao_encontrados.close()
