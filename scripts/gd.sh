#! /bin/bash
NAME=$1
FILE_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")/../docs" && pwd)
MD_FILE_PATH=$FILE_PATH/zh-CN/component
EXAMPLE_FILE_PATH=$FILE_PATH/examples

NORMALIZED_NAME=""
for i in $(echo $NAME | sed 's/[_|-]\([a-z]\)/\ \1/g;s/^\([a-z]\)/\ \1/g'); do
  C=$(echo "${i:0:1}" | tr "[:lower:]" "[:upper:]")
  NORMALIZED_NAME="$NORMALIZED_NAME${C}${i:1}"
done

mkdir -p "$EXAMPLE_FILE_PATH/$NAME"

cat >$MD_FILE_PATH/$NAME.md <<EOF
---
title: $NORMALIZED_NAME
lang: zh-CN
---

# $NORMALIZED_NAME


## 基础用法

:::demo

$NAME/basic

:::

## API

### Attributes

| Name          | Description  | Type                      | Default     | Required |
| ------------- | ------------ | ------------------------- | ----------- | -------- |


### Events

| Name   | Description        | Type                                               |
| ------ | ------------------ | -------------------------------------------------- |


### Provide

| Key                           | Description         | Type               |
| ----------------------------- | ------------------- | ------------------ |


### Slots

| Name      | Description |
| --------- | ----------- |


EOF

cat >$EXAMPLE_FILE_PATH/$NAME/basic.vue <<EOF
<template>
  <div />
</template>

<script setup lang="ts">
import { reactive, ref } from 'vue'

</script>

<style lang="scss" scoped>

</style>
EOF
