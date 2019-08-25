<template>
  <v-layout wrap>
    <v-flex
      xs12
      class="mb-3"
    >
      <v-sheet height="500">
        <v-calendar
          ref="calendar"
          :type="type"
          v-model="start"        
          color="primary"
          @click:date="registEvent()"
        >
          <template v-slot:day="{ date }" >
            <template v-for="event in eventsMap[date]">
              <v-menu
                :key="event.title"
                v-model="event.open"
                full-width
                offset-x
              >
                <template v-slot:activator="{ on }">
                  <div
                    v-if="!event.time"
                    v-ripple
                    class="my-event"
                    v-on="on"
                    v-html="event.title"
                  ></div>
                </template>
                <v-card
                  color="grey lighten-4"
                  min-width="350px"
                  flat
                >
                  <v-toolbar
                    color="primary"
                    dark
                  >
                    <v-btn icon>
                      <v-icon>edit</v-icon>
                    </v-btn>
                    <v-toolbar-title v-html="event.title"></v-toolbar-title>
                    <v-spacer></v-spacer>
                    <v-btn icon>
                      <v-icon>favorite</v-icon>
                    </v-btn>
                    <v-btn icon>
                      <v-icon>more_vert</v-icon>
                    </v-btn>
                  </v-toolbar>
                  <v-card-title primary-title>
                    <span v-html="event.details"></span>
                  </v-card-title>
                  <v-card-actions>
                    <v-btn
                      flat
                      color="secondary"
                    >
                      Cancel
                    </v-btn>
                  </v-card-actions>
                </v-card>
              </v-menu>
            </template>
          </template>
        </v-calendar>
      </v-sheet>
      <regist-menu ref="childDialogue" @input="onInputChild"></regist-menu>
    </v-flex>

    <v-flex
      sm4
      xs12
      class="text-sm-left text-xs-center"
    >
      <v-btn @click="$refs.calendar.prev()">
        <v-icon
          dark
          left
        >
          keyboard_arrow_left
        </v-icon>
        Prev
      </v-btn>
    </v-flex>
    <v-flex
      sm4
      xs12
      class="text-sm-right text-xs-center"
    >
      <v-btn @click="$refs.calendar.next()">
        Next
        <v-icon
          right
          dark
        >
          keyboard_arrow_right
        </v-icon>
      </v-btn>
    </v-flex>
  </v-layout>
</template>

<script>
import registMenu from '@/components/RegistMenu.vue'
import axios from 'axios'
  export default {
    components:{
      registMenu
    },
    data: () => ({
      type: 'month',
      start: '',
      events: []
    }),
    methods: {
      open (event) {
        //console.log(event)
        //alert(event.title)
      },
      registEvent () {
        this.$refs.childDialogue.open()
      },
      onInputChild (newEvent) {
        newEvent.date = this.start
        this.events.push(newEvent)
        console.log(this.events)
      },
      getEvents () {
        let self = this
        axios.get('/todo').then(function(response){
          self.events = response.data.data
          console.log(response.data.data)
        })
      }
    },
    computed: {
      // convert the list of events into a map of lists keyed by date
      eventsMap () {
        const map = {}
        this.events.forEach(e => (map[e.date] = map[e.date] || []).push(e))
        return map
      }
    },
    mounted () {
      this.getEvents()
    }
  }
</script>
<style>
  .my-event {
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    border-radius: 2px;
    background-color: #1867c0;
    color: #ffffff;
    border: 1px solid #1867c0;
    width: 100%;
    font-size: 12px;
    padding: 3px;
    cursor: pointer;
    margin-bottom: 1px;
  }
</style>

