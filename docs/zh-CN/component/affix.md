---
title: Affix
lang: zh-CN
---

# Affix

第一个中文文档

## 基础用法

默认情况下，词缀固定在页面的顶部。

:::demo 你可以设置`offset`属性来改变偏移顶部，默认值为0。

affix/basic

:::

## 目标容器

您可以设置`target`属性以始终将词缀保留在容器中。如果超出范围，它将被隐藏。

:::demo 请注意，容器避免有滚动条。

affix/target

:::

## 固定位置

The affix component provides two fixed positions: `top` and `bottom`.

:::demo You can set `position` attribute to change the fixed position, the default value is `top`.

affix/fixed

:::

## Affix API

### Affix Attributes

| Name       | Description                      | Type                       | Default | Required |
| ---------- | -------------------------------- | -------------------------- | ------- | -------- |
| `offset`   | offset distance.                 | ^[number]                  | `0`     | No       |
| `position` | position of affix.               | ^[enum]`'top' \| 'bottom'` | `'top'` | No       |
| `target`   | target container. (CSS selector) | ^[string]                  | —       | No       |
| `z-index`  | `z-index` of affix               | ^[number]                  | `100`   | No       |

### Affix Events

| Name     | Description                        | Type                                                                |
| -------- | ---------------------------------- | ------------------------------------------------------------------- |
| `change` | triggers when fixed state changed. | ^[Function]`(fixed: boolean) => void`                               |
| `scroll` | triggers when scrolling.           | ^[Function]`(value: { scrollTop: number, fixed: boolean }) => void` |

### Affix Exposes

| Method       | Description                 | Type                    |
| ------------ | --------------------------- | ----------------------- |
| `update`     | update affix state manually | ^[Function]`() => void` |
| `updateRoot` | update rootRect info        | ^[Function]`() => void` |

### Affix Slots

| Name      | Description                |
| --------- | -------------------------- |
| `default` | customize default content. |
