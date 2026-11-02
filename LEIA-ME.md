# CADNorma Mac — versão experimental

Adaptação parcial do CADNorma para AutoCAD 2027 em macOS Apple Silicon. O CADNorma original é atribuído a Denio Guimarães.

## Instalação

Baixe e extraia o pacote inteiro, mantendo `Instalar CADNorma Mac.command` ao lado da pasta `CADNorma-Mac`. Execute o instalador; ele cria `~/Documents/Cadnorma-Mac-2027` sem sobrescrever uma instalação existente. No Terminal, é possível passar outro caminho como primeiro argumento.

No AutoCAD para Mac, adicione as subpastas `modelos`, `hatch`, `lisp`, `slides` e `blocos` da pasta instalada aos caminhos de suporte. Execute `_APPLOAD`, carregue `carregar_cadnorma_mac.lsp` e selecione o mesmo arquivo novamente quando solicitado. Use um desenho descartável para os primeiros testes.

## Estado da adaptação

A carga e os testes básicos foram executados no AutoCAD 2027 com macOS 26.6 Arm64. CFG foi testado em um cenário. LIB permite selecionar um DWG pelo nome; uma inserção foi observada no AutoCAD. Miniaturas, navegação original por descrição e gerenciamento de SLB ainda não foram portados. A verificação de escala ausente precisa de teste. Nem todos os comandos foram homologados ou comparados com o Windows.

O AutoCAD pode solicitar confirmação para carregar arquivos LSP; não é necessário desativar suas configurações de segurança.

## Direitos

Publicado sob a licença MIT, conforme autorização informada para a redistribuição do pacote original e da adaptação. Consulte LICENSE e preserve os créditos de Denio Guimarães.
