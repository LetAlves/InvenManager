![Logo](https://github.com/LetAlves/InvenManager/blob/dev/app/lib/assets/logo-light.png)
Bem-vindo ao seu novo gerenciador de estoque!

---

## 📋 Visão Geral

Este projeto tem como objetivo demonstrar os principais conceitos de um sistema de estoque. Inclui funcionalidades básicas, como:
- Gerenciar estoque de produtos para um usuário.
- Possui integração com Firebase Authentication e Firestore Database

---

## 🚀 Funcionalidades

### Usuário:
- Cadastrar: Permite o usuário realizar o cadastrado na plataforma para começar a utiliza-la;
- Logar: Permite o usuário acessar a plataforma a partir de um email e senha;
- Esqueci minha senha: Envia um email de redefinição de senha para o endereço cadastrado na plataforma para que o usuário possa alterar a senha externamente;
- Editar usuário: Permite o usuário editar o seu display name (nome de exibição) e alterar a sua imagem de perfil;
- Alterar senha: Permite um usuário já logado alterar a senha dentro do aplicativo.

### Produtos:
 - Cadastrar:  Permite o usuário realizar um cadastro com as informações básicas de um produto.
- Editar produto: Permite o usuário selecionar um produto especifico para atualizar informações básicas de um produto.
- Listar produtos: Na tela de homepage é exibida uma lista de cards com todos os produtos em estoque.
- Atualizar quantidade em estoque: Atualiza a informação de quantidade atual em estoque e gera uma ação de atualização no histórico do produto.
- Verificar histórico das atualizações da quantidade em estoque: Traz a listagem de todas as ações de atualização da quantidade em estoque de um determinado produto.
- Verificar métricas: No meu lateral exibe a informação de quantos produtos um usuário tem cadastrado e quantos estão em falta.

---

## 🛠 Tecnologias Utilizadas

- Linguagem de programação: Dart
- Framework: Flutter
- Bibliotecas adicionais:
  - mask_text_input_formatter 
  - cupertino_icons
  - get_it
  - firebase_storage
  - firebase_core
  - firebase_auth
  - flutter_secure_storage
  - cloud_firestore
  - image_picker
  - uuid

---
