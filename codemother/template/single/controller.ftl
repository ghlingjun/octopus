package ${controllerPackage};

<#include '../inc-macro.ftl' />
import ${controllerBasePackage}.Base${schema.modelName}Ctl;
import ${servicePackage}.${schema.modelName}Service;
import ${modelPackage}.${schema.modelName};
<#list schema.normalColumnDefList as columnDef >
    <#if columnDef.name == 'updated_by'>
import com.primeco.security.ShiroUtils;
import com.primeco.utils.DateTimeUtils;
    </#if>
</#list>
import com.primeco.utils.AjaxResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
<#macro listKeyRealParam>
<#if schema.key.complex>
<#list schema.key.columnDefList as columnDef>
model.get${columnDef.javaName?cap_first}()<#if columnDef_has_next>, </#if><#rt />
</#list>
<#else>
model.get${schema.key.javaName?cap_first}()<#t />
</#if>
</#macro><#t />

@Controller
@RequestMapping("/${schema.modelName}")
public class ${schema.modelName}Ctl extends Base${schema.modelName}Ctl {
    @Autowired
    protected ${schema.modelName}Service modelSvc;

    <#if !schema.key.complex>
    /**
     * Request for update a entiry
     */
    @ResponseBody
    @RequestMapping("/update")
    public AjaxResult doUpdate(@ModelAttribute ${schema.modelName} model) {
        log.info("Request for update");
        try {
            ${schema.modelName} entity = modelSvc.getByKey(<@listKeyRealParam />);
            <#list schema.normalColumnDefList as columnDef >
                <#if columnDef.name == 'updated_by'>
            model.setUpdatedBy(ShiroUtils.getUsername());
            model.setUpdatedAt(DateTimeUtils.getTimestamp());
                </#if>
            </#list>
            // Set the properties which need be updated

            modelSvc.update(model);
        } catch (Exception e) {
            return AjaxResult.createError(e.getMessage());
        }
        return AjaxResult.SUCCESS;
    }
    </#if>

}
