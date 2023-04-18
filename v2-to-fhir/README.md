# HL7 V2-To-FHIR Package
This package intercept HL7 v2.3 messages and construct the relevant FHIR r4 resources.

# Components
- Parser - Parse the HL7 v2.3 message to FHIR r4 resources
- Transformations - Apply the relevant HL7 v2.3 message transformation to the required FHIR r4 resource type
- Utils - Utility functions that are used in Transformations
- Helpers - Helper functions to the Utils functions
- Antlr - Computable ANTLR that are used in Utils

# Current supported mappings in HL7V2 specification
## Data Types
- [ ] CM(Source) - Composite to FHIR Specimen
- [x] CNE - Coded With No Exceptions to FHIR CodeableConcept
- [ ] CNN - Composite Id Number And Name Simplified to FHIR Practitioner
- [x] CQ - Composite Quantity With Units to FHIR Quantity
- [x] CE - Coded With Exceptions to FHIR Annotation
- [x] CE - Coded With Exceptions to FHIR CodeableConcept
- [x] CE - Coded With Exceptions to FHIR Coding
- [x] CE - Coded With Exceptions to FHIR Duration
- [x] CE - Coded With Exceptions to FHIR Organization
- [x] CE - Coded With Exceptions to FHIR Quantity
- [x] CE - Coded With Exceptions to FHIR code
- [x] CE - Coded With Exceptions to FHIR string
- [x] CE - Coded With Exceptions to FHIR uri
- [x] CX - Extended Composite Id With Check Digit to FHIR Identifier
- [x] DLN - Driver’s License Number to FHIR Identifier
- [x] DR - Date/Time Range to FHIR DateTime
- [x] DR - Date/Time Range to FHIR Period
- [x] ED - Encapsulated Data to FHIR Attachment
- [x] EI - Entity Identifier to FHIR Coding
- [ ] EIP(FillerAssignedIdentifer) - Entity Identifier Pair to FHIR Identifier
- [ ] EIP(PlacerAssignedIdentifier) - Entity Identifier Pair to FHIR Identifier
- [x] EI - Entity Identifier to FHIR Procedure
- [x] EI(Extension) - Entity Identifier to FHIR Identifier
- [x] EI(UDICarrier) - Entity Identifier to FHIR Device
- [x] FN - Family Name to FHIR HumanName
- [x] HD - Hierarchic Designator to FHIR Location
- [x] HD - Hierarchic Designator to FHIR Organization
- [ ] HD(AssigningAuthority) - Hierarchic Designator to FHIR extension
- [x] HD(endpoint) - Hierarchic Designator to FHIR MessageHeader.destination
- [x] HD(endpointwithname) - Hierarchic Designator to FHIR MessageHeader.source
- [x] HD - Hierarchic Designator to FHIR url
- [x] ID - Coded Value For Hl7 Defined Tables to FHIR CodeableConcept
- [x] IS - Coded Value For User to FHIR CodeableConcept
- [x] MSG - Message Type to FHIR Coding
- [x] MSG - Message Type to FHIR MessageHeader
- [ ] ​NA - Numeric Array to FHIR NumericArray
- [ ] NDL - Name With Date And Location to FHIR PractitionerRole
- [ ] NR - Numeric Range to FHIR Range
- [ ] PL - Person Location to FHIR Location
- [ ] PLN - Practitioner License Or Other Id Number to FHIR Identifier
- [x] PT - Processing Type to FHIR Meta
- [x] RI - Repeat Interval to FHIR Timing
- [x] RP - Reference Pointer to FHIR Attachment
- [ ] SAD - Street Address to FHIR Address
- [x] SN - Structured Numeric to FHIR Quantity
- [x] SN - Structured Numeric to FHIR Range
- [x] SN - Structured Numeric to FHIR Ratio
- [x] ST - String Data to FHIR Identifier
- [ ] TQ - Timing/Quantity to FHIR MedicationRequest
- [ ] TQ - Timing/Quantity to FHIR ServiceRequest
- [ ] TQ(executionPeriod) - Timing/Quantity to FHIR Task
- [x] XAD - Extended Address to FHIR Address
- [ ] XCN - Extended Composite Id Number And Name For Persons to FHIR Practitioner
- [ ] XCN - Extended Composite Id Number And Name For Persons to FHIR PractitionerRole
- [ ] XCN - Extended Composite Id Number And Name For Persons to FHIR RelatedPerson
- [ ] XON - Extended Composite Name And Identification Number For Organizations to FHIR Location
- [x] XON - Extended Composite Name And Identification Number For Organizations to FHIR Organization
- [ ] XON - Extended Composite Name And Identification Number For Organizations to FHIR string
- [x] XPN - Extended Person Name to FHIR HumanName
- [x] XTN - Extended Telecommunication Number to FHIR ContactPoint

