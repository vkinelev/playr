<template>
  <div id="app">
    <p>{{ message }}</p>
    <input name='number' v-model="number">
    <button v-on:click="checkIsPrime">Is prime?</button>
    <button v-on:click="fillInRandomNumber">Fill-in a random number</button>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: '',
      number: null
    }
  },

  methods: {
    fillInRandomNumber: function() {
      const max = 9999999;
      this.number = Math.floor(Math.random() * max + 1);
    },

    checkIsPrime: function () {
      const number = this.number;

      this.postJsonData('/api/prime/check', { number: number })
        .then(json => {
          if (json.is_prime) {
            this.message = `🎉👍 ${json.number} is a prime number`
          } else {
            this.message = `👎 ${json.number} is not a prime number`
          }
        })
        .catch(error => {
          this.message = error.message;
        })
    },

    postJsonData: function(url, data) {
      const options = {
        method: "POST",
        body: JSON.stringify(data),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        }
      };

      return fetch(url, options)
        .then(response => {
          if (response.ok) {
            return response.json();
          }

          return response.json().then(json => {
            throw new Error(json.error_message);
          });
        })
    }
  },
}
</script>

<style scoped>
</style>
