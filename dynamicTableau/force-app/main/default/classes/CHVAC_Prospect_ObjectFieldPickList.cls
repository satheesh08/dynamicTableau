/*
* @author: Satheesh
* @date: May 30 2023
* @description: Class to fetch dynamic picklist values
*/
global with sharing class CHVAC_Prospect_ObjectFieldPickList extends VisualEditor.DynamicPickList {
    @TestVisible
    private static final String RECORD_PAGE = 'RecordPage';

    private VisualEditor.DynamicPickListRows rows;

    @TestVisible
    public CHVAC_Prospect_ObjectFieldPickList(String pageType, String objectName) {
        this.rows = getRows(pageType, objectName);
    }


    // This method will get the page context
    global CHVAC_Prospect_ObjectFieldPickList(VisualEditor.DesignTimePageContext context) {
        this.rows = getRows(context.pageType, context.entityName);
    }

            // This method will get the rows from the record page context
    private VisualEditor.DynamicPickListRows getRows(
        String pageType,
        String objectName
    ) {
        VisualEditor.DynamicPickListRows rows = new VisualEditor.DynamicPickListRows();
        if (pageType == RECORD_PAGE) {
            Map<String, Schema.SObjectField> fields = getObjectFields(
                objectName
            );
            Set<String> fieldNames = fields.keySet();
            for (String fieldName : fieldNames) {
                Schema.SObjectField field = fields.get(fieldName);
                Schema.DescribeFieldResult fieldInfo = field.getDescribe();
                String qualifiedFieldName =
                    objectName +
                    '.' +
                    fieldInfo.getName();
                rows.addRow(
                    new VisualEditor.DataRow(
                        fieldInfo.getLabel(),
                        qualifiedFieldName
                    )
                );
            }
        }
        return rows;
    }
    

    // This method will get the related fields based on the object passed 
    private Map<String, Schema.SObjectField> getObjectFields(
        String objectName
    ) {
        String[] objectNames = new List<String>{ objectName };
        Schema.DescribeSobjectResult[] objects = Schema.describeSObjects(
            objectNames
        );
        Schema.DescribeSobjectResult objectInfo = objects[0];
        return objectInfo.fields.getMap();
    }

    // method to get the default default for the row
    global override VisualEditor.DataRow getDefaultValue() {
        return null;
    }
    
    // method to get the values for the row
    global override VisualEditor.DynamicPickListRows getValues() {
        return this.rows;
    }
}