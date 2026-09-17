<script setup lang="ts">
import type { IndexCollectionItem } from '@nuxt/content'

const props = defineProps<{
  page: IndexCollectionItem
}>()

const categories = computed(() => props.page.faq?.categories || [])

const tabItems = computed(() => {
  return categories.value.map((cat) => ({
    label: cat.title,
    key: cat.title.toLowerCase(),
    questions: cat.questions
  }))
})
</script>

<template>
  <UPageSection
    v-if="page.faq"
    :title="page.faq.title"
    :description="page.faq.description"
    :ui="{
      container: 'px-0 pt-0! gap-4 sm:gap-4',
      title: 'text-left text-xl sm:text-xl lg:text-2xl font-medium',
      description: 'text-left mt-2 text-sm sm:text-md lg:text-sm text-muted'
    }"
  >
    <div class="w-full mt-2">
      <!-- If multiple categories exist, render tabs -->
      <UTabs
        v-if="tabItems.length > 1"
        :items="tabItems"
        orientation="horizontal"
        class="w-full"
      >
        <template #content="{ item }">
          <UAccordion
            trailing-icon="i-lucide-plus"
            :items="item.questions"
            :unmount-on-hide="false"
            class="w-full mt-3"
            :ui="{
              item: 'border-b border-neutral-200/60 dark:border-neutral-800/60 py-1',
              trigger: 'py-3 text-left font-medium text-sm lg:text-base hover:text-primary transition-colors flex justify-between items-center w-full',
              trailingIcon: 'size-4 transition-transform duration-200 group-data-[state=open]:rotate-45 text-muted'
            }"
          >
            <template #body="{ item: _item }">
              <MDC
                :value="_item.content"
                unwrap="p"
                class="pb-4 text-sm leading-relaxed text-muted text-left"
              />
            </template>
          </UAccordion>
        </template>
      </UTabs>

      <!-- If single category, render accordion directly -->
      <UAccordion
        v-else-if="tabItems.length === 1 && tabItems[0]"
        trailing-icon="i-lucide-plus"
        :items="tabItems[0].questions || []"
        :unmount-on-hide="false"
        class="w-full"
        :ui="{
          item: 'border-b border-neutral-200/60 dark:border-neutral-800/60 py-1',
          trigger: 'py-3.5 text-left font-medium text-sm lg:text-base hover:text-primary transition-colors flex justify-between items-center w-full',
          trailingIcon: 'size-4 transition-transform duration-200 group-data-[state=open]:rotate-45 text-muted'
        }"
      >
        <template #body="{ item: _item }">
          <MDC
            :value="_item.content"
            unwrap="p"
            class="pb-4 text-sm leading-relaxed text-muted text-left"
          />
        </template>
      </UAccordion>
    </div>
  </UPageSection>
</template>

