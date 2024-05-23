<template>
  <div>
    <div class="box"></div>
    <div class="the-editor">
      <!-- 제목 -->
      <div class="editor-title">
        <input
          type="text"
          placeholder="제목을 입력하세요."
          v-model="postTitle"
        />
      </div>
      <div v-if="editor" class="editor-tool">
        <button
          @click="editor.chain().focus().toggleBold().run()"
          :disabled="!editor.can().chain().focus().toggleBold().run()"
          :class="{ 'is-active': editor.isActive('bold') }"
        >
          <span class="mdi mdi-format-bold"></span>
        </button>
        <button
          @click="editor.chain().focus().toggleItalic().run()"
          :disabled="!editor.can().chain().focus().toggleItalic().run()"
          :class="{ 'is-active': editor.isActive('italic') }"
        >
          <span class="mdi mdi-format-italic"></span>
        </button>
        <button
          @click="editor.chain().focus().toggleStrike().run()"
          :disabled="!editor.can().chain().focus().toggleStrike().run()"
          :class="{ 'is-active': editor.isActive('strike') }"
        >
          <span class="mdi mdi-format-strikethrough"></span>
        </button>
        <button
          @click="editor.chain().focus().toggleCode().run()"
          :disabled="!editor.can().chain().focus().toggleCode().run()"
          :class="{ 'is-active': editor.isActive('code') }"
        >
          code
        </button>
        <!-- <button @click="editor.chain().focus().unsetAllMarks().run()">
          clear marks
        </button>
        <button @click="editor.chain().focus().clearNodes().run()">
          clear nodes
        </button> -->
        <button
          @click="editor.chain().focus().setParagraph().run()"
          :class="{ 'is-active': editor.isActive('paragraph') }"
        >
          paragraph
        </button>
        <button
          @click="editor.chain().focus().toggleHeading({ level: 1 }).run()"
          :class="{ 'is-active': editor.isActive('heading', { level: 1 }) }"
        >
          h1
        </button>
        <button
          @click="editor.chain().focus().toggleHeading({ level: 2 }).run()"
          :class="{ 'is-active': editor.isActive('heading', { level: 2 }) }"
        >
          h2
        </button>
        <button
          @click="editor.chain().focus().toggleHeading({ level: 3 }).run()"
          :class="{ 'is-active': editor.isActive('heading', { level: 3 }) }"
        >
          h3
        </button>
        <button
          @click="editor.chain().focus().toggleHeading({ level: 4 }).run()"
          :class="{ 'is-active': editor.isActive('heading', { level: 4 }) }"
        >
          h4
        </button>
        <button
          @click="editor.chain().focus().toggleHeading({ level: 5 }).run()"
          :class="{ 'is-active': editor.isActive('heading', { level: 5 }) }"
        >
          h5
        </button>
        <button
          @click="editor.chain().focus().toggleHeading({ level: 6 }).run()"
          :class="{ 'is-active': editor.isActive('heading', { level: 6 }) }"
        >
          h6
        </button>
        <!-- <button
          @click="editor.chain().focus().toggleBulletList().run()"
          :class="{ 'is-active': editor.isActive('bulletList') }"
        >
          bullet list
        </button>
        <button
          @click="editor.chain().focus().toggleOrderedList().run()"
          :class="{ 'is-active': editor.isActive('orderedList') }"
        >
          ordered list
        </button> -->
        <button
          @click="editor.chain().focus().toggleCodeBlock().run()"
          :class="{ 'is-active': editor.isActive('codeBlock') }"
        >
          <span class="mdi mdi-code-block-tags"></span>
        </button>
        <!-- <button
          @click="editor.chain().focus().toggleBlockquote().run()"
          :class="{ 'is-active': editor.isActive('blockquote') }"
        >
          blockquote
        </button> -->
        <button @click="editor.chain().focus().setHorizontalRule().run()">
          <span class="mdi mdi-minus"></span>
        </button>
        <!-- <button @click="editor.chain().focus().setHardBreak().run()">
          hard break
        </button> -->
        <button
          @click="editor.chain().focus().undo().run()"
          :disabled="!editor.can().chain().focus().undo().run()"
        >
          <span class="mdi mdi-undo"></span>
        </button>
        <button
          @click="editor.chain().focus().redo().run()"
          :disabled="!editor.can().chain().focus().redo().run()"
        >
          <span class="mdi mdi-redo"></span>
        </button>
      </div>
      <div class="editor-content">
        <editor-content :editor="editor" />
      </div>
      <div class="btn-box">
        <v-btn variant="outlined" class="ma-2" @click="writePost">
          등록하기
        </v-btn>
        <v-btn
          variant="outlined"
          class="ma-2"
          @click="router.push('/community')"
        >
          목록으로
        </v-btn>
      </div>
    </div>
  </div>
