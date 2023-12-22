<template>
    <div>
        <div align="right" style="margin:10px">
            <button type="button" class="btn btn-outline-info btn-sm" @click='writeContent()'>Write</button>&nbsp;
        </div>
        <table class="table">
        <thead>
            <tr>
            <th scope="col">#</th>
            <th scope="col">Title</th>
            <th scope="col">Writer</th>
            <th scope="col">Last Modified</th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="item in contents" v-bind:key="item.id" @click='toDetail(item.id)'>
                <th scope="row">{{item.id}}</th>
                <td >{{item.title}}</td>
                <td>{{item.name}}</td>
                <td>{{ formatDate(item.updatedAt)}}</td>
            </tr>
        </tbody>
        </table>
    </div>
</template>
<script>
export default {
    data() {
        return {
            contents: null
        }     
    },
    methods: {
        toDetail(contentId){
            this.$router.push({
                name: "boardDetail",
                query: {id : contentId}
            });
        },
        writeContent(){
            this.$router.push({
                name: "boardEdit"
            });
        },
        formatDate(str){
            return str.split('T')[0];
        },
        fetchData(){
            this.$axios.get('/contents')
            .then(res => {
                console.log(res.data);
                this.contents = res.data.data;
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