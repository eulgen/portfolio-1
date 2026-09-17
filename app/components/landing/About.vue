<script setup lang="ts">
import type { IndexCollectionItem } from '@nuxt/content'

defineProps<{
  page: IndexCollectionItem
}>()

const highlights = [
  { label: 'Spring Boot & Java', icon: 'i-lucide-server', color: 'primary' },
  { label: 'Architecture Web', icon: 'i-lucide-layers', color: 'info' },
  { label: 'Stage DHI International', icon: 'i-lucide-briefcase', color: 'success' },
  { label: 'Douala, Cameroun', icon: 'i-lucide-map-pin', color: 'warning' },
  { label: 'Objectif CTO (3 ans)', icon: 'i-lucide-rocket', color: 'primary' }
]
</script>

<template>
  <UPageSection
    :title="page.about.title"
    :ui="{
      container: 'p-0! gap-4 sm:gap-4',
      title: 'text-left text-xl sm:text-xl lg:text-2xl font-medium'
    }"
  >
    <template #description>
      <div class="flex flex-col gap-4">
        <p class="text-sm lg:text-base leading-relaxed text-muted text-left">
          {{ page.about.description }}
        </p>

        <!-- Highlights Badges -->
        <div class="flex flex-wrap gap-2 pt-1">
          <UBadge
            v-for="(item, idx) in highlights"
            :key="idx"
            :color="item.color as any"
            variant="soft"
            size="md"
            class="gap-1.5 rounded-lg py-1 px-2.5"
          >
            <UIcon :name="item.icon" class="size-4" />
            <span>{{ item.label }}</span>
          </UBadge>
        </div>
      </div>
    </template>
  </UPageSection>
</template>