</template>

<script setup>
// tiptap
import StarterKit from "@tiptap/starter-kit";
import { Editor, EditorContent } from "@tiptap/vue-3";
import Placeholder from "@tiptap/extension-placeholder";

import { ref, onMounted } from "vue";
import { useCommunityStore } from "@/stores/community";
import { useUserStore } from "@/stores/user";
import { useRoute, useRouter } from "vue-router";

const store = useCommunityStore();
const userStore = useUserStore();
const editor = ref(null);
const postTitle = ref("");
const route = useRoute();
const router = useRouter();

const writePost = () => {
  if (editor.value) {
    const htmlContent = editor.value.getHTML();
    const post = {
      title: postTitle.value,
      writer: userStore.loginUser.id,
      content: htmlContent,
      likeCnt: 0,
      viewCnt: 0,
      comment_cnt: 0,
    };
    store.createPost(post);
    alert("게시글이 등록되었습니다.");
    router.push("/community");
  }
};

onMounted(() => {
  editor.value = new Editor({
    extensions: [
      StarterKit,
      Placeholder.configure({
        placeholder: "Write something …",
      }),
    ],
    content: null,
  });
});
</script>

<style scoped>
.the-editor {
  height: 100%;
  border: 4px solid black;
  border-radius: 10px;
  padding: 20px;
  margin: 0 19%;
}

.box {
  height: 50px;
}

.editor-title {
  font-size: 32px;
  font-weight: bold;
  height: 35px;
  margin-bottom: 20px;
}

.editor-title input {
  width: 100%;
  height: 35px;
  margin-bottom: 20px;
}

.editor-tool {
  margin-bottom: 20px;
}
.editor-tool button {
  border: 1px solid black;
  padding: 5px;
}

/* Basic editor styles */
.tiptap > * + * {
  margin-top: 0.75em;
}

.tiptap ul,
.tiptap ol {
  padding: 0 1rem;
}

.tiptap h1,
.tiptap h2,
.tiptap h3,
.tiptap h4,
.tiptap h5,
.tiptap h6 {
  line-height: 1.1;
}

.tiptap code {
  background-color: rgba(97, 97, 97, 0.1);
  color: #616161;
}

.tiptap pre {
  background: #0d0d0d;
  color: #fff;
  font-family: "JetBrainsMono", monospace;
  padding: 0.75rem 1rem;
  border-radius: 0.5rem;
}

.tiptap pre code {
  color: inherit;
  padding: 0;
  background: none;
  font-size: 0.8rem;
}

.tiptap img {
  max-width: 100%;
  height: auto;
}

.tiptap blockquote {
  padding-left: 1rem;
  border-left: 2px solid rgba(13, 13, 13, 0.1);
}

.tiptap hr {
  border: none;
  border-top: 2px solid rgba(13, 13, 13, 0.1);
  margin: 2rem 0;
}

.tiptap p.is-editor-empty:first-child::before {
  color: #adb5bd;
  content: attr(data-placeholder);
  float: left;
  height: 0;
  pointer-events: none;
}

.editor-content {
  margin-bottom: 50px;
}

.btn-box {
  display: flex;
  justify-content: flex-end; /* 오른쪽 정렬 */
}
</style>
