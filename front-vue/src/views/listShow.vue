<template>
  <div class="list-show">
    <div class="mt-2 md:mt-8 lg:mt-16 max-w-xl mx-auto">
      <div class="bg-white p-8 shadow rounded-lg">
        <h1
          class="text-3xl uppercase font-semibold tracking-wide text-center mb-2"
        >
          <span class="float-left" @click="$router.go(-1)">
            <font-awesome-icon
              icon="long-arrow-alt-left"
              class="text-black"
            ></font-awesome-icon>
          </span>
          {{ list.name }}
        </h1>
        <ul class="max-w-xl mx-auto">
          <ApolloMutation
            :mutation="require('@/graphql/mutations/createTask.gql')"
            :variables="{ name: name, listId: this.$route.params.listId }"
            @done="taskAdded"
          >
            <template v-slot="{ mutate, loading, error }">
              <form action="#" @submit.prevent="mutate()">
                <input
                  type="text"
                  name="email"
                  class="mb-2 rounded w-full shadow p-2 border border-gray-900 tracking-wide text-lg pl-12"
                  placeholder="Add Task"
                  id="task-name"
                  autocomplete="on"
                  v-model="name"
                />
              </form>
            </template>
          </ApolloMutation>
          <li
            v-for="task in tasks"
            :key="task.id"
            class="mb-2 p-2 pl-5 shadow tracking-wide rounded-lg text-xl"
            :class="task.done ? 'text-gray-600 line-through' : 'text-black'"
            @click="changeStatus(task)"
          >
            <font-awesome-icon
              icon="check-circle"
              class="text-gray-600"
              v-if="task.done === true"
            ></font-awesome-icon>
            <font-awesome-icon
              icon="circle"
              class="text-black"
              v-if="task.done === false"
            ></font-awesome-icon>
            <span> {{ task.name }}</span>
            <span @click.prevent="deleteTask(task)">
              <font-awesome-icon
                icon="trash"
                class="text-black float-right"
              ></font-awesome-icon>
            </span>
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
import gql from "graphql-tag";
export default {
  name: "ListShow",
  props: ["listId"],
  data() {
    return {
      list: {},
      tasks: [],
      name: "",
    };
  },
  apollo: {},
  methods: {
    async getList() {
      return await this.$apollo.query({
        query: require("@/graphql/queries/showList.gql"),
        variables: {
          id: this.$route.params.listId,
        },
        fetchPolicy: "network-only",
      });
    },
    async loadList() {
      const result = await this.getList();
      if (!!result.data) {
        this.list = result.data.showList;
        this.tasks = result.data.showList.tasks;
      }
    },
    async changeStatus(task) {
      const result = await this.$apollo.mutate({
        mutation: require("@/graphql/mutations/changeTaskStatus.gql"),
        variables: {
          id: task.id,
        },
      });
      if (!!result.data) {
        await this.loadList();
      }
    },
    async deleteTask(task) {
      const result = await this.$apollo.mutate({
        mutation: require("@/graphql/mutations/deleteTask.gql"),
        variables: {
          id: task.id,
        },
      });
      if (!!result.data) {
        await this.loadList();
      }
    },
    taskAdded() {
      this.name = "";
      this.loadList();
    },
  },
  async mounted() {
    await this.loadList();
  },
};
</script>
