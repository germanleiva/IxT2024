<script setup>
import { ref } from 'vue';
import { reactive } from 'vue';

let gramsToEat = undefined;
let kmsToFly = 0;
//const pepitaEnergy = ref(0);

const pepita = reactive({
  energy: 0,
});

function displayGrams() {
  console.log(gramsToEat);
}

function displayKms() {
  console.log(kmsToFly);
}

function eat() {
  pepita.energy += gramsToEat * 4;
  console.log(pepita.energy);
}

function fly() {
  pepita.energy -= kmsToFly * 2 + 10;
  console.log(pepita.energy);
}
</script>

<template>
  <h1>Pepita's energy: {{ pepita.energy }}</h1>
  <img src="/public/bird.jpg" />

  <input type="number" v-model="gramsToEat" placeholder="Grams" />
  <button @click="eat">Eat</button>

  <input type="number" v-model="kmsToFly" placeholder="Kilometers" />
  <button @click="fly">Fly</button>
</template>

<style scoped>
.logo {
  height: 6em;
  padding: 1.5em;
  will-change: filter;
  transition: filter 300ms;
}
.logo:hover {
  filter: drop-shadow(0 0 2em #646cffaa);
}
.logo.vue:hover {
  filter: drop-shadow(0 0 2em #42b883aa);
}
</style>
