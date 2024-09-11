<script setup>
import { ref } from 'vue'; // Import the 'ref' function from Vue to create reactive references

// Reactive reference to store the message text
const message = ref('hello world');

// Reactive reference to store the counter value
const counter = ref(0);

// Reactive reference to track if the user is logged in or not
const isLoggedIn = ref(false);

// Function to increment the counter value
function increment() {
    counter.value++;
}

// Function to translate the message to Italian
function translateItalian() {
    message.value = 'Buongiorno mondo';
}

// Function to translate the message to English
function translateEnglish() {
    message.value = 'Hello world';
}

// General function to translate the message based on the given language parameter
function translate(language) {
    if (language == 'ITA') {
        message.value = 'Buongiorno mondo'; // Set message to Italian if the language is 'ITA'
    } else {
        message.value = 'Hello world'; // Default to English if the language is not 'ITA'
    }
}
</script>

<template>
    <!-- Display the current message -->
    <p>{{ message }}</p>

    <!-- Display the current counter value -->
    <p>{{ counter }}</p>

    <!-- Button to increment the counter value -->
    <button @click="increment">Increment</button>

    <!-- Button to translate the message to Italian -->
    <button @click="translate('ITA')">Translate in italian</button>

    <!-- Button to translate the message to English -->
    <button @click="translate('ENG')">Translate in english</button>

    <!-- Button to log in, only shown when the user is not logged in -->
    <button v-show="!isLoggedIn" @click="isLoggedIn = true">Login</button>

    <!-- Button to log out, only shown when the user is logged in -->
    <button v-show="isLoggedIn" @click="isLoggedIn = false">Logout</button>
</template>
