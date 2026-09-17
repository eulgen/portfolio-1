<script setup lang="ts">
const categories = [
  {
    title: 'Backend & Langages',
    description: 'Conception d\'APIs robustes, microservices et logique serveur',
    icon: 'i-lucide-server',
    color: 'primary',
    skills: [
      { name: 'Java', icon: 'i-simple-icons-openjdk', highlight: true },
      { name: 'Spring Boot', icon: 'i-simple-icons-spring', highlight: true },
      { name: 'Python', icon: 'i-simple-icons-python', highlight: false },
      { name: 'FastAPI', icon: 'i-simple-icons-fastapi', highlight: false },
      { name: 'Node.js', icon: 'i-simple-icons-nodedotjs', highlight: false },
      { name: 'Express.js', icon: 'i-simple-icons-express', highlight: false }
    ]
  },
  {
    title: 'Frontend & Web UI',
    description: 'Interfaces réactives, modernes et optimisées pour le SEO',
    icon: 'i-lucide-layout-template',
    color: 'info',
    skills: [
      { name: 'Nuxt.js', icon: 'i-simple-icons-nuxtdotjs', highlight: true },
      { name: 'Vue.js', icon: 'i-simple-icons-vuedotjs', highlight: true },
      { name: 'TypeScript', icon: 'i-simple-icons-typescript', highlight: true },
      { name: 'React', icon: 'i-simple-icons-react', highlight: false },
      { name: 'Next.js', icon: 'i-simple-icons-nextdotjs', highlight: false }
    ]
  },
  {
    title: 'Bases de Données & Persistance',
    description: 'Modélisation, schémas versionnés et requêtes optimisées',
    icon: 'i-lucide-database',
    color: 'success',
    skills: [
      { name: 'MySQL', icon: 'i-simple-icons-mysql', highlight: true },
      { name: 'Spring Data JPA', icon: 'i-lucide-database', highlight: true },
      { name: 'Flyway', icon: 'i-lucide-file-code-2', highlight: true },
      { name: 'MongoDB', icon: 'i-simple-icons-mongodb', highlight: false },
      { name: 'MariaDB', icon: 'i-simple-icons-mariadb', highlight: false }
    ]
  },
  {
    title: 'DevOps & Qualité',
    description: 'Conteneurisation, documentation API et suite de tests unitaires',
    icon: 'i-lucide-box',
    color: 'warning',
    skills: [
      { name: 'Docker', icon: 'i-simple-icons-docker', highlight: true },
      { name: 'Git & GitHub', icon: 'i-simple-icons-github', highlight: true },
      { name: 'Swagger / OpenAPI', icon: 'i-simple-icons-swagger', highlight: false },
      { name: 'JUnit 5 & Mockito', icon: 'i-lucide-check-circle-2', highlight: false }
    ]
  }
]
</script>

<template>
  <UPageSection
    title="Langages & Frameworks Maîtrisés"
    description="Mon stack technique de prédilection pour construire des applications scalables du backend au frontend."
    :ui="{
      container: 'px-0 pt-0! gap-6 sm:gap-8',
      title: 'text-left text-xl sm:text-xl lg:text-2xl font-medium',
      description: 'text-left mt-2 text-sm sm:text-md lg:text-sm text-muted'
    }"
  >
    <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-4">
      <Motion
        v-for="(category, index) in categories"
        :key="category.title"
        :initial="{ opacity: 0, transform: 'translateY(15px)' }"
        :while-in-view="{ opacity: 1, transform: 'translateY(0)' }"
        :transition="{ delay: 0.1 * index }"
        :in-view-options="{ once: true }"
      >
        <div class="p-6 rounded-2xl border border-neutral-200/80 dark:border-neutral-800/80 bg-neutral-50/50 dark:bg-neutral-900/50 flex flex-col gap-4 h-full transition-all duration-300 hover:border-primary-500/40 hover:shadow-lg">
          <!-- Category Header -->
          <div class="flex items-center gap-3">
            <div class="p-2.5 rounded-xl bg-primary-500/10 text-primary">
              <UIcon :name="category.icon" class="size-5" />
            </div>
            <div>
              <h3 class="text-base lg:text-lg font-semibold text-highlighted">
                {{ category.title }}
              </h3>
              <p class="text-xs text-muted">
                {{ category.description }}
              </p>
            </div>
          </div>

          <!-- Skills Badges Grid -->
          <div class="flex flex-wrap gap-2 pt-2 mt-auto">
            <UBadge
              v-for="skill in category.skills"
              :key="skill.name"
              :color="skill.highlight ? 'primary' : 'neutral'"
              :variant="skill.highlight ? 'soft' : 'subtle'"
              size="md"
              class="gap-2 rounded-lg py-1.5 px-3 font-normal transition-transform hover:scale-105"
            >
              <UIcon :name="skill.icon" class="size-4" />
              <span>{{ skill.name }}</span>
            </UBadge>
          </div>
        </div>
      </Motion>
    </div>
  </UPageSection>
</template>
