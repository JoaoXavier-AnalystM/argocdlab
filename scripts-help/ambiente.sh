#!/usr/bin/env bash
set -e

echo "==> Configurando ambiente Bash"

# Bash como shell padrão
echo "==> Definindo bash como shell padrão"
sudo usermod -s /bin/bash "$(whoami)" || true
sudo usermod -s /bin/bash root || true

# 4️Instalar bash-completion
echo "==> Instalando bash-completion"
sudo apt update
sudo apt install -y bash-completion curl git unzip

# Criar arquivo de aliases profissional
echo "==> Criando ~/.bash_aliases"

cat << 'EOF' > "$HOME/.bash_aliases"

# === ALIASES SRE / DEVOPS ===

# Kubernetes
alias k=kubectl
alias kgp='kubectl get pods'
alias kgs='kubectl get svc'
alias kgn='kubectl get nodes'
alias kga='kubectl get all'
alias kctx='kubectl config current-context'
alias kns='kubectl config set-context --current --namespace'
alias klogs='kubectl logs -f'
alias kdesc='kubectl describe'

# Docker
alias d='docker'
alias dc='docker compose'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias dlog='docker logs -f'
alias dexec='docker exec -it'

# Terraform
alias tf='terraform'
alias tfi='terraform init'
alias tfp='terraform plan'
alias tfa='terraform apply'
alias tfd='terraform destroy'

# Observabilidade
alias ports='ss -tulnp'
alias mem='free -h'
alias cpu='lscpu'
alias dfh='df -h'
alias duh='du -sh * | sort -h'
alias logs='journalctl -xe'
alias metrics='curl localhost:9100/metrics'

# Sistema
alias ll='ls -lah'
alias grep='grep --color=auto'
alias myip='ip a'

EOF

# Garantir que .bashrc carrega aliases e completion
echo "==> Configurando ~/.bashrc"

if ! grep -q ".bash_aliases" "$HOME/.bashrc"; then
cat << 'EOF' >> "$HOME/.bashrc"

# Load aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Load bash completion
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Melhor histórico
export HISTSIZE=10000
export HISTFILESIZE=10000
shopt -s histappend
EOF
fi

# Kubectl autocomplete (se existir)
if command -v kubectl >/dev/null 2>&1; then
    echo "==> Ativando autocomplete do kubectl"
    kubectl completion bash >> "$HOME/.bashrc"
    echo "complete -F __start_kubectl k" >> "$HOME/.bashrc"
fi

echo
echo "✅ Ambiente Bash SRE/DevOps configurado!"
echo "➡ Faça logout/login ou execute: exec bash"