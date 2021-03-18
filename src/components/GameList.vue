<template>
  <table cellspacing="0">
    <thead>
      <th>Title</th>
      <th>Edition</th>
      <th>Publisher</th>
    </thead>
    <tbody>
      <tr v-for="game in games.games" :key="game.id">
        <td><router-link :to="{ name: 'GameDetails', params: { id: game.id } }"> {{ game.title }} </router-link></td>
        <td><router-link :to="{ name: 'GameDetails', params: { id: game.id } }"> {{ game.edition }} </router-link></td>
        <td><router-link :to="{ name: 'GameDetails', params: { id: game.id } }"> {{ game.publisher }} </router-link></td>
        </tr>
    </tbody>
  </table>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import gamesdata from "@/data/games.json";

export default defineComponent({
    name: "GameList",
    props: ['id'],
    data() {
      return {
        games: gamesdata
      }
    }
    });


</script>

<style scoped>
A {
  text-decoration: none;
  color:#000000;
}

TABLE {
  border:1px solid #000000;
  border-bottom:none;
}

TD {
  border-bottom:1px solid #000000;
  padding:0.5em;
}

TD A {
  display:block;
  width:100%;
  height:100%;
}

TH {
  padding:0.5em;
  background-color: #333333;
  font-weight:bold;
  color:#ffffff;
  text-align: left;
}

TR:hover TD, TR:hover TD A {
  background-color:#cccccc;
  cursor: pointer;
  color:#1a0dab;
  text-decoration: underline;
}

</style>
