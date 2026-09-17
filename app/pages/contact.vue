<script setup lang="ts">
const { global } = useAppConfig()

useSeoMeta({
  title: 'Contact - Brice Jordan Tchuengwe Ndengwe',
  ogTitle: 'Contact - Brice Jordan Tchuengwe Ndengwe',
  description: 'Prenez contact avec Brice Jordan Tchuengwe Ndengwe, Ingénieur Logiciel Full-Stack basé à Douala.',
  ogDescription: 'Prenez contact avec Brice Jordan Tchuengwe Ndengwe, Ingénieur Logiciel Full-Stack basé à Douala.'
})

defineOgImage('Portfolio', {
  title: 'Contact',
  description: 'Prenez contact avec moi pour vos projets ou opportunités.'
})

const form = reactive({
  fullName: '',
  email: '',
  subject: '',
  message: ''
})

const isSubmitting = ref(false)
const submitted = ref(false)

function handleSubmit() {
  if (!form.fullName || !form.email || !form.subject || !form.message) return
  isSubmitting.value = true
  setTimeout(() => {
    isSubmitting.value = false
    submitted.value = true
    form.fullName = ''
    form.email = ''
    form.subject = ''
    form.message = ''
  }, 800)
}
</script>

<template>
  <UPage>
    <UPageHero
      title="Contact & Coordonnées"
      description="Un projet backend, une opportunité de collaboration ou une question ? N'hésitez pas à me contacter."
      :ui="{
        title: 'mx-0! text-left text-3xl sm:text-4xl font-bold',
        description: 'mx-0! text-left mt-2 text-muted'
      }"
    />

    <UPageSection :ui="{ container: 'pt-0! space-y-12' }">
      <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
        <!-- Contact Coordinates Column -->
        <div class="space-y-6 lg:col-span-1">
          <div class="p-6 rounded-2xl border border-neutral-200/80 dark:border-neutral-800/80 bg-neutral-50/50 dark:bg-neutral-900/50 space-y-6">
            <h3 class="text-lg font-bold text-highlighted">
              Mes Coordonnées
            </h3>

            <div class="space-y-4">
              <!-- Email -->
              <div class="flex items-start gap-3 text-sm">
                <div class="p-2.5 rounded-xl bg-primary-500/10 text-primary mt-0.5">
                  <UIcon name="i-lucide-mail" class="size-4" />
                </div>
                <div>
                  <p class="text-xs text-muted font-medium">Email</p>
                  <ULink :to="`mailto:ndengbrice@gmail.com`" class="font-medium text-highlighted hover:underline">
                    ndengbrice@gmail.com
                  </ULink>
                </div>
              </div>

              <!-- Phone -->
              <div class="flex items-start gap-3 text-sm">
                <div class="p-2.5 rounded-xl bg-success-500/10 text-success mt-0.5">
                  <UIcon name="i-lucide-phone" class="size-4" />
                </div>
                <div>
                  <p class="text-xs text-muted font-medium">Téléphone</p>
                  <ULink to="tel:+237673349218" class="font-medium text-highlighted hover:underline">
                    (+237) 673349218
                  </ULink>
                </div>
              </div>

              <!-- Location -->
              <div class="flex items-start gap-3 text-sm">
                <div class="p-2.5 rounded-xl bg-warning-500/10 text-warning mt-0.5">
                  <UIcon name="i-lucide-map-pin" class="size-4" />
                </div>
                <div>
                  <p class="text-xs text-muted font-medium">Localisation</p>
                  <p class="font-medium text-highlighted">Douala, Cameroun</p>
                </div>
              </div>

              <!-- LinkedIn -->
              <div class="flex items-start gap-3 text-sm">
                <div class="p-2.5 rounded-xl bg-info-500/10 text-info mt-0.5">
                  <UIcon name="i-simple-icons-linkedin" class="size-4" />
                </div>
                <div>
                  <p class="text-xs text-muted font-medium">LinkedIn</p>
                  <ULink to="https://www.linkedin.com/in/brice-tchuengwe-b55150215" target="_blank" class="font-medium text-highlighted hover:underline">
                    linkedin.com/in/brice-tchuengwe-b55150215
                  </ULink>
                </div>
              </div>

              <!-- GitHub -->
              <div class="flex items-start gap-3 text-sm">
                <div class="p-2.5 rounded-xl bg-neutral-500/10 text-neutral mt-0.5">
                  <UIcon name="i-simple-icons-github" class="size-4" />
                </div>
                <div>
                  <p class="text-xs text-muted font-medium">GitHub</p>
                  <ULink to="https://github.com/eulgen" target="_blank" class="font-medium text-highlighted hover:underline">
                    github.com/eulgen
                  </ULink>
                </div>
              </div>

              <!-- Availability Badge -->
              <div class="pt-2 border-t border-neutral-200/60 dark:border-neutral-800/60">
                <UBadge
                  color="success"
                  variant="subtle"
                  size="md"
                  class="gap-2 rounded-full px-3 py-1.5 w-full justify-center"
                >
                  <span class="relative flex size-2">
                    <span class="absolute inline-flex size-full rounded-full bg-success opacity-75 animate-ping" />
                    <span class="relative inline-flex size-2 scale-90 rounded-full bg-success" />
                  </span>
                  <span>Disponible pour de nouveaux projets</span>
                </UBadge>
              </div>
            </div>
          </div>
        </div>

        <!-- Contact Form Column -->
        <div class="lg:col-span-2">
          <div class="p-6 sm:p-8 rounded-2xl border border-neutral-200/80 dark:border-neutral-800/80 bg-neutral-50/50 dark:bg-neutral-900/50">
            <h3 class="text-xl font-bold text-highlighted mb-2">
              Envoyer un message
            </h3>
            <p class="text-sm text-muted mb-6">
              Remplissez le formulaire ci-dessous et je vous répondrai dans les plus brefs délais.
            </p>

            <div v-if="submitted" class="p-4 rounded-xl bg-success-500/15 border border-success-500/30 text-success text-sm space-y-2 mb-6">
              <div class="flex items-center gap-2 font-semibold">
                <UIcon name="i-lucide-check-circle" class="size-5" />
                <span>Message envoyé !</span>
              </div>
              <p>Merci pour votre message. Je vous recontacterai rapidement.</p>
              <UButton
                size="xs"
                color="success"
                variant="subtle"
                label="Envoyer un autre message"
                @click="submitted = false"
              />
            </div>

            <form v-else class="space-y-5" @submit.prevent="handleSubmit">
              <!-- Full Name -->
              <div class="space-y-1.5">
                <label class="block text-sm font-medium text-highlighted">
                  Nom complet <span class="text-error">*</span>
                </label>
                <UInput
                  v-model="form.fullName"
                  placeholder="Ex: Jean Dupont"
                  icon="i-lucide-user"
                  required
                  class="w-full"
                />
              </div>

              <!-- Email Address -->
              <div class="space-y-1.5">
                <label class="block text-sm font-medium text-highlighted">
                  Adresse email <span class="text-error">*</span>
                </label>
                <UInput
                  v-model="form.email"
                  type="email"
                  placeholder="votre.email@exemple.com"
                  icon="i-lucide-mail"
                  required
                  class="w-full"
                />
              </div>

              <!-- Objet / Sujet -->
              <div class="space-y-1.5">
                <label class="block text-sm font-medium text-highlighted">
                  Objet <span class="text-error">*</span>
                </label>
                <UInput
                  v-model="form.subject"
                  placeholder="Ex: Proposition de projet, opportunité d'emploi..."
                  icon="i-lucide-tag"
                  required
                  class="w-full"
                />
              </div>

              <!-- Message -->
              <div class="space-y-1.5">
                <label class="block text-sm font-medium text-highlighted">
                  Message <span class="text-error">*</span>
                </label>
                <UTextarea
                  v-model="form.message"
                  placeholder="Parlez-moi de votre projet ou posez votre question..."
                  :rows="5"
                  required
                  class="w-full"
                />
              </div>

              <!-- Submit button -->
              <div class="pt-2">
                <UButton
                  type="submit"
                  color="primary"
                  size="lg"
                  icon="i-lucide-send"
                  :loading="isSubmitting"
                  label="Envoyer le message"
                />
              </div>
            </form>
          </div>
        </div>
      </div>
    </UPageSection>
  </UPage>
</template>
