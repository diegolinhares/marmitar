# README

## Instalar dependências do Ruby

```bash
sudo apt-get update
sudo apt-get install git-core zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev
```

## Instalar asdf:

### Passos para instalação

```ruby
sudo apt-get update
sudo apt-get install curl git

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
```

### Copiar asdf no Shell

Para `bash`

```bash
echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo '. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
```

Para `zsh`

```bash
echo '. $HOME/.asdf/asdf.sh' >> ~/.zshrc
echo '. $HOME/.asdf/completions/asdf.zsh' >> ~/.zshrc
```

Reiniciar o shell

```bash
source ~/.bashrc # ou source ~/.zshrc se você usa zsh
```

Verificar se o asdf foi instalado

```bash
asdf version
```

Adicionar plugin Ruby do asdf

```bash
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
```

Instalar ruby

```bash
asdf install ruby 3.3.2
asdf global ruby 3.3.2
```

### Inicializar o projeto

Agora entra na pasta do projeto e roda esses comandos
```bash
bin/setup
bin/dev

rails s
```

Endpoint de cardápio do dia:

```bash
curl -H "Authorization: Token fD7WoV9ZH4qii8KsvwmNKUbSVfsm79rtjwuxgKuCae" \
     -H "Content-Type: application/json" \
     https://localhost:3000/api/v1/menus
```

