<template>
  <div class="home">
    <GameList />
  </div>
</template>

<script lang="ts">
import { defineComponent } from "vue";
import GameList from "@/components/GameList.vue";

export default defineComponent({
  name: "Home",
  components: {
    GameList
  }
});
</script>
