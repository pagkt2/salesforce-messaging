import type { StyleProp, ViewStyle } from 'react-native';

export type OnLoadEventPayload = {
  url?: string;
};

export type SalesforceMessagingModuleEvents = {
  onChange: (params: ChangeEventPayload) => void;
};

export type ChangeEventPayload = {
  value: string;
};

export type SalesforceMessagingViewProps = {
  onLoad: (event: { nativeEvent: OnLoadEventPayload }) => void;
  style?: StyleProp<ViewStyle>;
};
