# Conta Meru para Japamala

Este repositório contém o projeto 3D para impressão de uma Conta Meru (também conhecida como Guru Bead) para uso em Japamalas (rosários budistas/hindus).

## Descrição

A Conta Meru é a conta central e principal de um Japamala, tradicionalmente maior que as outras contas. Este design específico apresenta:

- **Esfera dividida em duas metades** com sistema de encaixe por pressão (friction fit)
- **Canal em forma de T** para passagem dos cordões
- **Relevo Dharmachakra** (roda do dharma) no topo
- **Textura de caracóis** na superfície lateral
- **Sistema de pinos** para montagem firme

## Especificações

- **Diâmetro:** 18mm
- **Diâmetro do cordão:** 2mm (com folga de 0.4mm)
- **Material recomendado:** PLA, PETG ou resina
- **Sistema de encaixe:** 4 pinos friction fit

## Arquivos

- `meru.scad` - Arquivo fonte OpenSCAD (editável)
- `meru.stl` - Arquivo STL para impressão 3D
- `meru.3mf` - Arquivo 3MF com configurações de impressão
- `meru.png` - Visualização do modelo
- `skull_bead_fixed_18mm.3mf` - Variante alternativa

## Como Usar

### Impressão 3D

1. Importe o arquivo `meru.stl` ou `meru.3mf` no seu slicer
2. O modelo já está posicionado para impressão:
   - Duas metades da esfera (faces planas para baixo)
   - 4 pinos soltos para encaixe
3. Configurações recomendadas:
   - Resolução: 0.15-0.2mm
   - Preenchimento: 15-20%
   - Suportes: Não necessário
   - Adesão: Brim opcional

### Montagem

1. Imprima todas as peças (2 metades + 4 pinos)
2. Passe o cordão pelo canal em T de uma das metades
3. Insira os 4 pinos nos furos de encaixe
4. Una as duas metades pressionando firmemente
5. O encaixe por pressão deve manter as peças unidas

## Personalização

Para modificar o design, edite o arquivo `meru.scad` no OpenSCAD e ajuste os parâmetros:

```openscad
diametro_esfera = 18;        // Diâmetro total da esfera (mm)
diametro_cordao = 2;         // Diâmetro do cordão (mm)
profundidade_relevo = 1.2;   // Profundidade do relevo
// ... e outros parâmetros
```

## Requisitos

- **OpenSCAD** (para editar o arquivo .scad)
- **Slicer 3D** (PrusaSlicer, Cura, etc.) para preparar para impressão

## Licença

Projeto de código aberto. Use livremente para fins pessoais ou comerciais.

## Autor

Desenvolvido por guimasan

---

**Nota:** Este repositório anteriormente tinha o nome "v26". O nome foi atualizado para melhor refletir o conteúdo do projeto.
