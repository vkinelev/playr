<template>
  <div id="app">
    <p>{{ message }}</p>
    <button v-on:click="fillInRandomNumber">Fill-in a random number</button>
    <input v-model="number">
    <button v-on:click="checkIsPrime">Is prime?</button>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue!",
      number: 777
    }
  },

  methods: {
    fillInRandomNumber: function() {
      const max = 9999999;
      this.number = Math.floor(Math.random() * max + 1);
    },

    checkIsPrime: function () {
      const number = this.number;
      
      const options = { 
        method: "POST", 
        body: JSON.stringify({ number: number }),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        }
      };
      
      fetch('/api/prime/check', options)
        .then(response => response.json())
        .then(json => {
          if (json.is_prime) {
            this.message = `👍 ${json.number} is prime`
          } else {
            this.message = `👎 ${json.number} is not prime`
          }
        });
    }
  } 
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
