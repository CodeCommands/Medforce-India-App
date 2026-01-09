Here is the structured data ready for your estimation tool (Excel/ADM). I have organized it into Project Line Items and Planning Assumptions to ensure your estimate is defensible.
Part 1: Estimation Line Items (Copy/Paste to Excel)
You can copy the table below directly into your spreadsheet.
| ID | Phase | Activity Category | Activity Name | Qty | Complexity | Role | Description / Assumptions |
|---|---|---|---|---|---|---|---|
| 1.0 | 1. Foundation | Environment | Org Strategy & Provisioning | 1 | Low | Architect | Enable Data Cloud & MC Growth. Define Business Unit naming conventions. |
| 1.1 | 1. Foundation | Data Architecture | Global Data Model (CIM) Setup | 1 | High | Data Arch | Define standard DMO mapping for Individual, ContactPoint, PartyID. |
| 1.2 | 1. Foundation | Security | Base Role Hierarchy Setup | 1 | Medium | Admin | Define abstract roles (Marketer, Approver) and Shared Permission Sets. |
| 1.3 | 1. Foundation | Content | Global CMS Workspace | 1 | Medium | Consultant | Setup "Enterprise Assets" workspace (Logos, Legal Footers) for sharing. |
| 1.4 | 1. Foundation | Compliance | Consent Framework | 1 | High | Architect | Config ContactPointConsent object & Global Communication Channels. |
| 1.5 | 1. Foundation | Email | SAP & Domain Setup | 1 | High | Tech Lead | DNS Config (SPF/DKIM) for primary sending domain. |
| 2.0 | 2. PO Onboarding | CRM Config | Record Type & Layouts | 5 | Low | Admin | Create Contact Record Types & assign unique Page Layouts per PO. |
| 2.1 | 2. PO Onboarding | Data Cloud | Data Space Configuration | 5 | Medium | Data Lead | Create Data Space boundaries and assign Security constraints. |
| 2.2 | 2. PO Onboarding | Data Ingestion | Data Streams & Filtering | 10 | Medium | Data Lead | Ingest Contacts + 1 Object per PO. Apply RecordType Filter. |
| 2.3 | 2. PO Onboarding | Data Mapping | DMO Mapping | 10 | High | Data Arch | Map source fields to CIM. Handle schema variance (e.g. unique IDs). |
| 2.4 | 2. PO Onboarding | Identity | Identity Resolution Rules | 5 | High | Data Arch | Configure Match/Reconciliation rules specific to each Data Space. |
| 2.5 | 2. PO Onboarding | Security | Permission Set Groups | 5 | Medium | Admin | Create PSGs scoping user access to specific Data Space & CMS Channel. |
| 2.6 | 2. PO Onboarding | Content | PO CMS Workspace | 5 | Low | Consultant | Create local workspace, assign contributors, link global assets. |
| 2.7 | 2. PO Onboarding | Email | Sender Profiles | 5 | Low | Admin | Configure From Name/Reply-To specific to Program Office. |
| 3.0 | 3. Data/Custom | Remediation | Legacy Data Tagging | 1 | High | Developer | Bulk API update to tag existing Contacts with correct RecordTypeId. |
| 3.1 | 3. Data/Custom | Extension | Custom Field Mapping | 15 | Medium | Data Lead | Extend DMOs for unique PO columns (Est: 3 unique fields per PO). |
| 4.0 | 4. Enablement | Documentation | Onboarding Runbook | 1 | Medium | Tech Lead | Guide for IT: "How to add Program Office #6". |
| 4.1 | 4. Enablement | Training | Train-the-Trainer | 5 | High | Consultant | 2hr Workshop per PO (Focus: Segmentation in Data Space). |
| 4.2 | 4. Enablement | Support | Hypercare Period | 40h | N/A | Support | Post-Go-Live triage buffer. |
Part 2: Project Assumptions & Constraints
Add these to the "Notes" or "Assumptions" tab of your estimator to protect scope.
 * Standard Object Usage: The estimate assumes we will map to Standard Data Cloud Objects (Individual, ContactPoint) and not build a fully custom data model.
 * Schema Variance: We assume a maximum of 5 unique custom fields per Program Office that require DMO extension.
 * Data Quality: The client (Program Offices) is responsible for providing clean data. The "Legacy Data Tagging" task assumes logic is provided (e.g., "All contacts with City=Miami belong to Housing"). If logic does not exist, manual cleanup is out of scope.
 * Flow Migration: This estimate covers Standard Templates (Welcome, Consent) only. Migrating complex legacy automations/journeys is Out of Scope for this enablement phase.
 * Environment: All Program Offices reside in a single Salesforce Production Org. No Multi-Org (Salesforce to Salesforce) connections are required.
Part 3: One-Time Next Step
Would you like me to generate a "Program Office Onboarding Form" (list of questions) that you can send to these 5 offices to gather the inputs (Fields, Sender Names, Logos) needed to execute the estimate above?
