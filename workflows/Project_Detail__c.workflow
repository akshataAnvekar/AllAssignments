<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Project_created</fullName>
        <description>Project created</description>
        <protected>false</protected>
        <recipients>
            <recipient>akshataanvekar@eternus.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Project_Created</template>
    </alerts>
    <alerts>
        <fullName>Reminder_About_End_Date</fullName>
        <description>Reminder About End Date</description>
        <protected>false</protected>
        <recipients>
            <recipient>akshataanvekar@eternus.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/MarketingProductInquiryResponse</template>
    </alerts>
    <alerts>
        <fullName>Rminder_about_end_date</fullName>
        <description>Rminder about end date</description>
        <protected>false</protected>
        <recipients>
            <recipient>akshataanvekar@eternus.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>unfiled$public/SalesNewCustomerEmail</template>
    </alerts>
    <fieldUpdates>
        <fullName>Status_closed</fullName>
        <field>Status__c</field>
        <literalValue>Closed</literalValue>
        <name>Status closed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>New project created</fullName>
        <actions>
            <name>Project_created</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>Project_is_created</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <formula>IF(Start_Date__c  =  TODAY(), True, False)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Reminder about end date</fullName>
        <actions>
            <name>Reminder_About_End_Date</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <formula>IF(TODAY()  -  End_Date__c  = 5, true, false)</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <offsetFromField>Project_Detail__c.End_Date__c</offsetFromField>
            <timeLength>-5</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>Set project status close</fullName>
        <actions>
            <name>Status_closed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>IF(End_Date__c =  TODAY() , true, false)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <tasks>
        <fullName>Project_is_created</fullName>
        <assignedTo>akshataanvekar@eternus.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>0</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <offsetFromField>Project_Detail__c.Start_Date__c</offsetFromField>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>In Progress</status>
        <subject>Project is created</subject>
    </tasks>
</Workflow>
