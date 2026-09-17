<script setup lang="ts">
import type { IndexCollectionItem } from '@nuxt/content'

defineProps<{
  page: IndexCollectionItem
}>()

function formatDate(dateInput: Date | string) {
  if (!dateInput) return ''
  const d = new Date(dateInput)
  if (isNaN(d.getTime())) return String(dateInput)
  return new Intl.DateTimeFormat('fr-FR', { month: 'short', year: 'numeric' }).format(d)
}
</script>

<template>
  <UPageSection
    :title="page.experience.title"
    :ui="{
      container: 'p-0! gap-4 sm:gap-4',
      title: 'text-left text-xl sm:text-xl lg:text-2xl font-medium'
    }"
  >
    <template #description>
      <div class="flex flex-col gap-4">
        <p v-if="page.experience.description" class="text-sm text-muted text-left">
          {{ page.experience.description }}
        </p>

        <!-- Timeline list -->
        <div class="relative border-l border-neutral-200 dark:border-neutral-800 ml-3 flex flex-col gap-6 pt-2">
          <Motion
            v-for="(experience, index) in page.experience.items"
            :key="index"
            :initial="{ opacity: 0, x: -15 }"
            :while-in-view="{ opacity: 1, x: 0 }"
            :transition="{ delay: 0.1 * index, duration: 0.4 }"
            :in-view-options="{ once: true }"
            class="relative pl-6 group"
          >
            <!-- Bullet marker -->
            <span
              class="absolute -left-[7px] top-1 size-3 rounded-full border-2 border-white dark:border-neutral-900 transition-transform group-hover:scale-125"
              :style="{ backgroundColor: experience.company.color }"
            />

            <div class="flex flex-col gap-1 text-left">
              <!-- Date & Company -->
              <div class="flex items-center flex-wrap gap-2 text-xs text-muted">
                <span class="font-medium text-neutral-600 dark:text-neutral-400 capitalize">
                  {{ formatDate(experience.date) }}
                </span>
                <span>•</span>
                <ULink
                  :to="experience.company.url !== '#' ? experience.company.url : undefined"
                  :target="experience.company.url !== '#' ? '_blank' : undefined"
                  class="inline-flex items-center gap-1.5 font-semibold hover:underline"
                  :style="{ color: experience.company.color }"
                >
                  <img
                    v-if="experience.company.logo && (experience.company.logo.includes('/') || experience.company.logo.includes('.'))"
                    :src="experience.company.logo"
                    :alt="experience.company.name"
                    class="size-5 rounded object-cover inline-block shadow-sm"
                  >
                  <UIcon
                    v-else-if="experience.company.logo"
                    :name="experience.company.logo"
                    class="size-4"
                  />
                  <span>{{ experience.company.name }}</span>
                </ULink>
              </div>

              <!-- Position -->
              <h4 class="text-sm lg:text-base font-medium text-highlighted">
                {{ experience.position }}
              </h4>
            </div>
          </Motion>
        </div>
      </div>
    </template>
  </UPageSection>
</template>

