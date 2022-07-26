public with sharing class MetadataTool 
{
    public Boolean fieldCreation {set; get;}
    
    //Object vars
    public String objectName {set; get;}
    public String objectLabel {set; get;}
    public String pluralLabel {set; get;}
    public String nameField {set; get;}
    public String nameFieldLabel {set; get;}
    public String deploymentStatus {set; get;}
    public String sharingModel {set; get;}

    //Field vars
    public List<SelectOption> dataTypes {get; set;}
    public List<AggregateResult> aggregateResults {get; set;}
    public List<SelectOption> allObjects {get; set;}
    public String selectedObject {set; get;}

    public String selectedDataType {set; get;}
    public String label {set; get;}
    public String name {set; get;}
    public Integer length {set; get;}
    public Integer decimalPlaces {set; get;}
    public Integer visibleLines {set; get;}
    public String defaultvalue {set; get;}
    public Boolean required {set; get;}

    public MetadataTool() 
    {
        this.dataTypes = new List<SelectOption> {new SelectOption('', '--None--'),
        new SelectOption('Checkbox', 'Checkbox'),
        new SelectOption('Currency', 'Currency'),
        new SelectOption('Date', 'Date'),
        new SelectOption('DateTime', 'Date/Time'),
        new SelectOption('Email', 'Email'),
        new SelectOption('Number', 'Number'),
        new SelectOption('Percent', 'Percent'),
        new SelectOption('Phone', 'Phone'),
        new SelectOption('Text', 'Text'),
        new SelectOption('TextArea', 'Text Area'),
        new SelectOption('LongTextArea', 'Text Area(Long)'),
        new SelectOption('Time', 'Time'),
        new SelectOption('URL', 'URL')};

        this.aggregateResults = [SELECT SObjectType FROM ObjectPermissions GROUP BY SObjectType ORDER BY SObjectType ASC];
        this.allObjects = new List<SelectOption>();
        this.allObjects.add(new SelectOption('', '--None--'));
        for (AggregateResult ar : aggregateResults)
        {
            this.allObjects.add(new SelectOption((String)ar.get('SobjectType'), (String)ar.get('SobjectType')));
        }
    }

    public Pagereference createObject()
    {
        fieldCreation = false;
        return null;
    }

    public Pagereference createField()
    {
        fieldCreation = true;
        return null;
    }

    public Pagereference createCustomObject()
    {
        MetadataService.MetadataPort service = new MetadataService.MetadataPort();  
        service.SessionHeader = new MetadataService.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();

        List<MetadataService.Metadata> fields = new List<MetadataService.Metadata>();
        MetadataService.CustomObject  customobject = new MetadataService.CustomObject();
        customobject.fullName = objectName + '__c';
        customobject.label = objectLabel;
        customobject.pluralLabel = pluralLabel;
        customObject.nameField = new MetadataService.CustomField();
        customobject.nameField.type_x = nameField;
        customobject.nameField.label = nameFieldLabel;
        customobject.deploymentStatus = deploymentStatus;
        customObject.sharingModel = 'ReadWrite';
        fields.add(customobject);

        MetadataService.SaveResult[] results = service.createMetadata(fields);

        objectName = '';
        objectLabel = '';
        pluralLabel = '';
        nameField = '';
        nameFieldLabel = '';
        deploymentStatus = 'false';

        return null;
    }

    public Pagereference next()
    {
        return null;
    }

    public Pagereference saveText()
    {
        MetadataService.MetadataPort service = new MetadataService.MetadataPort();  
        service.SessionHeader = new MetadataService.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();

        List<MetadataService.Metadata> fields = new List<MetadataService.Metadata>();
        MetadataService.CustomField customField = new MetadataService.CustomField();
        customField.fullName = selectedObject + '.' + name + '__c';
        customField.label = label;
        customField.type_x = selectedDataType;
        customField.length = length;
        customField.required = required;
        fields.add(customField);

        MetadataService.SaveResult[] results = service.createMetadata(fields);

        label = '';
        name = '';
        length = null;
        required = false;

        return null;
    }

    public Pagereference saveNumber()
    {
        MetadataService.MetadataPort service = new MetadataService.MetadataPort();  
        service.SessionHeader = new MetadataService.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();

        List<MetadataService.Metadata> fields = new List<MetadataService.Metadata>();
        MetadataService.CustomField customField = new MetadataService.CustomField();
        customField.fullName = selectedObject + '.' + name + '__c';
        customField.label = label;
        customField.type_x = selectedDataType;
        customField.precision = length + decimalPlaces;
        customField.scale = decimalPlaces;
        customField.required = required;
        fields.add(customField);

        MetadataService.SaveResult[] results = service.createMetadata(fields);

        label = '';
        name = '';
        length = null;
        decimalPlaces = null;
        required = false;

        return null;
    }

    public Pagereference saveLabelName()
    {
        MetadataService.MetadataPort service = new MetadataService.MetadataPort();  
        service.SessionHeader = new MetadataService.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();

        List<MetadataService.Metadata> fields = new List<MetadataService.Metadata>();
        MetadataService.CustomField customField = new MetadataService.CustomField();
        customField.fullName = selectedObject + '.' + name + '__c';
        customField.label = label;
        customField.type_x = selectedDataType;
        customField.required = required;
        fields.add(customField);

        MetadataService.SaveResult[] results = service.createMetadata(fields);

        label = '';
        name = '';
        length = null;
        required = false;

        return null;
    }

    public Pagereference saveBigTexts()
    {
        MetadataService.MetadataPort service = new MetadataService.MetadataPort();  
        service.SessionHeader = new MetadataService.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();

        List<MetadataService.Metadata> fields = new List<MetadataService.Metadata>();
        MetadataService.CustomField customField = new MetadataService.CustomField();
        customField.fullName = selectedObject + '.' + name + '__c';
        customField.label = label;
        customField.type_x = selectedDataType;
        customField.length = length;
        customField.visibleLines = visibleLines;
        fields.add(customField);

        MetadataService.SaveResult[] results = service.createMetadata(fields);

        label = '';
        name = '';
        length = null;
        visibleLines = null;

        return null;
    }

    public Pagereference saveCheckbox()
    {
        MetadataService.MetadataPort service = new MetadataService.MetadataPort();  
        service.SessionHeader = new MetadataService.SessionHeader_element();
        service.SessionHeader.sessionId = UserInfo.getSessionId();

        List<MetadataService.Metadata> fields = new List<MetadataService.Metadata>();
        MetadataService.CustomField customField = new MetadataService.CustomField();
        customField.fullName = selectedObject + '.' + name + '__c';
        customField.label = label;
        customField.type_x = selectedDataType;
        customField.defaultvalue = defaultvalue;
        fields.add(customField);

        MetadataService.SaveResult[] results = service.createMetadata(fields);

        label = '';
        name = '';
        defaultvalue = 'false';
        return null;
    }
}
