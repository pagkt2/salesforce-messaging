import { registerWebModule, NativeModule } from 'expo';

import { SalesforceMessagingModuleEvents } from './SalesforceMessaging.types';

class SalesforceMessagingModule extends NativeModule<SalesforceMessagingModuleEvents> {
  PI = Math.PI;
  async setValueAsync(value: string): Promise<void> {
    this.emit('onChange', { value });
  }
  hello() {
    return 'Hello world! 👋';
  }
}

export default registerWebModule(SalesforceMessagingModule);
