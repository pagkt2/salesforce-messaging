// Reexport the native module. On web, it will be resolved to SalesforceMessagingModule.web.ts
// and on native platforms to SalesforceMessagingModule.ts
export { default } from './SalesforceMessagingModule';
export { default as SalesforceMessagingView } from './SalesforceMessagingView';
export * from  './SalesforceMessaging.types';
