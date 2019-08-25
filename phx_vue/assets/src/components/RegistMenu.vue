<template :ref="daialogue">
    <div>
      <v-dialog
          v-model="dialog"
          width="500"
      >
        <v-card>
            <v-card-title
              class="headline grey lighten-2"
              primary-title
            >
              予定の登録
            </v-card-title>
            <v-card-text>
              <v-container grid-list-md>
                <v-layout wrap>
                  <v-flex xs12 sm6 md4>
                    <v-text-field label="タイトル" v-model="event.title" required></v-text-field>
                  </v-flex>
                  <v-flex xs12>
                    <v-text-field label="開始時刻" type="time" v-model="event.start"></v-text-field>
                  </v-flex>
                  <v-flex xs12>
                    <v-text-field label=" 終了時刻" type="time" v-model="event.end"></v-text-field>
                  </v-flex>
                  <v-flex xs12>
                    <v-text-field label="詳細" v-model="event.details"></v-text-field>
                  </v-flex>
                </v-layout>
              </v-container>
            </v-card-text>
            <v-divider></v-divider>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn
                color="primary"
                flat
                @click="close"
              >
                キャンセル
              </v-btn>
              <v-btn
                color="primary"
                flat
                @click="onChangeInput()"
              >
                登録
              </v-btn>
            </v-card-actions>
        </v-card>
      </v-dialog>
    </div>        
</template>
<script scoped>
export default {
  data: ()=>({
    dialog: false,
    event: {
      title: '',
      details: '',
      date: '',
      start: '',
      end: ''
    },
  }),
  methods: {
    open(){
      this.dialog = true
    },
    close(){
      this.dialog = false
    },
    onChangeInput() {
      this.commitChange(this.event)
    },
    commitChange(newValue) {
      //console.log(newValue)
      this.$emit('input', newValue)
      this.close()
    }
  }
}
</script>
