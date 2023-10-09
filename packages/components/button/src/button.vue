<template>
  <el-button v-bind="elProps" v-on="elEmits" @click="handleClick">
    <slot />
  </el-button>
</template>

<script lang="ts" setup>
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
