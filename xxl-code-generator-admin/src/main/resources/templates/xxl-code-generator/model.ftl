<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
    <#list classInfo.fieldList as fieldItem >
        <#if fieldItem.fieldClass == "Date">
            <#assign importDdate = true />
        </#if>
    </#list>
</#if>
import java.io.Serializable;
<#if importDdate?? && importDdate>
    import java.util.Date;
</#if>

/**
*  ${classInfo.classComment}
*
*  @author Created by Code Generator
*  @since '${.now?string('yyyy-MM-dd HH:mm:ss')}'
*/
@Data
@Alias("${classInfo.className}")
@TableName("${classInfo.tableName}")
public class ${classInfo.className} implements Serializable {

<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
    <#list classInfo.fieldList as fieldItem >
        //${fieldItem.fieldComment}
        <#if fieldItem.primaryKey>
            @TableId(type = IdType.ID_WORKER_STR)
        </#if>
        private ${fieldItem.fieldClass} ${fieldItem.fieldName};

    </#list>
</#if>

<#--<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>-->
<#--    <#list classInfo.fieldList as fieldItem>-->
<#--        public ${fieldItem.fieldClass} get${fieldItem.fieldName?cap_first}() {-->
<#--        return ${fieldItem.fieldName};-->
<#--        }-->

<#--        public void set${fieldItem.fieldName?cap_first}(${fieldItem.fieldClass} ${fieldItem.fieldName}) {-->
<#--        this.${fieldItem.fieldName} = ${fieldItem.fieldName};-->
<#--        }-->

<#--    </#list>-->
<#--</#if>-->
}