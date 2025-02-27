import SalesforceMessaging, { SalesforceMessagingView, PreChatFieldType } from 'salesforce-messaging';
import { SafeAreaView, ScrollView, Text, View, StyleSheet } from 'react-native';
import { createStaticNavigation, useNavigation } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { Button } from '@react-navigation/elements'

export default function App() {
  return <Navigation />;
}

function HomeScreen() {
  const navigation = useNavigation()
  
  return (
    <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
      <Text>Home Screen</Text>
      
      <Button onPress={() => navigation.navigate('Messenger')}>
        Go to Details
      </Button>
    </View>
  );
}
function DetailsScreen() {
  
  const navigation = useNavigation()
  return (
    <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
      <Text>Details Screen</Text>
      <SafeAreaView style={styles.container}>
      <ScrollView style={styles.container}>
        <Text style={styles.header}>Module API Example</Text>
        {/* <Group name="Views">
          <SalesforceMessagingView
            onLoad={({ nativeEvent: { url } }) => console.log(`Loaded: ${url}`)}
            style={styles.view}
          />
        </Group> */}
      </ScrollView>
    </SafeAreaView>
    </View>
  );
}

function Messenger() {
  return (
    <SafeAreaView style={styles.container}>
      <SalesforceMessagingView
        // driverExternalId={"driver_LPPD93VQJH"}
        driverExternalId={"user_NTPRG4XA6A"}
        style={styles.view}
      />
    </SafeAreaView>
  );
}

const RootStack = createNativeStackNavigator({
  initialRouteName: 'Home',
  screenOptions: {
    headerStyle: { backgroundColor: 'tomato' },
  },
  screens: {
    Home: {
      screen: HomeScreen,
      options: {
        title: 'Overview',
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

function Group(props: { name: string; children: React.ReactNode }) {
  return (
    <View style={styles.group}>
      <Text style={styles.groupHeader}>{props.name}</Text>
      {props.children}
    </View>
  );
}

const styles = StyleSheet.create({
  header: {
    fontSize: 30,
    margin: 20,
  },
  groupHeader: {
    fontSize: 20,
    marginBottom: 20,
  },
  group: {
    margin: 20,
    backgroundColor: '#fff',
    borderRadius: 10,
    padding: 20,
  },
  container: {
    flex: 1,
    backgroundColor: '#eee',
  },
  view: {
    flex: 1,
    height: 50,
    color: 'red',
  }
});
