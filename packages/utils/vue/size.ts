import { componentSizeMap } from '@farst/constants'

import type { ComponentSize } from '@farst/constants'

export const getComponentSize = (size?: ComponentSize) => {
  return componentSizeMap[size || 'default']
}
