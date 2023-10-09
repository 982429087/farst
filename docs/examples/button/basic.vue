<template>
  <FaButton :type="'primary'" :wait="100" @click="handleClick"
    >连续点我开始</FaButton
  >
</template>

<script setup lang="ts">
import { FaButton } from '@farst/components'

function handleClick() {
  console.log('click button')
}
</script>

<style lang="scss" scoped></style>
