# Como Renomear o Repositório no GitHub

Este PR atualiza todas as referências internas para o novo nome "DaiMeru". Para completar o processo de renomeação, você precisa renomear o repositório no GitHub seguindo estes passos:

## Passos para Renomear no GitHub

1. Acesse o repositório em: https://github.com/guimasan/v26
2. Clique em **Settings** (Configurações)
3. Na seção **Repository name** (Nome do repositório), altere de `v26` para `DaiMeru`
4. Clique em **Rename** (Renomear)

## O que acontece após a renomeação?

- O GitHub redirecionará automaticamente `guimasan/v26` para `guimasan/DaiMeru`
- Os clones locais continuarão funcionando
- Pull requests e issues existentes serão preservados
- URLs antigos serão redirecionados automaticamente

## Atualizando URLs locais (opcional mas recomendado)

Após renomear no GitHub, atualize a URL remota nos clones locais:

```bash
git remote set-url origin https://github.com/guimasan/DaiMeru
```

Ou verifique a nova URL:

```bash
git remote -v
```

## Verificação

Após renomear, verifique que o repositório está acessível em:
- https://github.com/guimasan/DaiMeru

O redirecionamento automático garantirá que links antigos continuem funcionando!
