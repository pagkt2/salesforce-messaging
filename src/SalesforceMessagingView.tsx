import { requireNativeView } from 'expo';
import * as React from 'react';

import { SalesforceMessagingViewProps, SalesforceMessagingViewRef } from './SalesforceMessaging.types';

const NativeView: React.ComponentType<SalesforceMessagingViewProps> =
  requireNativeView('SalesforceMessaging');

export const SalesforceMessagingView = React.forwardRef<SalesforceMessagingViewRef, SalesforceMessagingViewProps>((props, ref) => {
  return <NativeView {...props} ref={ref} />;
});

export default SalesforceMessagingView;