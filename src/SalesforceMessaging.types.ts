import type { StyleProp, ViewStyle, ViewProps } from 'react-native';

export type OnLoadEventPayload = {
  url?: string;
};

export type SalesforceMessagingModuleEvents = {
  onChange: (params: ChangeEventPayload) => void;
};

export type ChangeEventPayload = {
  value: string;
};

export type PreChatFieldType = {
  name: string;
  value: string;
}

export type SalesforceMessagingViewProps = {
  driverExternalId?: String
} & ViewProps;
