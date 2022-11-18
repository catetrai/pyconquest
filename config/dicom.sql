/*
#   DICOM Database layout
#
#   Modified from:
#   https://raw.githubusercontent.com/spectra/conquest-dicom-server/master/dicom.sql.sqlite
#
#	Tables:
#
#		*Patient*
#			*Study*
#				*Series*
#					*Image*
#
# The last defined element of Study is a link back to Patient
# The last defined element of Series is a link back to Study
# The last defined element of Image is a link back to Series
#
#
# Format for DICOM databases :
#	{ Group, Element, Column Name, Column Length, SQL-Type, DICOM-Type }
*/

*Patient*
{
	{ 0x0010, 0x0020, "PatientID", 64, SQL_C_CHAR, DT_STR },
	{ 0x0010, 0x0010, "PatientName", 64, SQL_C_CHAR, DT_STR },
    { 0x0010, 0x0030, "PatientBirthDate", 8, SQL_C_DATE, DT_DATE },
	{ 0x0010, 0x0040, "PatientSex", 16, SQL_C_CHAR, DT_STR }
}

*Study*
{
	{ 0x0020, 0x000d, "StudyInstanceUID", 64, SQL_C_CHAR, DT_UI },
	{ 0x0008, 0x0020, "StudyDate", 8, SQL_C_DATE, DT_DATE },
	{ 0x0008, 0x0030, "StudyTime", 16, SQL_C_CHAR, DT_TIME },
	{ 0x0020, 0x0010, "StudyID", 16, SQL_C_CHAR, DT_STR },
	{ 0x0008, 0x1030, "StudyDescription", 64, SQL_C_CHAR, DT_STR },
	{ 0x0008, 0x0050, "AccessionNumber", 16, SQL_C_CHAR, DT_STR },
	{ 0x0008, 0x0090, "ReferPhysician", 64, SQL_C_CHAR, DT_STR },

	{ 0x0010, 0x0020, "PatientID", 64, SQL_C_CHAR, DT_STR }
}

*Series*
{
	{ 0x0020, 0x000e, "SeriesInstanceUID", 64, SQL_C_CHAR, DT_UI },
	{ 0x0020, 0x0011, "SeriesNumber", 12, SQL_C_CHAR, DT_STR },
	{ 0x0008, 0x0021, "SeriesDate", 8, SQL_C_DATE, DT_DATE },
	{ 0x0008, 0x0031, "SeriesTime", 16, SQL_C_CHAR, DT_TIME },
	{ 0x0008, 0x103e, "SeriesDescription", 64, SQL_C_CHAR, DT_STR },
	{ 0x0008, 0x0060, "Modality", 16, SQL_C_CHAR, DT_STR },
	{ 0x0018, 0x5100, "PatientPosition", 16, SQL_C_CHAR, DT_STR },
	{ 0x0018, 0x0010, "ContrastBolusAgent", 64, SQL_C_CHAR, DT_STR },
	{ 0x0008, 0x0070, "Manufacturer", 64, SQL_C_CHAR, DT_STR },
	{ 0x0008, 0x1090, "ModelName", 64, SQL_C_CHAR, DT_STR },
	{ 0x0018, 0x1000, "DeviceSerialNumber", 64, SQL_C_CHAR, DT_STR },
	{ 0x0018, 0x1020, "SoftwareVersions", 64, SQL_C_CHAR, DT_STR },
	{ 0x0018, 0x0015, "BodyPartExamined", 64, SQL_C_CHAR, DT_STR },
	{ 0x0018, 0x1030, "ProtocolName", 64, SQL_C_CHAR, DT_STR },
	{ 0x0008, 0x1010, "StationName", 16, SQL_C_CHAR, DT_STR },
	{ 0x0008, 0x0080, "Institution", 64, SQL_C_CHAR, DT_STR },
	{ 0x0020, 0x0052, "FrameOfReferenceUID", 64, SQL_C_CHAR, DT_UI },

	{ 0x0020, 0x1209, "NumberOfSeriesRelatedInstances", 5, SQL_C_CHAR, DT_UINT16 },

	{ 0x0010, 0x0020, "SeriesPat", 64, SQL_C_CHAR, DT_STR },
	{ 0x0020, 0x000d, "StudyInstanceUID", 64, SQL_C_CHAR, DT_UI }
}

*Image*
{
	{ 0x0008, 0x0018, "SOPInstanceUID", 64, SQL_C_CHAR, DT_UI },
	{ 0x0008, 0x0016, "SOPClassUID", 64, SQL_C_CHAR, DT_UI },
	{ 0x0020, 0x0013, "ImageNumber", 12, SQL_C_CHAR, DT_STR },
	{ 0x0008, 0x0023, "ImageDate", 8, SQL_C_DATE, DT_DATE },
	{ 0x0008, 0x0033, "ImageTime", 16, SQL_C_CHAR, DT_TIME },
	{ 0x0018, 0x0086, "EchoNumber", 64, SQL_C_CHAR, DT_MSTR },
	{ 0x0028, 0x0008, "NumberOfFrames", 12, SQL_C_CHAR, DT_STR },
	{ 0x0008, 0x0022, "AcqDate", 8, SQL_C_DATE, DT_DATE },
	{ 0x0008, 0x0032, "AcqTime", 16, SQL_C_CHAR, DT_TIME },
	{ 0x0018, 0x1250, "ReceivingCoil", 16, SQL_C_CHAR, DT_STR },
	{ 0x0020, 0x0012, "AcqNumber", 12, SQL_C_CHAR, DT_STR },
	{ 0x0018, 0x0091, "EchoTrainLength", 5, SQL_C_CHAR, DT_UINT16 },
	{ 0x0018, 0x0020, "ScanningSequence", 64, SQL_C_CHAR, DT_STR },
	{ 0x0028, 0x0030, "PixelSpacing", 16, SQL_C_CHAR, DT_STR },
	{ 0x0018, 0x0050, "SliceThickness", 16, SQL_C_CHAR, DT_STR },
	{ 0x0020, 0x1041, "SliceLocation", 16, SQL_C_CHAR, DT_STR },
	{ 0x0028, 0x0002, "SamplesPerPixel", 5, SQL_C_CHAR, DT_UINT16 },
	{ 0x0028, 0x0004, "PhotoMetricInterpretation", 16, SQL_C_CHAR, DT_STR },
	{ 0x0028, 0x0010, "Rows", 5, SQL_C_CHAR, DT_UINT16 },
	{ 0x0028, 0x0011, "Colums", 5, SQL_C_CHAR, DT_UINT16 },
	{ 0x0028, 0x0101, "BitsStored", 5, SQL_C_CHAR, DT_UINT16 },
	{ 0x0018, 0x0080, "RepetitionTime", 16, SQL_C_CHAR, DT_STR },
	{ 0x0018, 0x0081, "EchoTime", 16, SQL_C_CHAR, DT_STR },
	{ 0x0018, 0x0082, "InversionTime", 16, SQL_C_CHAR, DT_STR },
	{ 0x0018, 0x0095, "PixelBandwidth", 16, SQL_C_CHAR, DT_STR },
	{ 0x0008, 0x0008, "ImageType", 128, SQL_C_CHAR, DT_MSTR },
	{ 0x0054, 0x0400, "ImageID", 16, SQL_C_CHAR, DT_STR },

	{ 0x0010, 0x0020, "ImagePat", 64, SQL_C_CHAR, DT_STR },
	{ 0x0020, 0x000e, "SeriesInstanceUID", 64, SQL_C_CHAR, DT_UI }
}

