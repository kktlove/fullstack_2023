import Vue from "vue";
import VueRouter from "vue-router";
import Home from "./views/Home";
import Board from "./views/Board";
import BoardDetail from "./views/BoardDetail"
import BoardEdit from "./views/BoardEdit"

Vue.use(VueRouter);

const router = new VueRouter({
    mode: "history",
    routes: [
        {path: "/", name: 'home', component: Home},
        {path: "/board", name: 'board', component: Board},
        {path: "/board/detail", name: 'boardDetail', component: BoardDetail},
        {path: "/board/edit", name: 'boardEdit', component: BoardEdit}
    ],
    linkActiveClass: "active",
    linkExactActiveClass: "exact-active",
});

export default router;