#! /bin/bash

NAME=$1

arr=(`echo $NAME | tr '-' ' '`)
result=''
for var in ${arr[@]}
do
     firstLetter=`echo ${var:0:1} | awk '{print toupper($0)}'`
     otherLetter=${var:1}
     result=$result$firstLetter$otherLetter
done

firstResult=$(echo ${result:0:1} | tr '[A-Z]' '[a-z]')
SMALL_HUMP=$firstResult${result:1}
# ---👆 ---

FILE_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")/../packages" && pwd)

re="[[:space:]]+"

if [ "$#" -ne 1 ] || [[ $NAME =~ $re ]] || [ "$NAME" == "" ]; then
  echo "Usage: pnpm gc \${name} with no space"
  exit 1
fi

DIRNAME="$FILE_PATH/components/$NAME"
INPUT_NAME=$NAME

if [ -d "$DIRNAME" ]; then
  echo "$NAME component already exists, please change it"
  exit 1
fi

NORMALIZED_NAME=""
for i in $(echo $NAME | sed 's/[_|-]\([a-z]\)/\ \1/g;s/^\([a-z]\)/\ \1/g'); do
  C=$(echo "${i:0:1}" | tr "[:lower:]" "[:upper:]")
  NORMALIZED_NAME="$NORMALIZED_NAME${C}${i:1}"
done
NAME=$NORMALIZED_NAME
# echo $NAME AaaBbbCcc
# echo $INPUT_NAME aaa-bbb-ccc
# echo $SMALL_HUMP aaaBbb
mkdir -p "$DIRNAME"
mkdir -p "$DIRNAME/src"
mkdir -p "$DIRNAME/__tests__"

cat > $DIRNAME/src/$INPUT_NAME.vue <<EOF
<template>
  <slot />
</template>

<script lang="ts" setup>
import {
  ${SMALL_HUMP}Emits,
   ${SMALL_HUMP}Props
} from './$INPUT_NAME'

defineOptions({
  name: 'Ft$NAME',
})

const props = defineProps(${SMALL_HUMP}Props)
const emit = defineEmits(${SMALL_HUMP}Emits)

// init here
</script>
EOF

cat > $DIRNAME/src/$INPUT_NAME.ts <<EOF
import { buildProps, definePropType } from '@farst/utils'
import type { ExtractPropTypes } from 'vue'
import type ${NAME}Component from './$INPUT_NAME.vue'

export const ${SMALL_HUMP}Props = buildProps({
})
export const ${SMALL_HUMP}Emits = {
}


export type ${NAME}Emits = typeof ${SMALL_HUMP}Emits
export type ${NAME}Props = ExtractPropTypes<typeof ${SMALL_HUMP}Props>
export type ${NAME}Instance = InstanceType<typeof ${NAME}Component>
EOF

cat <<EOF >"$DIRNAME/index.ts"
import { withInstall } from '@farst/utils'
import $NAME from './src/$INPUT_NAME.vue'

export const Fa$NAME = withInstall($NAME)
export default Fa$NAME

export * from './src/$INPUT_NAME'
EOF

cat > $DIRNAME/__tests__/$INPUT_NAME.test.tsx <<EOF
import { mount } from '@vue/test-utils'
import { describe, expect, test } from 'vitest'
import $NAME from '../src/$INPUT_NAME.vue'

const AXIOM = 'Just test world'

describe('$NAME.vue', () => {
  test('render test', () => {
    const wrapper = mount(() => <$NAME>{AXIOM}</$NAME>)

    expect(wrapper.text()).toEqual(AXIOM)
  })
})
EOF
