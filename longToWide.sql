SELECT
t.transectId,
p.block,
t.type_CT_TT,
t.originTagNum,
t.end5mTagNum,
t.comments,
p.plantID,
p.x,
p.y,
MAX(CASE WHEN d.date = '2023-05-31' THEN d.heightInCentimeters END) AS height_Spring23,
MAX(CASE WHEN d.date = '2023-10-16' THEN d.heightInCentimeters END) AS height_Fall23,
MAX(CASE WHEN d.date = '2023-05-31' THEN d.basalWidthInCentimeters END) AS width_Spring23,
MAX(CASE WHEN d.date = '2023-10-16' THEN d.basalWidthInCentimeters END) AS width_Fall23,
MAX(CASE WHEN d.date = '2023-05-31' THEN d.reproductiveStatus END) AS repro_Spring23,
MAX(CASE WHEN d.date = '2023-10-16' THEN d.reproductiveStatus END) AS repro_Fall23,
MAX(CASE WHEN d.date = '2023-05-31' THEN d.numberReproductiveStructures END) AS numRep_Spring23,
MAX(CASE WHEN d.date = '2023-10-16' THEN d.numberReproductiveStructures END) AS numRep_Fall23,
MAX(CASE WHEN d.date = '2023-05-31' THEN d.comments END) AS notes_Spring23,
MAX(CASE WHEN d.date = '2023-10-16' THEN d.comments END) AS notes_Fall23
FROM _pepe_triState_data AS d
LEFT JOIN _pepe_triState_plants AS p ON d.plantID = p.plantID
LEFT JOIN _pepe_triState_transects AS t ON p.transectID = t.transectID
GROUP BY d.plantID;
