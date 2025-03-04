import SalesforceMessaging, { SalesforceMessagingView, SalesforceMessagingViewRef } from 'salesforce-messaging';
import { SafeAreaView, ScrollView, Text, View, StyleSheet, Platform } from 'react-native';
import { createStaticNavigation, useNavigation, NavigationProp } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { Button } from '@react-navigation/elements'
import { useEffect, useState, useRef, useContext, createContext } from 'react';

interface SalesforceMessagingContextType {
  ref: React.RefObject<SalesforceMessagingViewRef>;
  openChat: () => void;
}

const SalesforceMessagingContext = createContext<SalesforceMessagingContextType | null>(null);

function SalesforceMessagingProvider({ children }: { children: React.ReactNode }) {
  const ref = useRef<SalesforceMessagingViewRef>(null);

  const openChat = () => {
    ref.current?.openChat();
  };

  const value = {
    ref,
    openChat,
  };

  return (
    <SalesforceMessagingContext.Provider value={value}>
      <SalesforceMessagingView
        ref={ref}
        driverExternalId={"driver_LPPD93VQJH"}
      />
      {children}
    </SalesforceMessagingContext.Provider>
  );
}

export function useSalesforceMessaging() {
  const context = useContext(SalesforceMessagingContext);
  if (!context) {
    throw new Error('useSalesforceMessaging must be used within a SalesforceMessagingProvider');
  }
  return context;
}

export default function App() {
  return (
    <SalesforceMessagingProvider>
      <Navigation />
    </SalesforceMessagingProvider>
  );
}

type RootStackParamList = {
  Home: undefined;
  Details: undefined;
  Messenger: undefined;
};

function HomeScreen() {
  const navigation = useNavigation<NavigationProp<RootStackParamList>>();

  return (
    <View style={styles.screenContainer}>
      <View style={styles.contentContainer}>
        <Text style={styles.header}>Home Screen</Text>
        <Button onPress={() => navigation.navigate('Messenger')}>
          Go to Messenger
        </Button>
      </View>
    </View>
  );
}

function DetailsScreen() {
  const navigation = useNavigation<NavigationProp<RootStackParamList>>();
  const { openChat } = useSalesforceMessaging();

  return (
    <View style={styles.screenContainer}>
      <View style={styles.contentContainer}>
        <Text style={styles.header}>Details Screen</Text>
        <Button onPress={openChat}>
          Open Chat
        </Button>
        <Button onPress={() => navigation.navigate('Home')}>
          Go to Home
        </Button>
      </View>
    </View>
  );
}

function Messenger() {
  const { openChat } = useSalesforceMessaging();
  const navigation = useNavigation<NavigationProp<RootStackParamList>>();

  return (
    <View style={styles.screenContainer}>
      <View style={styles.contentContainer}>
        <Text style={styles.header}>Messenger Screen</Text>
        <Button onPress={openChat}>
          Open Chat
        </Button>
        <Button onPress={() => navigation.navigate('Details')}>
          Go to Details
        </Button>
      </View>
    </View>
  );
}

const RootStack = createNativeStackNavigator({
  initialRouteName: 'Home',
  screenOptions: {
    headerStyle: { backgroundColor: '#2196F3' },
    headerTintColor: '#fff',
  },
  screens: {
    Home: {
      screen: HomeScreen,
      options: {
        title: 'Home',
      },
    },
    Details: {
      screen: DetailsScreen,
      options: {
        title: 'Details',
        headerShown: true
      },
    },
    Messenger: {
      screen: Messenger,
      options: {
        title: 'Messenger',
        headerShown: true
      },
    },
  },
});

const Navigation = createStaticNavigation(RootStack);

const styles = StyleSheet.create({
  screenContainer: {
    flex: 1,
    backgroundColor: '#f5f5f5',
  },
  contentContainer: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
    gap: 16,
  },
  header: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 20,
    color: '#333',
  },
});
