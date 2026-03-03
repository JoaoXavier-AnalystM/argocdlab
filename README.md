# 🚀 Homelab Observability Platform (k3s + GitOps)

---

## 🎯 Objetivo

Projetar e operar uma plataforma Kubernetes baseada em **k3s**:

- GitOps
- Observabilidade (Métricas, Logs e Traces)
- Monitoramento tradicional integrado
- Gestão segura de segredos
- Exposição via Ingress

O objetivo é simular um ambiente de produção para estudos em **SRE / Plataform Engineering /DevOps**.

---

## 🏗 Arquitetura

### Stack Principal

| Camada | Ferramenta | Função |
|--------|------------|--------|
| Kubernetes | k3s | Orquestração de containers |
| GitOps | Argo CD | Controle declarativo do cluster |
| Métricas | Prometheus | Coleta e armazenamento de métricas |
| Logs | Loki | Agregação de logs |
| Traces | Tempo | Distributed tracing |
| Monitoramento | Zabbix | Monitoramento híbrido |
| Secrets | Vault | Gestão segura de segredos |
| Ingress | Traefik | Exposição de serviços |
| Storage | Local Path Provisioner | Provisionamento de volumes |

---

## 🔄 GitOps

Utilizando **Argo CD**, todo o estado do cluster é versionado em Git.

### Fluxo

1. Commit no repositório
2. Argo CD detecta alteração
3. Reconciliação automática
4. Estado desejado aplicado no cluster

Isso garante:

- Reprodutibilidade
- Auditoria
- Controle de mudanças
- Redução de configuração manual

---

## 📊 Observabilidade – 3 Pilares

### 📈 Métricas
- Prometheus
- Node Exporter
- Kube State Metrics
- Alertmanager

### 📜 Logs
- Loki
- Promtail

### 🔎 Traces
- Tempo

Permite correlação entre:

- Performance
- Eventos
- Erros
- Fluxo de requisições

---

## 📊 Monitoramento Híbrido

Integração entre:

- Stack cloud-native
- Zabbix Server
- Zabbix Proxy
- Zabbix Agent

Simula cenários corporativos reais onde múltiplas ferramentas coexistem.

---

## 🔐 Segurança

- HashiCorp Vault para gestão de segredos
- Separação por namespaces
- Exposição controlada via Traefik

---

## 📦 Namespaces Organizados

- `argocd`
- `monitoring`
- `logging`
- `tracing`
- `zabbix`
- `vault`
- `uptime-kuma`

---

## 🧪 Troubleshooting Real

Alguns cenários enfrentados:

- ImagePullBackOff (Kafka)
- Restart loops
- Problemas de storage
- Ajustes de recursos (CPU/Memória)
- Configuração de Ingress

---

## 🚀 Próximos Passos

- [ ] OpenTelemetry Collector
- [ ] Kafka funcional + UI
- [ ] Backup Strategy
- [ ] CI/CD pipeline
- [ ] Multi-node cluster

---