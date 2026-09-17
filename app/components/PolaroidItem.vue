<script setup lang="ts">
defineProps<{
  image: {
    src: string
    alt: string
  }
  index: number
}>()
</script>

<template>
  <div
    class="group relative bg-white dark:bg-neutral-800 p-3 rounded-xl shadow-xl border border-neutral-200/80 dark:border-neutral-700/80 flex flex-col items-center transition-all duration-300 ease-out hover:scale-105 hover:rotate-0 hover:z-20 hover:shadow-2xl"
    :class="[
      index % 3 === 0 ? '-rotate-3' : index % 3 === 1 ? 'rotate-3' : '-rotate-1',
      'w-64 sm:w-72'
    ]"
  >
    <div class="overflow-hidden rounded-lg w-full aspect-square bg-neutral-100 dark:bg-neutral-900">
      <img
        :src="image.src"
        :alt="image.alt"
        class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-105"
      >
    </div>
    <span class="text-xs sm:text-sm text-neutral-700 dark:text-neutral-300 font-medium text-center mt-3 px-2 line-clamp-2">
      {{ image.alt }}
    </span>
  </div>
</template>
