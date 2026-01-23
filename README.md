# DaiMeru

Conta Meru para Japamala - Um projeto de conta decorativa para rosário budista (japamala).

## Descrição

Este projeto contém os arquivos para criar uma conta Meru decorativa para japamala, com design inspirado em símbolos budistas. A conta é dividida em duas metades que se encaixam através de um sistema de friction fit com pinos, permitindo a passagem de cordões através de um canal interno em formato de T.

## Características

- **Diâmetro**: 18mm
- **Sistema de Encaixe**: Friction fit com 4 pinos
- **Canal Interno**: Formato em T para passagem de cordões
- **Decoração**: Motivo Dharmachakra (Roda do Dharma) em baixo-relevo
- **Textura**: Padrão de caracóis distribuídos na superfície

## Arquivos do Projeto

- `meru.scad` - Código fonte OpenSCAD para geração do modelo 3D
- `meru.stl` - Arquivo STL pronto para impressão 3D
- `meru.3mf` - Arquivo 3MF com configurações de impressão
- `meru.png` - Imagem de visualização do modelo
- `skull_bead_fixed_18mm.3mf` - Arquivo adicional de conta decorativa

## Como Usar

### Visualização e Edição

1. Abra o arquivo `meru.scad` no [OpenSCAD](https://openscad.org/)
2. Ajuste os parâmetros conforme necessário
3. Renderize o modelo (F6)
4. Exporte para STL se desejar modificar

### Impressão 3D

1. Importe o arquivo `meru.stl` ou `meru.3mf` no seu software de fatiamento
2. Configure as seguintes recomendações:
   - **Camada**: 0.2mm
   - **Preenchimento**: 15-20%
   - **Suportes**: Não necessários (modelo otimizado)
   - **Orientação**: Faces planas para baixo

3. As duas metades devem ser impressas simultaneamente junto com os 4 pinos de encaixe

### Montagem

1. Insira os pinos nos furos de uma das metades
2. Passe os cordões pelo canal em T
3. Encaixe a segunda metade pressionando firmemente

## Parâmetros Personalizáveis

No arquivo `meru.scad`, você pode ajustar:

- `diametro_esfera` - Tamanho da conta (padrão: 18mm)
- `diametro_cordao` - Espessura do cordão (padrão: 2mm)
- `profundidade_relevo` - Profundidade do motivo decorativo
- `num_pinos` - Quantidade de pinos de encaixe
- E muitos outros...

## Licença

Este projeto é de código aberto. Sinta-se livre para usar, modificar e compartilhar.

## Autor

Criado por guimasan

## Repositório

https://github.com/guimasan/DaiMeru
