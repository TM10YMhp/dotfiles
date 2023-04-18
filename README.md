## Dotfiles

**Advertencia**: No use esta configuración a menos que sepa lo que implica.

![screenshot nvim](./images/screenshot_nvim.jpg)

Si su memoria RAM es limitada modifique el [tamaño máximo de memoria de node](https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes).

Limitar la memoria puede llevar a comportamientos inesperados.

```bash
NODE_OPTIONS=--max-old-space-size=256
```

### Requerido

- neovim >= **0.8.0**
- git >= **2.19.0**
- node >= **18.14.0**
- npm >= **9.3.1**
- ripgrep >= **12.1.1**

### Opcional

- fd-find >= **8.2.1**
- tmux >= **3.3a**
- npm-check-updates
- @mryhryki/markdown-preview
- commitizen

### JDTLS

Necesitaras jdk 17 o superior para que funcione correctamente.

Se recomienda configurar lo siguiente:

```bash
JAVA_TOOL_OPTIONS=-Dfile.enconding=UTF-8
```

### Configuraciones para Windows

Se recomienda usar la fuente Menlo al usar CMD.

Necesitaras clink para el autocompletado y el prompt.

Las configuraciones de clink y neovim deben colocarse en `appdata/local`.

Para que los comandos de unix funcionen en windows necesitaras de [w64devkit](https://github.com/skeeto/w64devkit).

Si necesitas mas sutocompletados puedes buscar en [clink-completions](https://github.com/vladimir-kotikov/clink-completions).
