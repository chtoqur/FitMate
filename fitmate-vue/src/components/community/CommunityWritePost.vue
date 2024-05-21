<template>
  <div>
		
    <TheEditor />
    <!-- <v-container>
		<v-card elevation="10" outlined width="100%" class="mx-auto">
			<v-card-title>
				<span class="mr-2">Write</span>
			</v-card-title>
			<v-card-text>
				<v-text-field
					label="Title"
					:rules="rules"
					:counter="100"
					v-model="title"
				></v-text-field>
        <TheEditor />
			</v-card-text>
			<v-card-actions>
				<v-spacer></v-spacer>
				<Button
					@click="save"
					color="success"
					rounded
					small
					iconName="mdi-content-save-all"
					btnName="Save"
				></Button>
				<Button
					@click="movePage('/list')"
					color="grey darken-1"
					rounded
					small
					iconName="mdi-arrow-left"
					btnName="Back"
				></Button>
			</v-card-actions>
		</v-card>
	</v-container> -->
  </div>
</template>

<script setup>
import { useRouter } from 'vue-router';
import TheEditor from '../common/TheEditor.vue';

const router = useRouter();
</script>

<style scoped>

</style>