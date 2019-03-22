-- OpenEMIS SUNMIN env Integrator SQL TEST
-- Transformation: Number of Institutions in Primary by Total - Area 1 (cube_15_280_612)

SELECT `Institutions__InstitutionTypes__id` AS `Institutions__InstitutionTypes__id`, `Institutions__InstitutionTypes__name` AS `Institutions__InstitutionTypes__name`, `Institutions__AcademicPeriods__id` AS `Institutions__AcademicPeriods__id`, `Institutions__AcademicPeriods__code` AS `Institutions__AcademicPeriods__code`, `Institutions__AcademicPeriods__name` AS `Institutions__AcademicPeriods__name`, `Institutions__Total` AS `Institutions__Total`, `AreasAll__Areas_1__id` AS `AreasAll__Areas_1__id`, `AreasAll__Areas_1__code` AS `AreasAll__Areas_1__code`, `AreasAll__Areas_1__name` AS `AreasAll__Areas_1__name`, `AreasAll__AreaLevels_1__id` AS `AreasAll__AreaLevels_1__id`, `AreasAll__AreaLevels_1__name` AS `AreasAll__AreaLevels_1__name`, `AreasAll__AreaLevels_1__level` AS `AreasAll__AreaLevels_1__level`,
COUNT(`id`) AS pri_institutions1
FROM `cube_15`
WHERE `Institutions__InstitutionTypes__id` = 2
GROUP BY `Institutions__AcademicPeriods__id`, `AreasAll__Areas_1__id`, `AreasAll__AreaLevels_1__id`;