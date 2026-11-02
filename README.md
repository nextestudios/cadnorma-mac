# CADNorma para AutoCAD 2027 no Mac

Adaptação experimental do CADNorma para **AutoCAD 2027 para macOS em Macs com Apple Silicon**. O CADNorma original é de Denio Guimarães; esta distribuição contém uma adaptação para Mac e os recursos autorizados para redistribuição sob a [licença MIT](LICENSE).

> **Estado do projeto:** a adaptação é parcial. A carga e 14 verificações básicas foram executadas no AutoCAD 2027 em macOS 26.6 Arm64. O seletor alternativo do comando `LIB` foi testado com a inserção de um bloco. Não foram homologados todos os comandos, desenhos e situações de uso.

## Requisitos

- Um Mac com Apple Silicon e AutoCAD 2027 para Mac. O teste foi feito com **AutoCAD completo**, não com AutoCAD LT para Mac.
- Espaço para o ZIP e para a biblioteca descompactada: reserve pelo menos **4 GB** livres.
- Uma pasta de instalação com permissão de gravação. O destino padrão é `~/Documents/Cadnorma-Mac-2027`.
- Para os primeiros testes, um desenho novo e descartável.

## 1. Baixe e descompacte

1. Abra a [página de versões](https://github.com/nextestudios/cadnorma-mac/releases).
2. Em **CADNorma Mac 0.1.0 — experimental**, baixe **`CADNorma-Mac-instalador-MIT.zip`**. O arquivo tem aproximadamente 528 MB. Aguarde o download terminar.
3. No Finder, dê dois cliques no ZIP para descompactar. Abra a pasta extraída.
4. Confira que `Instalar CADNorma Mac.command` e a pasta `CADNorma-Mac` estão lado a lado. Mantenha essa estrutura durante a instalação.

O ZIP do instalador é diferente dos arquivos automáticos “Source code” do GitHub. Prefira o arquivo de instalação indicado acima.

## 2. Instale em Documentos

1. Dê dois cliques em **`Instalar CADNorma Mac.command`**. O Terminal abrirá e fará uma cópia para `Documentos/Cadnorma-Mac-2027`.
2. Aguarde a mensagem `Instalado em:`. A biblioteca contém milhares de arquivos e a cópia pode demorar.
3. O instalador **não sobrescreve** uma pasta de destino existente. Se ela já existir, mantenha-a e use outro destino pelo Terminal, por exemplo:

   ```bash
   cd /caminho/para/a/pasta-extraida
   chmod +x 'Instalar CADNorma Mac.command'
   './Instalar CADNorma Mac.command' "$HOME/Documents/Cadnorma-Mac-teste"
   ```

   Troque `/caminho/para/a/pasta-extraida` pelo caminho real; você pode arrastar a pasta do Finder para o Terminal para inserir seu caminho.

Se o macOS bloquear a abertura de um aplicativo baixado, consulte as mensagens exibidas nas configurações de Privacidade e Segurança e as políticas do seu Mac. O projeto não fornece instalador assinado ou notarizado. Revise a origem e o conteúdo antes de autorizar sua abertura. Não é preciso desligar proteções do macOS ou do AutoCAD.

## 3. Adicione os caminhos de suporte no AutoCAD

O CADNorma usa fontes SHX, hachuras e outros recursos que o AutoCAD precisa localizar.

1. Abra o **AutoCAD 2027 para Mac**.
2. Abra **Preferences / Application / Support File Search Path**. Os nomes podem variar conforme o idioma e a versão da interface.
3. Adicione estas cinco subpastas da instalação, mantendo os caminhos de suporte que já existem:

   ```text
   ~/Documents/Cadnorma-Mac-2027/modelos
   ~/Documents/Cadnorma-Mac-2027/hatch
   ~/Documents/Cadnorma-Mac-2027/lisp
   ~/Documents/Cadnorma-Mac-2027/slides
   ~/Documents/Cadnorma-Mac-2027/blocos
   ```

   Se você escolheu outro destino, use as subpastas equivalentes desse destino. Se a interface não aceitar `~`, escolha cada pasta pelo navegador de arquivos.
4. Aplique as alterações. O carregador verifica cinco arquivos SHX e avisa se não os encontrar.

Em nosso teste, `LISPSYS` retornou `nil` no AutoCAD para Mac e os arquivos UTF-8 funcionaram. Não é necessário tentar alterar uma variável que não existe nessa instalação.

## 4. Carregue o CADNorma

1. Crie um desenho novo para teste.
2. Na linha de comando, digite `_APPLOAD` e pressione Enter.
3. Selecione **`carregar_cadnorma_mac.lsp`** dentro da pasta instalada.
4. Se o AutoCAD mostrar o aviso de segurança de arquivo, confira o caminho e decida se confia no arquivo. Podem aparecer avisos adicionais para os arquivos LSP auxiliares. Não desative `SECURELOAD`.
5. O próprio carregador abre um seletor pedindo que você selecione **novamente o mesmo `carregar_cadnorma_mac.lsp`**. Isso informa ao programa a localização da cópia instalada.
6. Confira a mensagem `CADNorma Mac - adaptacao experimental parcial` na linha de comando. A carga define `INSUNITS=4`, como o código original; confira as unidades do desenho antes de trabalhar.

O carregamento atual é manual. Para outra sessão ou desenho, talvez seja necessário carregar novamente o arquivo; não há instalação automática de menu ou toolbar Windows.

## 5. Configure e use

- **`CFG`** abre a configuração. Escolha o espaço, a unidade do desenho e a unidade das cotas; informe também a escala solicitada. Um teste com desenho em centímetros e cotas em milímetros resultou em `DIMLFAC=10`.
- **`GERENTE`** abre uma lista de comandos do núcleo do CADNorma. A lista substitui provisoriamente a barra de ferramentas antiga.
- **`LIB`** abre um seletor de arquivos DWG na pasta `blocos`. Selecione um arquivo de bloco pelo nome e indique ponto e rotação no desenho. O programa consulta os metadados do grupo para escala e layer. Configure antes as unidades e a escala com `CFG`.
- **`CNMACSTATUS`** mostra a raiz da instalação e o estado experimental.
- **`CNMACATALHOS`** carrega atalhos opcionais. Eles incluem nomes curtos e podem sobrepor comandos existentes; carregue-os apenas se quiser usar esses atalhos.

O teste de `LIB` inseriu `acql0100000111.dwg` no ponto `0,0`, layer `Acqualife`, escala XYZ 1 e rotação 0 em um desenho descartável configurado. Outros blocos, unidades, espaços e desenhos precisam de testes próprios.

## 6. Verifique a instalação

1. Com o CADNorma carregado, use `_APPLOAD` para carregar `testar_cadnorma_mac.lsp` da pasta instalada.
2. Execute **`CNMACTESTE`**.
3. Consulte `auditoria/teste-mac.txt` na pasta instalada. `PASS` significa apenas que aquela verificação específica passou; não é certificação de todos os comandos.

O teste verifica presença de alguns recursos, abertura dos arquivos DCL, variáveis legadas, leitura/escrita UTF-8, cópia de um arquivo de teste e leitura da lista de escalas. Ele cria arquivos de teste e um backup **dentro da cópia instalada**. Registre também eventuais mensagens da linha de comando.

## Limitações conhecidas

- A biblioteca visual original depende de `slide_image`, disponível no Windows e não suportado no Mac. O seletor `LIB` atual usa nomes de arquivo: **não mostra miniaturas nem oferece a navegação original por descrições**.
- Funções de criação e reconstrução de bibliotecas de slides dependiam de `SLIDELIB.EXE` do Windows e permanecem indisponíveis. O executável Windows e os VLX não fazem parte desta distribuição.
- A verificação que avisa quando o desenho está sem escala foi acrescentada após a inserção de teste e ainda precisa de teste específico.
- Algumas rotinas antigas, comandos interativos, fontes e tratamentos de erro podem se comportar de modo diferente no AutoCAD atual. Uma falha no tratamento legado de erro foi observada durante testes de configuração.
- A versão não foi homologada para todos os blocos, fabricantes, desenhos, quantitativos ou comandos. Confira escala, unidades, layer, atributos e geometria antes de usar resultados em trabalho de produção.
- A indicação de compatibilidade com AutoCAD 2027/Apple Silicon se refere ao ambiente testado, não a uma certificação Autodesk deste projeto.

## Solução de problemas

| Sintoma | O que verificar |
| --- | --- |
| `vl-load-com not supported` | Confira se carregou `carregar_cadnorma_mac.lsp` da cópia adaptada, e não `carregar_cadnorma.lsp` do pacote Windows original. |
| Arquivo SHX não encontrado | Confirme os cinco caminhos de suporte e o destino real da instalação; reinicie o AutoCAD se necessário. |
| Instalação informa que a pasta já existe | Use outro destino ou mova/renomeie sua cópia existente após fazer backup. O instalador não a sobrescreve. |
| `LIB` pede um arquivo DWG | Esse é o seletor alternativo atual. Escolha um arquivo dentro de `blocos`; a biblioteca por miniaturas ainda não está disponível. |
| Escala inválida ao inserir | Cancele a operação e configure unidades e escala com `CFG` em um desenho de teste. |
| Comando ou caixa de diálogo apresenta erro | Anote a mensagem completa, a versão do AutoCAD/macOS, o comando e os passos; evite usar o resultado em um desenho de produção até conferir. |

## Remoção

Feche os desenhos de teste e remova dos caminhos de suporte apenas as cinco pastas adicionadas para esta instalação. A pasta `Cadnorma-Mac-2027` pode então ser removida ou guardada como backup. O instalador não altera a pasta original `Cadnorma`.

## Licença e créditos

[Licença MIT](LICENSE). CADNorma original: Denio Guimarães. Adaptação e distribuição para Mac: Next Estúdios. A redistribuição sob MIT foi autorizada pelo responsável pela publicação.
