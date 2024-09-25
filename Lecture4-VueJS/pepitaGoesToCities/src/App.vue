<script setup>
// import HelloWorld from './components/HelloWorld.vue'
// import TheWelcome from './components/TheWelcome.vue'

import { ref } from 'vue'

class Bird {
  constructor(name, aCity) {
    this.energy = 0
    this.name = name
    this.location = aCity
    this.visitedCities = [aCity]
  }
  eat(grams) {
    this.energy += grams * 4
  }
  fly(kilometers) {
    this.energy -= kilometers * 2 + 10
  }
  visit(destinationCity) {
    let kmsToFly = this.location.distanceTo(destinationCity)

    this.fly(kmsToFly)

    this.location = destinationCity
    this.visitedCities.push(destinationCity)

  }
}

class City {
  constructor(name, latitude, longitude) {
    this.name = name
    this.latitude = latitude
    this.longitude = longitude
  }
  distanceTo(anotherCity) {
    // Checks if the Google Maps API is available before proceeding.
    if (!google.maps) return;

    // Creates a LatLng object for the current city's latitude and longitude.
    let point1 = new google.maps.LatLng(this.latitude, this.longitude);
    // Creates a LatLng object for the destination city's latitude and longitude.
    let point2 = new google.maps.LatLng(
      anotherCity.latitude,
      anotherCity.longitude
    );
    // Calculates the distance in meters between the two points using the Google Maps API.
    let distanceInMeters =
      google.maps.geometry.spherical.computeDistanceBetween(point1, point2);
    // Converts the distance from meters to kilometers.
    let distanceInKms = distanceInMeters / 1000;
    // Returns the distance in kilometers.
    console.log("Calculated distance in km " + distanceInKms)
    return distanceInKms;
  }
}

const aarhus = new City("Århus", 56.17019, 10.18850)
const pepita = ref(new Bird("Pepita", aarhus))

const paris = new City("Paris", 48.85942, 2.29295)

const buenosAires = new City("Buenos Aires", -34.60358, -58.38156)

const gramsToEat = ref(0)
</script>

<template>
  <h1>{{ pepita.name }}'s energy: {{ pepita.energy }}</h1>
  <h1>Current location: {{ pepita.location.name }}</h1>

  <img src="https://upload.wikimedia.org/wikipedia/commons/2/2f/Pied-winged_swallow_%28Hirundo_leucosoma%29.jpg" alt=""
    width="300">
  <br>
  <input type="number" v-model="gramsToEat">
  <button @click="pepita.eat(gramsToEat)">Eat</button>
  <br>
  <input type="number">
  <button>Fly</button>

  <h2>Cities to Visit</h2>
  <button @click="pepita.visit(paris)" :disabled="pepita.energy <= 0">Go to Paris</button>
  <br>
  <button @click="pepita.visit(buenosAires)" :disabled="pepita.energy <= 0">Go to Buenos Aires</button>
  <br>
  <button @click="pepita.visit(aarhus)" :disabled="pepita.energy <= 0">Go to Aarhus</button>

  <h2>Visited Cities</h2>
  <ul>
    <li v-for="eachCity in pepita.visitedCities">
      {{ eachCity.name }}
    </li>
  </ul>
</template>

<style scoped>
header {
  line-height: 1.5;
}

.logo {
  display: block;
  margin: 0 auto 2rem;
}

@media (min-width: 1024px) {
  header {
    display: flex;
    place-items: center;
    padding-right: calc(var(--section-gap) / 2);
  }

  .logo {
    margin: 0 2rem 0 0;
  }

  header .wrapper {
    display: flex;
    place-items: flex-start;
    flex-wrap: wrap;
  }
}
</style>
