<template>
  <FaButton :type="'primary'" :wait="400" @click="handleClick"
    >连续点我开始</FaButton
  >
</template>

<script setup lang="ts">
import { ElMessage } from 'element-plus'
import { FaButton } from '@farst/components'

function handleClick() {
  ElMessage.info('点击了按钮')
}
</script>

<style lang="scss" scoped></style>
