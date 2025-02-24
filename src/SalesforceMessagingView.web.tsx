import * as React from 'react';

import { SalesforceMessagingViewProps } from './SalesforceMessaging.types';

export default function SalesforceMessagingView(props: SalesforceMessagingViewProps) {
  return (
    <div>
      <iframe
        style={{ flex: 1 }}
        // src={props.url}
        // onLoad={() => props.onLoad({ nativeEvent: { url: props.url } })}
      />
    </div>
  );
}
