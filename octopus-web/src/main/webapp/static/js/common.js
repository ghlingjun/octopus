/**
 * 通用组件
 * @type {{fn: {}}}
 */
var Common = {
    /**
     * 附件类型常量
     */
    FileType: {
        // 默认类型
        Default: 0,
        // 身份证附件类型
        IdCard: 1,
        // 户口本附件类型
        HouseholdRegister: 2,
        // 营业执照、开户许可证附件类型
        BusinessLicense: 3,
        // 公司章程及修正案文件类型
        ArticlesOfAssociation: 4,
        // 个人及家庭外部借款明细
        ExternalBorrowingDetails: 5,
        // 最近2年财务报表
        FinancialReport: 6,
        // 企业三证/三证合一
        EnterpriseCertificates: 7,
        // 股东及法定代表人身份证、户口本
        ShareholderIDCard: 8,
        // 家属身份证
        FamilyMembersIDCard: 9,
        // 主要旅游产品、线路
        MainTouristProduct: 10,
        // 与凤凰旅游合作相关数据
        CooperativeData: 11,
        // 个人及家庭房产证、车辆登记证书、股权证明等
        AssetCertificate: 12,
        // 验资报告
        CapitalVerificationReport: 13,
        // 企业、股东、法人代表和家属银行征信报告
        EnterpriseCreditReportUploader: 14,
        // 公司和个人主要银行流水
        BankJournalUploader: 15,
        //放款凭证
        LoanCertificate:16
    },
    fn: {
        /**
         * 显示编辑块方法
         * @param divId 编辑块的ID
         */
        showChange: function (divId) {
            var id = '#' + divId.id.replace(/Change/g, "View") + 'Div';
            $(id).addClass('hide');
            var id2 = '#' + divId.id + 'Div';
            $(id2).removeClass('hide');
        },
        /**
         * 编辑块返回显示块方法
         * @param divId  编辑块的ID
         */
        showView: function (divId) {

            var id = '#' + divId.id.replace(/View/g, "Change") + 'Div';
            $(id).addClass('hide');
            var id2 = '#' + divId.id + 'Div';
            $(id2).removeClass('hide');
        },
        /**
         * 输入框验证
         */
        validate: function () {
            $("form.validate").each(function (i, el) {
                var $this = $(el),
                    opts = {
                        rules: {},
                        messages: {},
                        errorElement: 'span',
                        errorClass: 'validate-has-error',
                        highlight: function (element) {
                            $(element).closest('.form-group').addClass('validate-has-error');
                        },
                        unhighlight: function (element) {
                            $(element).closest('.form-group').removeClass('validate-has-error');
                        },
                        errorPlacement: function (error, element) {
                            if (element.closest('.has-switch').length) {
                                error.insertAfter(element.closest('.has-switch'));
                            }
                            else if (element.parent('.checkbox, .radio').length || element.parent('.input-group').length) {
                                error.insertAfter(element.parent());
                            }
                            else {
                                error.insertAfter(element);
                            }
                        }
                    },
                    $fields = $this.find('[data-validate]');


                $fields.each(function (j, el2) {
                    var $field = $(el2),
                        name = $field.attr('name'),
                        validate = attrDefault($field, 'validate', '').toString(),
                        _validate = validate.split(',');

                    for (var k in _validate) {
                        var rule = _validate[k],
                            params,
                            message;

                        if (typeof opts['rules'][name] == 'undefined') {
                            opts['rules'][name] = {};
                            opts['messages'][name] = {};
                        }

                        if ($.inArray(rule, ['telephone', 'legalName', 'isEmail', 'isFloat', 'corpNo', 'enterpriseName', 'required', 'url', 'email', 'isMobile', 'number', 'date', 'creditcard', 'isPersonName', 'isIdCard','corpAdd','subsidiary','isNum']) != -1) {

                            opts['rules'][name][rule] = true;

                            message = $field.data('message-' + rule);

                            if (message) {
                                opts['messages'][name][rule] = message;
                            }
                        }
                        // Parameter Value (#1 parameter)
                        else if (params = rule.match(/(\w+)\[(.*?)\]/i)) {
                            if ($.inArray(params[1], ['min', 'max', 'minlength', 'maxlength', 'equalTo']) != -1) {
                                opts['rules'][name][params[1]] = params[2];


                                message = $field.data('message-' + params[1]);

                                if (message) {
                                    opts['messages'][name][params[1]] = message;
                                }
                            }
                        }
                    }
                });
                $this.validate(opts);
            });
        },
        /**
         *
         * @param url 预览附件图片的url地址
         */
        viewImgFile: function (url) {
            var current = 0;
            $('#imgFile').attr('src', url);
            $('#modal-1').removeClass('hide');
            console.log(456);
            $('#imgFile').click(function () {
                current = (current + 90) % 360;
                console.log(234);
                this.style.transform = 'rotate(' + current + 'deg)';
            });
        },
        /**
         * 关闭预览图片
         */
        hideImgFile: function () {
            $('#modal-1').addClass('hide');
        },
        /**
         * 页面跳转
         * @param url 跳转URL
         */
        redirectToUrl: function (url) {
            window.location.href = url;
        },
        loading: {
            show: function () {
                $("#loadingDiv").css({'opacity':0.1,'visibility':'visible'});
            },
            hide: function () {
                $("#loadingDiv").css({'opacity':0,'visibility':'hidden'});
            }
        },
       /* /!**
         * 消除多层弹框的影响
         *!/
        avoidModalBug:function(){
            $(document).on('show.bs.modal', '.modal', function (event) {
                console.log( $('.modal.fade.in').length);
                var zIndex = 1040 + (10 * $('.modal:visible').length)+1;
                $(this).css('z-index', zIndex);
                $('.modal-backdrop.fade').css('z-index',zIndex-1);
                console.log(zIndex);
                $('.modal.fade.in').length == 0&&$('body').css('overflow-y','hidden');
            });
            $(document).on('hidden.bs.modal', '.modal', function (event) {
                $('.modal.fade.in').length == 0&&$('body').css('overflow-y','auto');
                var zIndex = 1040 - (10 * $('.modal:visible').length)-1;
                $('.modal-backdrop.fade.in').css('z-index',zIndex-1);
                console.log(zIndex);
            });
        }*/
    },
    /**
     * 上传组件
     */
    uploader: {
        /**
         * 初始化上传组件
         * @param module 上传文件模块名【字符串】
         * @param clazz 上传文件所属类名【字符串】
         * @param type 上传文件类型【数字类型】
         * @param id 【渲染的div的ID】
         * @param filters 上传过滤器
         * @param fn 回调函数
         * @returns {jQuery} pluploader对象
         */
        init: function (module, clazz, divId, filter, type, fn) {
            var uploader = new plupload.Uploader({
                runtimes: 'html5,flash,silverlight,html4',
                browse_button: divId + "Slt", // you can pass an id...
                container: document.getElementById(divId), // ... or DOM Element itself
                url: rootPath + '/file/upload',
                flash_swf_url: '../js/Moxie.swf',
                silverlight_xap_url: '../js/Moxie.xap',
                filters: filter,
                init: {
                    PostInit: function () {
                        document.getElementById(divId + 'Filelist').innerHTML = '';
                    },

                    FilesAdded: function (up, files) {
                        plupload.each(files, function (file) {
                            document.getElementById(divId + 'Filelist').innerHTML += '<div class="well well-sm" id="' + file.id + '">' + '<span>' + file.name + '</span>' + ' (' + plupload.formatSize(file.size) + ')' +
                                /*'<a href="#" class="pull-right">删除</a>' +*/
                                // '<a href="#" class="pull-right">预览</a>' +
                                '<b class="pull-right"></b>' +
                                '</div>';
                        });
                        uploader.start();
                    },

                    UploadProgress: function (up, file) {
                        document.getElementById(file.id).getElementsByTagName('b')[0].innerHTML = '<span>上传进度：' + file.percent + "%</span>";
                    },

                    Error: function (up, err) {
                        document.getElementById('console').appendChild(document.createTextNode("\nError #" + err.code + ": " + err.message));
                    },
                    FileUploaded: function (up, file, info) {
                        var res = jQuery.parseJSON(info.response);
                        var att = res.data;
                        for (var x in att) {
                            var ids = $("#" + divId + "Ids");
                            if (ids.val() && ids.val().length > 0) {
                                if (ids.val().indexOf(att.id) >= 0) {
                                    continue;
                                }
                                ids.val(ids.val() + att.id + ",");
                            } else {
                                ids.val(att.id + ",");
                            }
                            console.log(ids.val());
                        }
                    }
                },
                multipart_params: {'clazz': clazz, 'module': module, 'type': type}

            });
            /*绑定上传按钮事件*/
            /*$("#" + divId + "Btn").on('click', function () {
                uploader.start();
            })*/
            uploader.init();
            return uploader;
        },
        filters: {
            /**
             * 图片过滤器
             */
            img: {
                max_file_size: '10mb',
                mime_types: [
                    {title: "Image files", extensions: "jpg"}
                ]
            },
            file:{
                max_file_size: '10mb'
               /* mime_types: [
                    {}
                ]*/
            }
        }
    },
    /**
     * 重写ajax POST请求方法
     * @param url 请求地址
     * @param data 请求数据
     * @param fn 回调函数
     */
    ajax: {
        post: function (url, data, fn) {
            this.request('post', url, data, fn);
        },
        /**
         * 重写ajax delete请求方法
         * @param url 请求地址
         * @param data 请求数据
         * @param fn 回调函数
         */
        get: function (url, data, fn) {
            this.request('get', url, data, fn);
        },
        /**
         * 自定义Ajax请求方法
         * @param type
         * @param url
         * @param data
         * @param fn
         */
        request: function (type, url, data, fn) {
            Common.fn.loading.show();
            $.ajax({
                type: type,
                url: url,
                data: data,
                dataType: 'json',
                success: function (res) {
                    Common.fn.loading.hide();
                    if (res.status < 1) {
                        Common.msg.error(res.desc, "错误信息")
                        return;
                    }
                    //判断函数类型
                    if (fn && typeof fn === 'function') {
                        fn(res.data);
                    }
                },
                error: function () {
                    Common.fn.loading.hide();
                    Common.msg.warning('登录超时请重新登录', "登录超时")
                    window.location.reload();
                }
            });
        }
    },
    /**
     * 图表组件
     */
    charts: {
        pie: {
            /**
             * echart饼图控件
             * @param id 需要渲染的divId
             * @param data 需要填充的数据
             * @param title 标题
             */
            init: function (id, data, title, color) {
                var pie = echarts.init(document.getElementById(id));
                pie.setOption({
                    tooltip: {
                        trigger: 'item',
                        formatter: "{a} <br/>{b}: {c} ({d}%)"
                    },
                    series: [
                        {
                            name: title,
                            type: 'pie',
                            /*radius: ['55%', '80%'],*/
                            avoidLabelOverlap: false,
                            label: {
                                normal: {
                                    show: false,
                                    position: 'center'
                                },
                                emphasis: {
                                    show: true,
                                    textStyle: {
                                        fontSize: '14',
                                        fontWeight: 'bold'
                                    }
                                }
                            },
                            labelLine: {
                                normal: {
                                    show: false
                                }
                            },
                            data: data
                        }
                    ]
                });
                if (color) {
                    pie.setOption(color);
                }
                return pie;
            }
        },
        line: {
            init: function (id, amountData, title, color,timeData,name,seriesName) {
                var line = echarts.init(document.getElementById(id));
                line.setOption(
                    {
                        tooltip: {
                            trigger: 'none',
                            axisPointer: {
                                type: 'cross'
                            }
                        },
                        legend: {
                            data: title
                        },
                        grid: {
                            top: 70,
                            bottom: 50
                        },
                        color:color,
                        xAxis: [
                            {
                                type: 'category',
                               /* boundaryGap: true,*/
                                data: timeData,
                                axisLabel:{
                                   /* interval:0,
                                    rotate:45*/
                                },
                                axisTick:{
                                    show:false
                                }
                            }
                        ],
                        yAxis: [
                            {
                                type:'value',
                                name:name,
                                nameLocation:'end'
                                /*splitNumber:8*/,
                                axisLine:{
                                    show:false
                                },
                                axisTick:{
                                    show:false
                                }
                            }
                        ],
                        series: [
                            {
                                name: seriesName,
                                itemStyle : { normal: {label : {show: true}}},
                                type: 'line',
                                symbol:'roundRect',
                                data: amountData,
                                areaStyle:{
                                    normal:{
                                        color: {
                                            type: 'linear',
                                            x: 0,
                                            y: 0,
                                            x2: 0,
                                            y2: 1,
                                            colorStops: [{
                                                offset: 0, color: '#B7D189' // 0% 处的颜色
                                            }, {
                                                offset: 1, color: '#FFF' // 100% 处的颜色
                                            }],
                                            globalCoord: false // 缺省为 false
                                        }
                                    }
                                }
                            }
                        ]
                    }
                )
            }
        }
    },
    /**
     * 弹窗组件
     */
    msg: {
        info: function (msg) {
            toastr.info(msg);
        },
        warning: function (msg) {
            toastr.warning(msg)
        },
        success: function (msg) {
            var opts = {
                "closeButton": true,
                "debug": false,
                "positionClass": "toast-bottom-right",
                "onclick": null,
                "showDuration": "300",
                "hideDuration": "1000",
                "timeOut": "5000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            };
            toastr.success(msg, "成功提示", opts);
        },
        error: function (msg, title) {
            var opts = {
                "closeButton": true,
                "debug": false,
                "positionClass": "toast-top-full-width",
                "onclick": null,
                "showDuration": "300",
                "hideDuration": "1000",
                "timeOut": "5000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            };

            toastr.error(msg, title, opts);
        }
    },
    /**
     * 弹窗组件
     */
    dialog: {
        /**
         * alert提示框
         * @param title 提示框标题
         * @param message 提示框信息
         */
        alter: function (title, message) {
            modal.title = title;
            $("#modal_message").html(message);
            $('#modal-4').modal('show', {backdrop: 'static'});
        }
    }
};
Common.fn.delFamilyInfoLine = function (a) {
    $(a).parent().next().remove();
    $(a).parent().remove();
};

// 对Date的扩展，将 Date 转化为指定格式的String
// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符，
// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字)
// 例子：
// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423
// (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18
Date.prototype.Format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "h+": this.getHours(), //小时
        "m+": this.getMinutes(), //分
        "s+": this.getSeconds(), //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds() //毫秒
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}