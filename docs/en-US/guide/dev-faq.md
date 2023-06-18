---
title: Development FAQ
lang: en-US
---

# Development FAQ

Here are the problems that are easy to encounter in development.

## If you encounter dependency related issues

```shell
rm -rf node_modules
pnpm i
```

## Link local dependencies

```shell
# get dist
pnpm build
cd dist/farst
# set cur farst to global `node_modules`
pnpm link --global
# for esm we also need link farst for dist
pnpm link --global farst

# go to your project, link to `farst`
cd your-project
pnpm link --global farst
```

> More info see [pnpm link](https://pnpm.io/cli/link).

## Theme

We should not write Chinese comments in scss files.

It will generate warning `@charset "UTF-8";` in the header of css file when built with vite.

> More info see [#3219](https://github.com/farst/farst/issues/3219).
