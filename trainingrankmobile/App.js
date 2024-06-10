import { LogBox } from 'react-native';
import Provider from './src/routers/Provider';
LogBox.ignoreAllLogs();

export default function App() {
   return <Provider />;
}
