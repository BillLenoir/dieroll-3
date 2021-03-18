<template>
  <p><router-link :to="{ name: 'Home' }">Return</router-link></p>
  <h2> {{ games.games[id].title }}</h2>
  <p> {{ games.games[id].edition }} from {{ games.games[id].publisher }}</p>
  <table cellspacing="0">
    <tr>
      <th>Era:</th>
      <td> {{ games.games[id].era }} </td>
    </tr><tr>
      <th>Size:</th>
      <td v-if="games.games[id].size == 'XL'">Extra Large</td>
      <td v-else-if="games.games[id].size == 'L'">Large</td>
      <td v-else-if="games.games[id].size == 'M'">Medium</td>
      <td v-else>Small</td>
    </tr><tr>
      <th>Scale:</th>
      <td v-if="games.games[id].time && games.games[id].unit && games.games[id].hex">
        <ul>
          <li v-if="games.games[id].time"> {{ games.games[id].time }} </li>
          <li v-if="games.games[id].unit"> {{ games.games[id].unit }} </li>
          <li v-if="games.games[id].hex"> {{ games.games[id].hex }} </li>
        </ul>
        </td>
        <td v-else>No scale info</td>
    </tr><tr>
      <th>Notes:</th>
      <td> {{ games.games[id].notes }}</td>
    </tr>
  </table>
  <p><a :href="`https://boardgamegeek.com/boardgame/${games.games[id].bggid}/${games.games[id].bggurl}`">View on Boardgame Geek</a></p>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import gamesdata from "@/data/games.json";

export default defineComponent({
    props: ['id'],
    data() {
      return {
        games: gamesdata,
      }
    }

})

</script>

<style scoped>

TABLE {
  margin:2.0em;
  border:1px solid #000000;
  border-bottom:none;
}

TD {
  border-bottom:1px solid #000000;
  padding:0.5em;
}

TH {
  padding:0.5em;
  background-color: #333333;
  font-weight:bold;
  color:#ffffff;
  text-align: left;
}

</style>
