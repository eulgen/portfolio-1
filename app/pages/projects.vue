<script setup lang="ts">
const { data: page } = await useAsyncData('projects-page', () => {
  return queryCollection('pages').path('/projects').first()
})
if (!page.value) {
  throw createError({
    statusCode: 404,
    statusMessage: 'Page not found',
    fatal: true
  })
}

const { data: projects } = await useAsyncData('projects', () => {
  return queryCollection('projects').all()
})

const { global } = useAppConfig()

const title = page.value?.seo?.title || page.value?.title
const description = page.value?.seo?.description || page.value?.description

useSeoMeta({
  title,
  ogTitle: title,
  description,
  ogDescription: description
})

defineOgImage('Portfolio', { title, description })
</script>

<template>
  <UPage v-if="page">
    <UPageHero
      :title="page.title"
      :description="page.description"
      :links="page.links"
      :ui="{
        title: 'mx-0! text-left',
        description: 'mx-0! text-left',
        links: 'justify-start'
      }"
    >
      <template #links>
        <div
          v-if="page.links"
          class="flex items-center gap-2"
        >
          <UButton
            :label="page.links[0]?.label"
            :to="global.meetingLink"
            v-bind="page.links[0]"
          />
          <UButton
            :to="`mailto:${global.email}`"
            v-bind="page.links[1]"
          />
        </div>
      </template>
    </UPageHero>

    <UPageSection
      :ui="{
        container: 'pt-0! space-y-8'
      }"
    >
      <div class="grid grid-cols-1 gap-8">
        <Motion
          v-for="(project, index) in projects"
          :key="project.title"
          :initial="{ opacity: 0, y: 20 }"
          :while-in-view="{ opacity: 1, y: 0 }"
          :transition="{ delay: 0.1 * index }"
          :in-view-options="{ once: true }"
        >
          <div class="group relative flex flex-col md:flex-row gap-6 p-6 rounded-2xl border border-neutral-200/80 dark:border-neutral-800/80 bg-neutral-50/50 dark:bg-neutral-900/50 transition-all duration-300 hover:shadow-xl hover:border-primary-500/50">
            <!-- Image column -->
            <div class="w-full md:w-2/5 h-56 md:h-auto min-h-[200px] overflow-hidden rounded-xl bg-neutral-200 dark:bg-neutral-800 relative">
              <img
                :src="project.image"
                :alt="project.title"
                class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-105"
              >
              <span class="absolute top-3 left-3 bg-black/70 text-white text-xs font-semibold px-2.5 py-1 rounded-md backdrop-blur-md">
                {{ new Date(project.date).getFullYear() }}
              </span>
            </div>

            <!-- Content column -->
            <div class="w-full md:w-3/5 flex flex-col justify-between gap-4">
              <div class="space-y-2">
                <h3 class="text-xl font-bold text-highlighted group-hover:text-primary transition-colors">
                  {{ project.title }}
                </h3>
                <p class="text-sm leading-relaxed text-muted">
                  {{ project.description }}
                </p>
              </div>

              <!-- Tags -->
              <div class="flex flex-wrap gap-1.5 pt-2">
                <UBadge
                  v-for="tag in project.tags"
                  :key="tag"
                  color="neutral"
                  variant="subtle"
                  size="sm"
                  class="rounded-lg"
                >
                  {{ tag }}
                </UBadge>
              </div>

              <!-- Action links: GitHub & Demo -->
              <div class="flex items-center gap-3 pt-3 border-t border-neutral-200/60 dark:border-neutral-800/60">
                <UButton
                  v-if="(project as any).github"
                  :to="(project as any).github"
                  target="_blank"
                  size="sm"
                  color="neutral"
                  variant="outline"
                  icon="i-simple-icons-github"
                  label="GitHub"
                />
                <UButton
                  v-if="(project as any).demo"
                  :to="(project as any).demo"
                  target="_blank"
                  size="sm"
                  color="primary"
                  variant="solid"
                  icon="i-lucide-external-link"
                  label="Démo Vercel"
                />
                <UButton
                  v-else-if="project.url && !(project as any).github"
                  :to="project.url"
                  target="_blank"
                  size="sm"
                  color="primary"
                  variant="solid"
                  icon="i-lucide-external-link"
                  label="Visiter"
                />
              </div>
            </div>
          </div>
        </Motion>
      </div>
    </UPageSection>
  </UPage>
</template>
