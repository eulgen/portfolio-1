<script setup lang="ts">
const { data: page } = await useAsyncData('about', () => {
  return queryCollection('about').first()
})

if (!page.value) {
  throw createError({
    statusCode: 404,
    statusMessage: 'Page non trouvée',
    fatal: true
  })
}

const title = page.value?.seo?.title || page.value?.title
const description = page.value?.seo?.description || page.value?.description
const content = computed(() => (page.value?.content || {}) as any)

useSeoMeta({
  title,
  ogTitle: title,
  description,
  ogDescription: description
})

defineOgImage('Portfolio', { title, description })
</script>

<template>
  <UPage v-if="page" class="space-y-10 sm:space-y-14 py-6 sm:py-10">
    <!-- Hero Section Premium & Épurée -->
    <section class="relative overflow-hidden rounded-3xl bg-gradient-to-b from-neutral-100/80 via-neutral-50/40 to-transparent dark:from-neutral-900/90 dark:via-neutral-900/40 dark:to-transparent p-6 sm:p-10 lg:p-12 shadow-sm mb-10">
      <div class="flex flex-col lg:flex-row items-center gap-8 lg:gap-12">
        <!-- Photo Unique HD avec Glow Effect -->
        <div class="relative shrink-0 group">
          <div class="absolute -inset-1.5 rounded-3xl bg-gradient-to-r from-primary-500 via-sky-400 to-indigo-500 opacity-30 blur-lg transition duration-500 group-hover:opacity-75" />
          <img
            :src="page.image || '/hero/photo-2.jpg'"
            alt="Brice Jordan Tchuengwe Ndengwe"
            class="relative size-36 sm:size-44 lg:size-52 rounded-2xl ring-4 ring-white dark:ring-neutral-900 shadow-2xl object-cover"
          >
          <div class="absolute -bottom-2 -right-2 bg-emerald-500 text-white rounded-full p-1.5 shadow-lg border-2 border-white dark:border-neutral-900 flex items-center justify-center" title="Disponible pour de nouveaux projets">
            <span class="relative flex size-3">
              <span class="absolute inline-flex size-full rounded-full bg-white opacity-75 animate-ping" />
              <UIcon name="i-lucide-check-circle-2" class="relative size-3 text-white" />
            </span>
          </div>
        </div>

        <!-- Content & Phrasing -->
        <div class="flex-1 text-center lg:text-left space-y-5">
          <!-- Badges de Status -->
          <div class="flex flex-wrap items-center justify-center lg:justify-start gap-2">
            <UBadge color="primary" variant="subtle" size="md" class="rounded-full px-3 py-1 gap-1.5 font-medium">
              <UIcon name="i-lucide-map-pin" class="size-4" />
              <span>{{ content.location || 'Douala, Cameroun' }}</span>
            </UBadge>
            <UBadge color="neutral" variant="subtle" size="md" class="rounded-full px-3 py-1 gap-1.5 font-medium">
              <UIcon name="i-lucide-graduation-cap" class="size-4" />
              <span>{{ content.badge || 'Master II EST LaSalle' }}</span>
            </UBadge>
            <UBadge color="success" variant="soft" size="md" class="rounded-full px-3 py-1 gap-1.5 font-medium">
              <UIcon name="i-lucide-briefcase" class="size-4" />
              <span>Digital House International</span>
            </UBadge>
          </div>

          <!-- Headline -->
          <h1 class="text-3xl sm:text-4xl lg:text-5xl font-black tracking-tight bg-gradient-to-r from-neutral-900 via-neutral-800 to-neutral-700 dark:from-white dark:via-neutral-100 dark:to-neutral-300 bg-clip-text text-transparent">
            {{ page.title }}
          </h1>

          <!-- Compelling Pitch Text -->
          <p class="text-base sm:text-lg text-neutral-600 dark:text-neutral-300 max-w-2xl font-normal leading-relaxed">
            {{ page.description }}
          </p>

          <div v-if="content.pitch" class="prose dark:prose-invert max-w-2xl text-sm sm:text-base text-neutral-600 dark:text-neutral-300 leading-relaxed font-normal">
            <MDC :value="content.pitch" unwrap="p" />
          </div>

          <!-- Action Buttons -->
          <div class="flex flex-wrap items-center justify-center lg:justify-start gap-3.5 pt-3">
            <UButton
              to="/contact"
              color="primary"
              size="lg"
              icon="i-lucide-send"
              class="rounded-xl px-6 shadow-md hover:shadow-lg transition-all"
            >
              Me contacter
            </UButton>
            <UButton
              to="/cv.pdf"
              target="_blank"
              color="neutral"
              variant="outline"
              size="lg"
              icon="i-lucide-download"
              class="rounded-xl px-6"
            >
              Télécharger mon CV
            </UButton>
          </div>
        </div>
      </div>

      <!-- Key Stats Row Glassmorphism -->
      <div v-if="content.stats" class="grid grid-cols-1 sm:grid-cols-3 gap-4 mt-10 pt-8 border-t border-neutral-200/40 dark:border-neutral-800/40">
        <div
          v-for="(stat, idx) in content.stats"
          :key="idx"
          class="p-5 rounded-2xl bg-white/70 dark:bg-neutral-900/60 backdrop-blur-md flex flex-col items-center lg:items-start text-center lg:text-left shadow-xs hover:-translate-y-1 transition-transform duration-300"
        >
          <span class="text-2xl sm:text-3xl font-black text-primary-600 dark:text-primary-400">
            {{ stat.value }}
          </span>
          <span class="text-sm font-bold text-neutral-900 dark:text-white mt-1">
            {{ stat.label }}
          </span>
          <span class="text-xs text-neutral-500 dark:text-neutral-400 mt-0.5 font-medium">
            {{ stat.sub }}
          </span>
        </div>
      </div>
    </section>

    <!-- Bottom CTA Banner Gradient -->
    <section class="rounded-3xl bg-gradient-to-r from-primary-600/10 via-sky-500/10 to-indigo-600/10 dark:from-primary-950/40 dark:via-sky-950/30 dark:to-indigo-950/40 backdrop-blur-md p-8 sm:p-12 text-center space-y-6 shadow-sm">
      <h2 class="text-2xl sm:text-3xl font-extrabold text-neutral-900 dark:text-white">
        Un projet d'envergure ou une collaboration en vue ?
      </h2>
      <p class="text-base sm:text-lg text-neutral-600 dark:text-neutral-300 max-w-xl mx-auto leading-relaxed">
        Transformons vos idées en applications robustes et évolutives. Discutons de vos besoins en développement Spring Boot, Nuxt.js ou architecture logicielle.
      </p>
      <div class="flex flex-wrap items-center justify-center gap-4 pt-2">
        <UButton
          to="/contact"
          color="primary"
          size="lg"
          icon="i-lucide-arrow-right"
          class="rounded-xl px-7 shadow-md"
        >
          Démarrer un échange
        </UButton>
        <UButton
          to="/projects"
          color="neutral"
          variant="ghost"
          size="lg"
          icon="i-lucide-folder-git-2"
          class="rounded-xl px-6"
        >
          Explorer mes projets
        </UButton>
      </div>
    </section>
  </UPage>
</template>
