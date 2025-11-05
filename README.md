# 🎶 Projeto de Banco de Dados: Plataforma SPOTYMUSIC

## 📊 Visão Geral do Projeto

o repositório contém o projeto de banco de dados completo para uma plataforma de música online (`SPOTYMUSIC`), desenvolvido como trabalho final do curso de especialização em **Administração de Banco de Dados**, ofertado pelo SENAI-DF.

O objetivo foi aplicar conceitos de modelagem, implementação, gerenciamento de dados e segurança, utilizando o SGBD MySQL.

---

## 🎯 Estrutura do Trabalho (Fases e Arquivos)

O projeto está dividido em quatro pastas principais que representam as etapas de desenvolvimento. Clique no nome da pasta no menu lateral para acessar os arquivos:

| Pasta | Descrição da Fase | Arquivos Principais |
| :--- | :--- | :--- |
| **`01-Modelagem/`** | Modelos Conceitual e Lógico, e o código DDL para criação da estrutura e tabelas. | `Conceitual - Projeto Final.bml` <br> `Logico - Projeto Final.bml` |
| **`02-Procedures-Triggers-Inserts/`** | Implementação de `Stored Procedures`, `Triggers` (Insert/Delete) e comandos `INSERT` em massa para popular o BD. |   `Criacao do bd e tabelas.sql` <br> `Procedure e insercao de dados.sql` <br> `Triggers.sql` <br> `Inserção de Dados.sql` |
| **`03-Queries/`** | Criação de **30 consultas** complexas, incluindo **15** que demonstram o uso de `INNER`, `LEFT` e `RIGHT JOIN` para análise de dados. | `Queries.sql` |
| **`04-Gerenciamento de Usuários/`** | Configuração da segurança do banco, com a criação de 3 perfis de usuários e atribuição de privilégios específicos (`CREATE`, `INSERT`, `SELECT`, etc.). | `Usuarios e privilegios.sql` |

## ⚙️ Detalhes de Implementação

* **Modelagem:** Os arquivos `.bml` mostram os passos de planejamento do banco de dados, antes da implementação física do projeto.
* **Implementação** `Criacao do bd e tabelas.sql` estabelece as bases relacionais (entidades, atributos, chaves).
* **Rotinas:** Procedures e Triggers (pasta **`02`**) garantem a integridade, consistência e automação da lógica de negócios.
* **Análise:** O arquivo `Queries.sql` (pasta **`03`**) é um portfólio de consultas avançadas para extração e manipulação de dados.
* **Segurança:** O arquivo `Usuarios e privilegios.sql` (pasta **`04`**) demonstra a aplicação de controle de acesso (ACL) essencial para a Administração de BD.

---

**Para visualizar o código de cada fase, navegue nas pastas do repositório.**
