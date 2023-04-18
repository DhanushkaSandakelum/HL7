# Message related issues

# Segment related issues
- HL7V2_NTE_to_FHIR_Observation and HL7V2_NTE_to_FHIR_ServiceRequest mappings can't be done (NTE is not in the hl7v23 library)
- HL7V2_OBR_to_FHIR_DiagnosticReport and HL7V2_OBR_to_FHIR_ServiceRequest mappings can't be done (OBR is not in the hl7v23 library)
- HL7V2_OBX_to_FHIR_Observation field "performer" is Refrence type - Don't know compatible map with HL7 CE
- HL7V2_ORC_to_FHIR_DiagnosticReport, HL7V2_ORC_to_FHIR_Immunization, HL7V2_ORC_to_FHIR_Provenance, HL7V2_ORC_to_FHIR_ServiceRequest mappings can't be done (ORC is not in the hl7v23 library) 

# Data type related issues
- XCN to Reference mapping not in IG - Define temporary custom mapping at v2tofhir_mappings_datatypes_custom (HL7V2_XCN_to_FHIR_Reference)
- NTE is not in the hl7v23 library
- OBR is not in the hl7v23 library
- ORC is not in the hl7v23 library
- PL to EncounterLocation not in IG - temporary used pv2.pv21.p1 as location at HL7V2_PV2_to_FHIR_Encounter()
- XCN to EncounterParticipant not in IG - temporary used pv2.pv213.xcn1 as participant at HL7V2_PV2_to_FHIR_Encounter()