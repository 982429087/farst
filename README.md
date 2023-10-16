## 这是一个精简过的vue3组件库模板，开启一个新的组件库开发，只需要修改一些配置即可
1. farst全局替换为[name]
2. [name]\packages\farst 文件夹名称修改为[name]
3. [name]\internal\build\src\plugins\farst-alias 文件夹名称修改为[name-alias]
4. [name]\packages\utils\error.ts 中的error类型修改为驼峰[name]
5. [name]\docs\.vitepress\theme\index.ts引入名称修改为驼峰[name]
6. [name]\scripts\update-version.ts 修改为驼峰[name]
7. [name]\scripts\gc.sh 自动生成组件的前缀需要自行修改
8. [name]\docs\tsconfig.ts 中配置主入口
  ```json
  {
    "farst": ["../packages/farst"],
  }
  ```