## Segments
### Control
- [ ] MSA - Message Acknowledgment to FHIR MessageHeader
- [ ] MSH - Message Header to FHIR Bundle
- [x] MSH - Message Header to FHIR MessageHeader
- [ ] MSH(Source) - Message Header to FHIR Provenance
- [ ] NTE - Notes and Comments to FHIR Observation
- [ ] NTE - Notes and Comments to FHIR ServiceRequest
- [ ] SFT - Software Segment to FHIR MessageHeader
### Patient Administration
- [x] AL1 - Patient Allergy Information to FHIR AllergyIntolerance
- [x] EVN - Event Type to FHIR Provenance
- [ ] IAM - Patient Adverse Reaction Information to FHIR AllergyIntolerance
- [x] NK1 - Next of Kin / Associated Parties to FHIR Patient
- [ ] NK1 - Next of Kin / Associated Parties to FHIR RelatedPerson
- [x] PD1 - Patient Additional Demographic to FHIR Patient
- [ ] PID - Patient Identification to FHIR Account
- [x] PID - Patient Identification to FHIR Patient
- [ ] PID(EthnicGroup) - Patient Identification to FHIR Observation
- [ ] PID(Mother) - Patient Identification to FHIR RelatedPerson
- [ ] PID(Race) - Patient Identification to FHIR Observation
- [ ] PV1 - Patient Visit to FHIR Encounter
- [x] PV1 - Patient Visit to FHIR Patient
- [ ] PV2 - Patient Visit - Additional Information to FHIR Encounter
### Order Entry
- [ ] OBR - Observation Request to FHIR DiagnosticReport
- [ ] OBR - Observation Request to FHIR ServiceRequest
- [ ] ORC - Common Order to FHIR DiagnosticReport
- [ ] ORC - Common Order to FHIR Immunization
- [ ] ORC - Common Order to FHIR Provenance
- [ ] ORC - Common Order to FHIR ServiceRequest
### Order Entry: Pharmacy/Treatment, Vaccination
- [ ] RXA - Pharmacy/Treatment Administration to FHIR Immunization
- [ ] RXR - Pharmacy/Treatment Route to FHIR Immunization
### Financial Management
- [ ] DG1 - Diagnosis to FHIR Condition
- [ ] DG1 - Diagnosis to FHIR Encounter
- [ ] DG1 - Diagnosis to FHIR EpisodeOfCare
- [ ] PR1 - Procedures to FHIR Procedure
### Observation Reporting
- [ ] OBX - Observation/Result to FHIR Observation
- [ ] OBX(Component) - Observation/Result to FHIR Observation
- [ ] PRT - Participation Information to FHIR Device
- [ ] PRT - Participation Information to FHIR PractitionerRole
- [ ] PRT - Participation Information to FHIR RelatedPerson
- [ ] PRT(Location) - Participation Information to FHIR Observation
- [ ] SPM - Specimen to FHIR Specimen
### Personnel Management
- [ ] ROL - Role to FHIR RelatedPerson
- [ ] ROL(GeneralPractioner) - Role to FHIR Patient
- [ ] ROL(PractitionerRole) - Role to FHIR Encounter