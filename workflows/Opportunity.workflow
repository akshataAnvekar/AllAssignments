<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Big_deal_alert</fullName>
        <description>Big deal alert</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>akshataanvekar@eternus.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Big_Deal_Alert</template>
    </alerts>
    <alerts>
        <fullName>Route_opportunity_to_manager</fullName>
        <description>Route opportunity to manager</description>
        <protected>false</protected>
        <recipients>
            <recipient>Manager</recipient>
            <type>role</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Big_Deal_Alert</template>
    </alerts>
    <rules>
        <fullName>Check Oppurtunity Stage</fullName>
        <actions>
            <name>Big_deal_alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Negotiation/Review</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Amount</field>
            <operation>greaterThan</operation>
            <value>50000</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
