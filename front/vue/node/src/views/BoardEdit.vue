<template>
    <div style ="margin:30px">
        <div align="right">
            <button type="button" class="btn btn-outline-info btn-sm" @click='confirmWrite()'>Confirm</button>&nbsp;
            <button type="button" class="btn btn-outline-secondary btn-sm" @click='cancelWrite()' >Cancel</button> 
        </div>
         <div class="mb-3" align="left">
            <label for="exampleFormControlInput1" class="form-label">Name</label>
            <input type="email" class="form-control" id="exampleFormControlInput1" :disabled="this.editMode" v-model="name" >
        </div>
        <div class="mb-3" align="left">
            <label for="exampleFormControlInput1" class="form-label">Title</label>
            <input type="email" class="form-control" id="exampleFormControlInput1" v-model= "title">
        </div>
        <div class="mb-3" align="left">
            <label for="exampleFormControlTextarea1" class="form-label">Content</label>
            <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" v-model= "content"></textarea>
        </div> 
    </div>
</template>
<script>
export default {
    name: 'boardEdit',
    data() {
        return {
            name: null,
            title: null,
            content: null
        }  
    },
    methods: {
        cancelWrite(){
             this.$router.push({
                name: "board"
            });
        },
        confirmWrite(){

            
            if(this.editMode){
                this.$axios.put('/contents/'+this.$route.query.id, {
                    name: this.name,
                    title: this.title,
                    content: this.content
                }).then(res => {
                    this.$router.push({
                        name: "board"
                    });
                }).catch(function(error){
                    console.log(error);
                });
            } else {
                this.$axios.post('/contents', {
                    name: this.name,
                    title: this.title,
                    content: this.content
                }).then(res => {
                    this.$router.push({
                        name: "board"
                    });
                }).catch(function(error){
                    console.log(error);
                });
            }
            
        }
    }, 
    created(){
        this.editMode = this.$route.query.id ? true: false;       
        if(this.editMode){
            this.name = this.$route.query.name;
            this.title = this.$route.query.title;
            this.content = this.$route.query.content; 
        }  
    }
}
</script>