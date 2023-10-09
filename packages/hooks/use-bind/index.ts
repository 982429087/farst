import { reactive } from 'vue'
import { pick } from 'lodash-es'

export function useBindProps<T extends object, R extends object>(
  currentProps: T,
  targetProps: R
) {
  return reactive(pick(currentProps, Object.keys(targetProps)))
}

export function useOnEmits<T extends (...args: any[]) => any, R extends object>(
  emit: T,
  emitsConfig: R
) {
  return Object.keys(emitsConfig).reduce((pre, cur) => {
    pre[cur as keyof R] = (...args: any[]) => emit(cur, ...args)
    return pre
  }, {} as Record<keyof R, (...args: any[]) => ReturnType<T>>)
}
