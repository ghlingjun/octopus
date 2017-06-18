<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/x-template" id="page">
    <ul class="pagination">
        <li v-show="pageIndex >1">
            <a @click="goto(1)" href="javascript:void(0)">首页</a>
        </li>
        <li v-show="pageIndex >1" >
            <a @click="goto(--pageIndex)" href="javascript:void(0)">上一页</a>
        </li>
        <li v-show="pageIndex<=1" class="disabled"><a>上一页</a></li>
        <li v-for="index in pages"  :class="{'active':pageIndex == index}" :key="index">
            <a @click="goto(index)" href="javascript:void(0)" >{{index}}</a>
        </li>
        <li v-show="totalPage != pageIndex && totalPage != 0 " >
            <a @click="goto(++pageIndex)" href="javascript:void(0)" >下一页</a>
        </li>
        <li v-show="totalPage == pageIndex || totalPage ==0 " class="disabled">
            <a>下一页</a>
        </li>
        <li class="disabled">
            <a>共<i style="font-style: normal">{{ totalPage }}</i>页</a>
        </li>
    </ul>
</script>
<script type="text/javascript">
    var pagination = {
        params:{
            pageIndex:0,
            pageSize:10
        },
        /*vm:{},*/
        fn:{
            init:function (res,fn) {
                 Vue.component("page",{
                    template:"#page",
                    props:['pageIndexP','totalPageP','pageSizeP'],
                    data: function () {
                        return {
                            pageIndex: this.pageIndexP,
                            totalPage: this.totalPageP,
                            pageSize: this.pageSizeP
                        }
                    },
                    computed:{
                        pages:function(){
                            //父子组件绑定，子组件跟着父组件改变
                            this.pageIndex=this.pageIndexP;
                            var pag = [];
                            var left = 1;
                            var right = this.totalPage;
                            if (this.totalPage >= 7) {
                                if (this.pageIndex > 5 && this.pageIndex < this.totalPage - 4) {
                                    left = this.pageIndex - 3;
                                    right = this.pageIndex + 3;
                                } else {
                                    if (this.pageIndex <= 5) {
                                        left = 1;
                                        right = 7;
                                    } else {
                                        right = this.totalPage;
                                        left = this.totalPage - 6;
                                    }
                                }
                            }
                            while (left <= right) {
                                pag.push(left);
                                left++;
                            }
                            return pag;
                        }
                    },
                    methods:{
                        goto:function(index){
                            //子组件回传数据到父组件
                            this.$emit('upup',index);
                           // if(index == pagination.params.pageIndex+1) {return};
                            this.pageIndex = index;
                            pagination.params.pageIndex= index-1;

                            //判断函数类型
                            if (fn && typeof fn === 'function') {
                                fn();
                            }
                            return;
                        }
                    }
                });

                 if(pagination.total){
                     pagination.total=res.total;
                     pagination.params.pageIndex=0;
                     vm.totalPage1 = Math.ceil(pagination.total / pagination.params.pageSize);
                     return;
                 }
                pagination.total = res.total;
                var pageNavSize = Math.ceil(pagination.total / pagination.params.pageSize);
                vm = new Vue({
                    el:'#pagination',
                    data:{
                        totalPage1:pageNavSize,
                        pageIndex1:pagination.params.pageIndex+1,
                        pageSize1:pagination.params.pageSize,
                        index:''
                    },
                    methods:{
                        change:function(index){
                            this.pageIndex1 = index;
                        }
                    }
                });

            }
        }

    }

</script>