<template>
    <div style ="margin:30px">
        <div align="right">
            <button type="button" class="btn btn-outline-info btn-sm" @click='modifyContent()'>Modify</button>&nbsp;
            <button type="button" class="btn btn-outline-danger btn-sm" @click='deleteContent()'>Delete</button>&nbsp;
            <button type="button" class="btn btn-outline-secondary btn-sm" @click='toBack()' >Back</button> 
        </div>
        <div class="mb-3 row" align="left">
            <label for="staticEmail" class="col-sm-2 col-form-label">Name</label>
            <div class="col-sm-10">
            <input type="text" readonly class="form-control-plaintext"  v-if="content.name"  v-model="content.name">
            </div>
        </div>
        <div class="mb-3 row" align="left">
            <label for="staticEmail" class="col-sm-2 col-form-label">Title</label>
            <div class="col-sm-10">
            <input type="text" readonly class="form-control-plaintext" v-if="content.title" v-model="content.title">
            </div>
        </div>
        <div class="mb-3 row" align="left">
            <label for="staticEmail" class="col-sm-2 col-form-label">Content</label>
            <div class="col-sm-10">
            <input type="text" readonly class="form-control-plaintext" v-if="content.content"  v-model="content.content">
            </div>
        </div>
        <div class="mb-3 row" align="left">
            <label for="staticEmail" class="col-sm-2 col-form-label">Last Modified</label>
            <div class="col-sm-10">
            <input type="text" readonly class="form-control-plaintext" v-if="content.updatedAt"  v-bind:value="formatDate(content.updatedAt)">
            </div>
        </div>
    </div>  
</template>
<script>
export default {
    name: 'boardDetail',
    data() {
        return {
            content: null
        }  
    },
    methods: {
        modifyContent(){
            this.$router.push({
                name: "boardEdit",
                query: {id: this.content.id
                      , title: this.content.title
                      , name: this.content.name
                      , content:this.content.content 
                    }
            });
        }, 
        deleteContent(){
            this.$axios.delete('/contents/' + this.$route.query.id)
            .then(res => {
                this.$router.push({
                    name: "board"
                });
            })
            .catch(function(error){
                console.log(error);
            });
        },
        toBack(){
             this.$router.push({
                name: "board"
            });
        },
        formatDate(str){
            return str.split('T')[0] + " " +str.split('T')[1];
        },
        fetchData(){
            this.$axios.get('/contents/' + this.$route.query.id)
            .then(res => {
                console.log(res.data);
                this.content = res.data.data;
            })
            .catch(function(error){
                console.log(error);
            });
        }
    },
    created() {
        this.fetchData();
    } 
}
</script>