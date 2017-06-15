<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Employee_deactivation_notification</fullName>
        <description>Employee deactivation notification</description>
        <protected>false</protected>
        <recipients>
            <field>Employee_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>unfiled$public/Deactivation_notification</template>
    </alerts>
    <fieldUpdates>
        <fullName>Change_record_type</fullName>
        <field>RecordTypeId</field>
        <lookupValue>Non_Technical</lookupValue>
        <lookupValueType>RecordType</lookupValueType>
        <name>Change record type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Role_Copied</fullName>
        <field>Role_copy__c</field>
        <formula>Role__r.Name</formula>
        <name>Role Copied</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>Copy Role</fullName>
        <actions>
            <name>Role_Copied</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Employee__c.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>Deactivation of record</fullName>
        <actions>
            <name>Employee_deactivation_notification</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Employee__c.IsActive__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>Set record type non technical</fullName>
        <actions>
            <name>Change_record_type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Employee__c.Current_Employee__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
