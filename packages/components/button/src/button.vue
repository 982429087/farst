<template>
  <el-button v-bind="elProps" v-on="elEmits" @click="handleClick">
    <slot />
    <template v-if="slots.loading" #loading>
      <slot name="loading" />
    </template>
    <template v-if="slots.icon" #icon>
      <slot name="icon" />
    </template>
  </el-button>
</template>

<script lang="ts" setup>
import { useSlots } from '@vue/runtime-core'
import {
  ElButton,
  buttonEmits as elButtonEmits,
  buttonProps as elButtonProps,
} from 'element-plus'
import { debounce } from 'lodash-es'
import { useBindProps, useOnEmits } from '@farst/hooks'
import { buttonEmits, buttonProps } from './button'

defineOptions({
  name: 'FtButton',
})

const props = defineProps(buttonProps)
const emit = defineEmits(buttonEmits)
const slots = useSlots()

const elProps = useBindProps(props, elButtonProps)
const elEmits = useOnEmits(emit, elButtonEmits, ['click'])

const handleClick = debounce(
  (event) => {
    emit('click', event)
  },
  props.wait,
  {
    leading: true,
    trailing: false,
  }
)
</script>
