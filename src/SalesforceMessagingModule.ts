import { NativeModule, requireNativeModule } from 'expo';

import { SalesforceMessagingModuleEvents } from './SalesforceMessaging.types';

declare class SalesforceMessagingModule extends NativeModule<SalesforceMessagingModuleEvents> {
  PI: number;
  hello(): string;
  setValueAsync(value: string): Promise<void>;
  sendMessage(): void;
}

// This call loads the native module object from the JSI.
export default requireNativeModule<SalesforceMessagingModule>('SalesforceMessaging');
