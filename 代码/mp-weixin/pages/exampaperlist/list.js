(global["webpackJsonp"]=global["webpackJsonp"]||[]).push([["pages/exampaperlist/list"],{"04cb":function(t,e,n){"use strict";var i=n("7e42"),r=n.n(i);r.a},2260:function(t,e,n){"use strict";(function(t){n("0624"),n("921b");i(n("66fd"));var e=i(n("75ff"));function i(t){return t&&t.__esModule?t:{default:t}}t(e.default)}).call(this,n("543d")["createPage"])},"4b2f":function(t,e,n){"use strict";var i={"mescroll-uni":function(){return Promise.all([n.e("common/vendor"),n.e("components/mescroll-uni/mescroll-uni")]).then(n.bind(null,"49a7"))}},r=function(){var t=this,e=t.$createElement;t._self._c},s=[];n.d(e,"b",(function(){return r})),n.d(e,"c",(function(){return s})),n.d(e,"a",(function(){return i}))},"75ff":function(t,e,n){"use strict";n.r(e);var i=n("4b2f"),r=n("deb3");for(var s in r)"default"!==s&&function(t){n.d(e,t,(function(){return r[t]}))}(s);n("04cb");var a,u=n("f0c5"),c=Object(u["a"])(r["default"],i["b"],i["c"],!1,null,null,null,!1,i["a"],a);e["default"]=c.exports},"7e42":function(t,e,n){},"884a":function(t,e,n){"use strict";Object.defineProperty(e,"__esModule",{value:!0}),e.default=void 0;var i=r(n("a34a"));function r(t){return t&&t.__esModule?t:{default:t}}function s(t,e,n,i,r,s,a){try{var u=t[s](a),c=u.value}catch(o){return void n(o)}u.done?e(c):Promise.resolve(c).then(i,r)}function a(t){return function(){var e=this,n=arguments;return new Promise((function(i,r){var a=t.apply(e,n);function u(t){s(a,i,r,u,c,"next",t)}function c(t){s(a,i,r,u,c,"throw",t)}u(void 0)}))}}var u={data:function(){return{list:[],mescroll:null,downOption:{auto:!1},upOption:{noMoreSize:5,textNoMore:"~ 没有更多了 ~"},hasNext:!0,searchForm:{},CustomBar:"0",userid:""}},onLoad:function(t){this.userid=t.userid,this.hasNext=!0,this.mescroll&&this.mescroll.resetUpScroll()},methods:{mescrollInit:function(t){this.mescroll=t},downCallback:function(t){this.hasNext=!0,t.resetUpScroll()},upCallback:function(){var t=a(i.default.mark((function t(e){var n;return i.default.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return t.next=2,this.$api.list("exampaper",{page:e.num,limit:e.size});case 2:n=t.sent,1==e.num&&(this.list=[]),this.list=this.list.concat(n.data.list),0==n.data.list.length&&(this.hasNext=!1),e.endSuccess(e.size,this.hasNext);case 7:case"end":return t.stop()}}),t,this)})));function e(e){return t.apply(this,arguments)}return e}(),onDetailTap:function(){var t=a(i.default.mark((function t(e){return i.default.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return t.next=2,this.$api.deleteRecords(this.userid,e);case 2:this.$utils.jump("./exam?id=".concat(e));case 3:case"end":return t.stop()}}),t,this)})));function e(e){return t.apply(this,arguments)}return e}(),search:function(){var t=a(i.default.mark((function t(){var e,n;return i.default.wrap((function(t){while(1)switch(t.prev=t.next){case 0:return this.mescroll.num=1,e={page:this.mescroll.num,limit:this.mescroll.size},t.next=4,this.$api.list("exampaper",e);case 4:n=t.sent,1==this.mescroll.num&&(this.list=[]),this.list=this.list.concat(n.data.list),0==n.data.list.length&&(this.hasNext=!1),this.mescroll.endSuccess(this.mescroll.size,this.hasNext);case 9:case"end":return t.stop()}}),t,this)})));function e(){return t.apply(this,arguments)}return e}()}};e.default=u},deb3:function(t,e,n){"use strict";n.r(e);var i=n("884a"),r=n.n(i);for(var s in i)"default"!==s&&function(t){n.d(e,t,(function(){return i[t]}))}(s);e["default"]=r.a}},[["2260","common/runtime","common/vendor"]]]);