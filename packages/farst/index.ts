import installer from './defaults'
export * from '@farst/components'
export * from '@farst/constants'
export * from '@farst/directives'
export * from '@farst/hooks'
export * from './make-installer'

export const install = installer.install
export const version = installer.version
export default installer

export { default as dayjs } from 'dayjs'
