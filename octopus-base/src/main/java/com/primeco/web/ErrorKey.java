package com.primeco.web;

/**
 * Created by ytvip on 2017/3/15.
 */
public enum ErrorKey {
    /**
     * 系统异常
     */
    SystemException,
    /**
     * 数据库操作出错，请联系管理员
     */
    HibernateException,
    /**
     * {0}不能为空
     */
    NotNull,
    /**
     * {0}错误
     */
    IsError,
    /**
     * 其他错误，占位符可以任意描述
     * {0}
     */
    OtherError,
    /**
     * 非法参数
     */
    Illegal_Params,

    /*==========================附件异常枚举====================*/
    /**
     * 上传的附件为空
     */
    AttachmentsEO_IsNull,
    /**
     * 身份证附件未上传
     */
    AttachmentsEO_ID_IsNull,
    /**
     * 户口本附件未上传
     */
    AttachmentsEO_HouseHold_IsNull,
    /**
     * 营业执照、开户许可证附件未上传
     */
    AttachmentsEO_BusinessLicense_IsNull,
    /**
     * 公司章程及修正案文件未上传
     */
    AttachmentsEO_ArticlesOfAssociation_IsNull,
    /**
     * 个人及家庭外部借款明细未上传
     */
    AttachmentsEO_ExternalBorrowingDetails_IsNull,
    /**
     * 最近2年财务报表未上传
     */
    AttachmentsEO_FinancialReport_IsNull,
    /**
     * 企业三证/三证合一文件未上传
     */
    AttachmentsEO_EnterpriseCertificates_IsNull,
    /**
     * 股东及法定代表人身份证、户口本文件未上传
     */
    AttachmentsEO_ShareholderIDCard_IsNull,
    /**
     * 家属身份证未上传
     */
    AttachmentsEO_FamilyMembersIDCard_IsNull,
    /**
     * 主要旅游产品、线路未上传
     */
    AttachmentsEO_MainTouristProduct_IsNull,
    /**
     * 与凤凰旅游合作相关数据未上传
     */
    AttachmentsEO_CooperativeData_IsNull,
    /**
     * 个人及家庭房产证、车辆登记证书、股权证明等未上传
     */
    AttachmentsEO_AssetCertificate_IsNull,
    /**
     * 验资报告未上传
     */
    AttachmentsEO_CapitalVerificationReport_IsNull,
    /**
     * 企业、股东、法人代表和家属银行征信报告未上传
     */
    AttachmentsEO_EnterpriseCreditReportUploader_IsNull,
    /**
     * 公司和个人主要银行流水未上传
     */
    AttachmentsEO_BankJournalUploader_IsNull,
    /**
     * 无权更新该附件
     */
    AttachmentsEO_ForbiddenUpdate,

    /*========================用户异常枚举=====================*/
    /**
     * 用户名或者密码不正确
     */
    UserEO_LoginFailure,
    /**
     * 非法用户，禁止登录
     */
    UserEO_IllegalUser,
    /**
     * 非法的客户类型
     */
    UserEO_IllegalCustomerType,
    /**
     * 已经存在该用户，请勿重复注册
     */
    UserEO_Existed,
    /**
     * 用户密码错误
     */
    UserEO_WrongPass,

    /*========================授信业务异常======================*/
    /**
     * 当前系统有重复的授信记录，请联系管理员
     */
    CreditLineEO_MutiCredit,
    /**
     * 未获得授信
     */
    CreditLineEO_NullCredit,
    /**
     * 申请贷款时间不在授信时间范围之内
     */
    CreditLineEO_CreateTime_Gt_SystemTime,
    /**
     * 贷款金额大于可授信余额，无法申请贷款
     */
    CreditLineEO_Empty,
    /**
     * 无权更新授信信息
     */
    CreditLineEO_ForbiddenUpdate,

    /*========================授权业务异常======================*/
    /**
     * 无权更新授权信息
     */
    AuthorizationEO_ForbiddenUpdate,
    /**
     * 信息未完善/无提交权限
     */
    AuthorizationEO_ForbiddenSubmit,
    /**
     * 未获得授权
     */
    AuthorizationEO_NotPass,
    /**
     * 放款凭证未上传
     */
    AttachmentsEO_LoanCertificateUploader_IsNull,
    /**
     * 身份证号已经存在
     */
    IdCard_Existed,
    /**
     * 邮箱已经存在
     */
    Mail_Existed,
    /**
     * 统一社会信用代码已经存在
     */
    CorpNo_Existed,
    /**
     * 贷款未通过
     */
    LoanEO_NotPass,
}
