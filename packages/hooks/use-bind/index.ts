import { reactive } from 'vue'
import { pick } from 'lodash-es'

export function useBindProps<T extends object, R extends object>(
  props: T,
  targetPropsOptions: R,
  exclude: string[] = []
) {
  const keys = Object.keys(targetPropsOptions)
  const filterKeys = keys.filter((item) => !exclude.includes(item))
  return reactive(pick(props, filterKeys))
}

export function useOnEmits<T extends (...args: any[]) => any, R extends object>(
  emit: T,
  emitsConfig: R,
  exclude: string[] = []
) {
  return Object.keys(emitsConfig)
    .filter((item) => !exclude.includes(item))
    .reduce((pre, cur) => {
      pre[cur as keyof R] = (...args: any[]) => emit(cur, ...args)
      return pre
    }, {} as Record<keyof R, (...args: any[]) => ReturnType<T>>)
}
