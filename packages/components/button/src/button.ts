import {
  buttonEmits as elButtonEmits,
  buttonProps as elButtonProps,
} from 'element-plus'
import { buildProps } from '@farst/utils'
import type { ExtractPropTypes } from 'vue'
import type ButtonComponent from './button.vue'

export const buttonProps = buildProps({
  wait: {
    type: Number,
    default: 0,
  },
  ...elButtonProps,
})
export const buttonEmits = {
  ...elButtonEmits,
}

export type ButtonEmits = typeof buttonEmits
export type ButtonProps = ExtractPropTypes<typeof buttonProps>
export type ButtonInstance = InstanceType<typeof ButtonComponent>
