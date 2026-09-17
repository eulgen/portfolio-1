<script setup lang="ts">
const { data: projects } = await useAsyncData('landing-projects', () =>
  queryCollection('projects').order('date', 'DESC').limit(4).all()
)
</script>

<template>
  <UPageSection
    v-if="projects && projects.length"
    title="Projets récents"
    description="Quelques réalisations d'applications web, architectures backend et APIs."
    :ui="{
      container: 'px-0 pt-0! gap-6 sm:gap-8',
      title: 'text-left text-xl sm:text-xl lg:text-2xl font-medium',
      description: 'text-left mt-2 text-sm sm:text-md lg:text-sm text-muted'
    }"
  >
    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-4">
      <Motion
        v-for="(project, index) in projects"
        :key="project.title"
        :initial="{ opacity: 0, transform: 'translateY(15px)' }"
        :while-in-view="{ opacity: 1, transform: 'translateY(0)' }"
        :transition="{ delay: 0.15 * index }"
        :in-view-options="{ once: true }"
      >
        <div class="group relative flex flex-col rounded-2xl border border-neutral-200/80 dark:border-neutral-800/80 bg-neutral-50/40 dark:bg-neutral-900/40 overflow-hidden transition-all duration-300 hover:shadow-lg hover:border-primary-500/50">
          <div class="relative h-48 overflow-hidden bg-neutral-100 dark:bg-neutral-800">
            <img
              :src="project.image"
              :alt="project.title"
              class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-105"
            >
            <div class="absolute top-3 right-3 flex items-center gap-2">
              <UBadge
                color="neutral"
                variant="solid"
                size="xs"
                class="backdrop-blur-md bg-black/60 text-white border-0"
              >
                {{ new Date(project.date).getFullYear() }}
              </UBadge>
            </div>
          </div>

          <div class="p-5 flex flex-col flex-1 gap-3">
            <h3 class="text-base lg:text-lg font-semibold text-highlighted group-hover:text-primary transition-colors">
              {{ project.title }}
            </h3>

            <p class="text-xs lg:text-sm text-muted line-clamp-3 leading-relaxed">
              {{ project.description }}
            </p>

            <!-- Tags -->
            <div class="flex flex-wrap gap-1.5 mt-auto pt-2">
              <UBadge
                v-for="tag in project.tags"
                :key="tag"
                color="neutral"
                variant="subtle"
                size="xs"
                class="rounded-md"
              >
                {{ tag }}
              </UBadge>
            </div>

            <!-- Action buttons: GitHub & Demo -->
            <div class="flex items-center gap-2 pt-3 border-t border-neutral-200/60 dark:border-neutral-800/60">
              <UButton
                v-if="project.github"
                :to="project.github"
                target="_blank"
                size="xs"
                color="neutral"
                variant="outline"
                icon="i-simple-icons-github"
                label="Code Source"
              />
              <UButton
                v-if="project.demo"
                :to="project.demo"
                target="_blank"
                size="xs"
                color="primary"
                variant="solid"
                icon="i-lucide-external-link"
                label="Voir Démo"
              />
              <UButton
                v-else-if="project.url && !project.github"
                :to="project.url"
                target="_blank"
                size="xs"
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

    <!-- Link to all projects page -->
    <div class="flex justify-start pt-4">
      <UButton
        to="/projects"
        color="neutral"
        variant="ghost"
        icon="i-lucide-arrow-right"
        trailing
        label="Voir tous les projets"
      />
    </div>
  </UPageSection>
</template>
