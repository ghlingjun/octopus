var FormValidate = {
    fn: {
        extend: function () {
            /**
             * 身份证前端验证规则（）
             */
            /*var isIdCardNo = function (num) {
                //if (isNaN(num)) {alert("输入的不是数字！"); return false;}
                var len = num.length, re;
                if (len == 15)
                    re = new RegExp(/^(\d{6})()?(\d{2})(\d{2})(\d{2})(\d{2})(\w)$/);
                else if (len == 18)
                    re = new RegExp(/^(\d{6})()?(\d{4})(\d{2})(\d{2})(\d{3})(\w)$/);
                else {
                    //alert("输入的数字位数不对。");
                    return false;
                }
                var a = num.match(re);
                if (a != null) {
                    if (len == 15) {
                        var D = new Date("19" + a[3] + "/" + a[4] + "/" + a[5]);
                        var B = D.getYear() == a[3] && (D.getMonth() + 1) == a[4] && D.getDate() == a[5];
                    }
                    else {
                        var D = new Date(a[3] + "/" + a[4] + "/" + a[5]);
                        var B = D.getFullYear() == a[3] && (D.getMonth() + 1) == a[4] && D.getDate() == a[5];
                    }
                    if (!B) {
                        //alert("输入的身份证号 "+ a[0] +" 里出生日期不对。");
                        return false;
                    }
                }
                if (!re.test(num)) {
                    //alert("身份证最后一位只能是数字和字母。");
                    return false;
                }
                return true;
            }*/
            /**
             * 手机号前端验证规则
             */
            $.validator.addMethod("isMobile", function (value, element) {
                //var tel = /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/;
                var tel = /^1[3|4|5|7|8][0-9]{9}$/
                console.log(tel.test(value));
                return this.optional(element) || (tel.test(value));
            }, "请正确填写手机号码");
            /**
             * 邮箱前端验证规则
             */
            $.validator.addMethod("isEmail", function (value, element) {
                var tel = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(([-.][a-zA-Z0-9_-]{2,4}){1,2})$/ ;
                // var tel = /^[A-Za-zd]+([-_.][A-Za-zd]+)*@([A-Za-zd]+[-.])+[A-Za-zd]{2,5}$/ ;
                console.log(tel.test(value));
                return this.optional(element) || (tel.test(value));
            }, "请正确填写邮箱");
            /**
             * 姓名前端验证规则（只匹配汉字）
             */
            $.validator.addMethod("isPersonName", function (value, element) {
                var tel = /^[a-zA-Z\.\u4e00-\u9fa5]{2,20}$/;
                console.log(tel.test(value));
                return this.optional(element) || (tel.test(value));
            }, "请正确填写姓名");

            $.validator.addMethod("isIdCard", function (value, element) {
                var tel = /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$|^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/
                console.log(tel.test(value));
                return this.optional(element) || (tel.test(value));
                // return this.optional(element) || isIdCardNo(value);
            }, "请正确填写身份证号");

            /**
             * 公司名称前端验证规则（只匹配汉字）
             */
            $.validator.addMethod("enterpriseName", function (value, element) {
                // var tel = /^[\u4e00-\u9fa5]+$/;
                var tel = /^[a-zA-Z0-9\u4e00-\u9fa5]+$/;
                console.log(tel.test(value));
                return this.optional(element) || (tel.test(value));
            }, "请正确填写公司名称");

            /**
             * 统一社会信用代码验证
             * 只可输入18位纯数字或者大写英文
             * 或者15位纯数字的注册号
             */
            $.validator.addMethod("corpNo", function (value, element) {
                // var tel = /[1-9A-GY]{1}[1239]{1}[1-5]{1}[0-9]{5}[0-9A-Z]{10}/;
                // var tel = /^([0-9]{15}|[0-9A-Z]{18})+$/;
                var tel = /^[0-9A-Z]{18}$/;
                console.log(tel.test(value));
                return this.optional(element) || (tel.test(value));
            }, "请正确填写统一社会信用代码");

            /**
             * 法人姓名验证（只匹配汉字，字母）
             */
            $.validator.addMethod("legalName", function (value, element) {
                var tel = /^([A-Za-z]|[\u4E00-\u9FA5])+$/;
                console.log(tel.test(value));
                return this.optional(element) || (tel.test(value));
            }, "请正确填写法人姓名");

            /**
             * 联系电话的正则验证（）
             */
            $.validator.addMethod("telephone", function (value, element) {
                var tel = /^(([0\+]\d{2,3}-)?(0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;
                console.log(tel.test(value));
                return this.optional(element) || (tel.test(value));
            }, "请正确填写电话号码");

            /**
             * 公司地址前端验证规则（只匹配汉字,数字）
             */
            $.validator.addMethod("corpAdd", function (value, element) {
                var tel = /^([0-9A-Za-z\-]|[\u4E00-\u9FA5\-])+$/;
                console.log(tel.test(value));
                return this.optional(element) || (tel.test(value));
            }, "请正确填写公司地址");

            /**
             * 所属母公司前端验证规则（只匹配汉字,数字）
             */
            $.validator.addMethod("subsidiary", function (value, element) {
                var tel = /^([0-9A-Za-z]|[\u4E00-\u9FA5])+$/;
                console.log(tel.test(value));
                return this.optional(element) || (tel.test(value));
            }, "请正确填写母公司名称");

            /**
             * 验证是否数字（有小数的正实数）
             */
            $.validator.addMethod("isFloat", function (value, element) {
                var tel = /^[0-9]+(.[0-9]{1,4})?$/;
                console.log(tel.test(value));
                return this.optional(element) || (tel.test(value));
            }, "请正确填写数字");

            /**
             * 验证是否整数
             */
            $.validator.addMethod("isNum", function (value, element) {
                var tel = /^[0-9]*$/;
                console.log(tel.test(value));
                return this.optional(element) || (tel.test(value));
            }, "请正确填写整数");

        },

    }
}
FormValidate.fn.extend();
