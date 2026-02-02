# Infraestrutura como Código: Script de Provisionamento de Usuários e Diretórios

Este projeto consiste em um script em **Bash** para Linux, desenvolvido para automatizar a criação de diretórios, grupos de usuários e usuários, além de definir permissões de acesso de forma massiva e padronizada. É ideal para configurar ambientes iniciais de servidores ou para fins de estudo sobre administração de sistemas Linux.

## 🚀 Funcionalidades

O script `script.sh` realiza as seguintes ações automaticamente:

1.  **Limpeza e Criação de Diretórios:** Cria pastas para departamentos específicos (`/adm`, `/ven`, `/sec`) e uma pasta pública (`/publico`).
2.  **Criação de Grupos:** Define grupos de segurança para separar privilégios.
3.  **Criação de Usuários:** Provisiona usuários padrão, define seus shells e senhas criptografadas (SHA-512).
4.  **Definição de Permissões (ACL):**
    * Define o `root` como dono de todos os diretórios e arquivos.
    * Altera o grupo dono de cada diretório específico.
    * Aplica permissões de leitura, escrita e execução restritas aos grupos (770) e permissão total para a pasta pública (777).

## 🛠️ Definições do Ambiente

### Estrutura de Diretórios e Permissões

| Diretório | Grupo Dono | Permissão | Descrição |
| :--- | :--- | :--- | :--- |
| `/publico` | root | **777** (rwxrwxrwx) | Acesso total para todos os usuários. |
| `/adm` | GRP_ADM | **770** (rwxrwx---) | Apenas usuários do grupo ADM têm acesso total. |
| `/ven` | GRP_VEN | **770** (rwxrwx---) | Apenas usuários do grupo VEN têm acesso total. |
| `/sec` | GRP_SEC | **770** (rwxrwx---) | Apenas usuários do grupo SEC têm acesso total. |

### Usuários e Grupos

| Grupo | Usuários Atribuídos |
| :--- | :--- |
| **GRP_ADM** (Administração) | `LeoAdm`, `MariaAdm`, `JoseAdm` |
| **GRP_VEN** (Vendas) | `GilVen`, `BrunoVen`, `MarioVen` |
| **GRP_SEC** (Secretariado) | `RobSec`, `ThaisSec`, `FelipeSec` |

## 📋 Pré-requisitos

* Sistema Operacional: Linux (Testado em Ubuntu/Debian).
* Usuário com privilégios de **root** (sudo).
* Pacote `openssl` instalado (para criptografia das senhas).

## 🔧 Como Executar

1. **Clone o repositório:**
   ```bash
   git clone [https://github.com/LeozzinhoFR/automatizacao-IAC.git](https://github.com/LeozzinhoFR/automatizacao-IAC.git)
   cd SEU-REPOSITORIO


2. **Dê permissão de execução ao script:**
```bash
chmod +x script.sh

```


3. **Execute o script como superusuário:**
```bash
sudo ./script.sh

```



## ⚠️ Aviso de Segurança

Este script foi criado para fins educacionais e de laboratório.

* As senhas definidas no script (`123`, `234`, `345`) são genéricas. Em um ambiente de produção, utilize gerenciamento de chaves SSH ou force a troca de senha no primeiro login (`chage -d 0`).
* O algoritmo de hash utilizado é o SHA-512 (`openssl passwd -6`), que é seguro para sistemas modernos.

---

Desenvolvido como parte de estudos em Administração de Sistemas Linux e Shell Scripting.
