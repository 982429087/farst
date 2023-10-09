---
title: Quick Start
lang: zh-CN
---

# 快速开始

本节将介绍如何在项目中使用 Farst Three

## 使用

### 全局注册

如果你对打包后的文件大小不是很在乎，那么使用完整导入会更方便。

```typescript
// main.ts
import { createApp } from 'vue'
import FarstThree from 'FarstThree'
import 'farst-three/dist/index.css'
import App from './App.vue'

const app = createApp(App)

app.use(FarstThree)
app.mount('#app')
```

#### Volar 支持

如果您使用 Volar，请在 tsconfig.json 中通过 compilerOptions.type 指定全局组件类型。

```json
// tsconfig.json
{
  "compilerOptions": {
    // ...
    "types": ["farst-three/global"]
  }
}
```

### 按需导入

您需要使用额外的插件来导入要使用的组件。

#### 自动导入 <el-tag type="primary" style="vertical-align: middle;" effect="dark" size="small">Recommend</el-tag>

首先你需要安装unplugin-vue-components 和 unplugin-auto-import这两款插件

```shell
npm install -D unplugin-vue-components unplugin-auto-import
```


##### Vite
然后把下列代码插入到你的 Vite 的配置文件中
```ts
// vite.config.ts
import { defineConfig } from 'vite'
import AutoImport from 'unplugin-auto-import/vite'
import Components from 'unplugin-vue-components/vite'
import { ElementPlusResolver } from 'unplugin-vue-components/resolvers'

export default defineConfig({
  // ...
  plugins: [
    // ...
    AutoImport({
      resolvers: [],
    }),
    Components({
        include: `${__dirname}/**`,
        resolvers: [
          ElementPlusResolver({
            importStyle: 'sass',
          }),
          {
            type: 'component',
            resolve: (componentName: string) => {
              if (componentName.startsWith('Ft')) {
                console.log(componentName, epRoot)
                return {
                  name: componentName,
                  from: '@farst-three/components',
                  sideEffects: ['FtScene']
                  .includes(componentName) ? `@farst-three/components/${kebabCase(componentName.slice(2))}/style/index.ts` : undefined,
                }
              }
            }
          }
        ],
        dts: false,
      }),
  ],
})
```

