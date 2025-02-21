import { requireNativeView } from 'expo';
import * as React from 'react';

import { SalesforceMessagingViewProps } from './SalesforceMessaging.types';

const NativeView: React.ComponentType<SalesforceMessagingViewProps> =
  requireNativeView('SalesforceMessaging');

export default function SalesforceMessagingView(props: SalesforceMessagingViewProps) {
  return <NativeView {...props} />;
}
