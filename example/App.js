
import React, { Component } from 'react';
import {
	Alert,
	Linking,
	Platform,
	StyleSheet,
	Text,
	View
} from 'react-native';
import { StackNavigator } from 'react-navigation';
import Spotify from '@lufinkey/react-native-spotify';

var { InitialScreen } = require("./InitialScreen.js");
var { PlayerScreen } = require("./PlayerScreen.js");

export default App = StackNavigator({
	initial: { screen:InitialScreen },
	player: { screen:PlayerScreen },
},{
	headerMode: 'screen',
});
