# 
# Grouping the zipcode


ZSFGH_e$zip_group <- factor(rep(NA,nrow(ZSFGH_e)),levels = c("San Francisco County",
                                                             "Marin County",
                                                             "San Mateo County",
                                                             "Santa Clara County",
                                                             "Contra Costa County",
                                                             "Alameda County",
                                                             "Napa County",
                                                             "Sonoma County",
                                                             "Solana County",
                                                             "Santa Cruz County",
                                                             "San Benito",
                                                             "San Joaquin",
                                                             "Homeless"))



head(ZSFGH_e)

Sf_county <-as.character(c( 94102, 94103, 94104, 94105, 94107, 94108, 94109, 94110, 94111, 94112, 94114, 94115, 94116, 94117, 94118, 94120,94121, 94122, 94123,94124,
                            94125,94126 ,94127, 94129, 94130, 94131, 94132, 94133, 94134,94140,94141,94142,94146,94147,94157,94159,94164,94165,94166,94167,94168,94169,94170,94172,94188))
Marin_county <-c(94924,94925,94920,94913,94904, 94901,94903,94949,94948,94947,94946,94945,94037,94941,94558,94940,94939,94938,94563,94937,94933,94930, 94929
                 ,94928,94970,94971,94972,95471,94960,94963,94703,94105,94964,94965,94705,94956,95476,94957,94950,94952,94953, 90266,94973,95650)
SanMateo_county <-as.character(c(94002,94003,94005,94010,94011,94012,94014,94015,94016,94017,94018,94019,94020,94021,94025,94026,94027,94028,94029,94030,94031,
                    94037,94038,94044,94045,94059,94060,94061,94062,94063,94064,94065,94066,94067,94070,94071,94074,94080,94083,94096,94098,94099,
                    94128,94307,94308,94401,94402,94403,94404,94405,94406,94407,94408,94409))


SantaClara_county <-as.character(c(94022,94023,94024,94035,94039,94040,94041,94042,94043,94085,94086,94087,94088,94089,94090,94301,94302,94303,94304,94305,
                                   94306,94309,94310,95002,95008,95009,95011,95013,95014,95015,95020,95021,95026,95030,95031,95032,95035,95036,95037,
                                   95038,95042,95044,95046,95050,95051,95052,95054,95055,95056,95070,95071,95101,95102,95103,95106,95108,95109,95110,95111,95112,
                                   95113,95114,95115,95116,95117,95118,95119,95120,95121,95122,95123,95124,95125,95126,95127,95128,95129,95130,95131, 95132, 95133,
                                   95134, 95135, 95136, 95137, 95138, 95139, 95140, 95141, 95142,95148,95150,95151, 95152, 95153, 95154, 95155, 95156, 95157, 95158,
                                   95159, 95160, 95161,95164,95170,95171,95172,95173))

ContraCosta_county <-as.character(c(94506,94507,94507,94509,94511,94513,94514,94516,94517,94518,94519,94520,94521, 94522, 94523, 94524, 94525, 94526, 94527, 94528,
                                   94529, 94530, 94531,94547,94548,94549,94553,94556,94561,94563,94564,94565,94569,94570,94572,94575,94583,94595,94596,94597,94598,
                                   94801,94802,94803,94804,94805,94806,94807,94808,94820,94850))

Alameda_county <- as.character(c(94501,94502,94536, 94537, 94538, 94539, 94540, 94541, 94542, 94543, 94544, 94545, 94546,94550,94551,94552,94555,94557,94560,94566,
                                 94568,94577,94578,94579,94580,94586,94587,94588,94601, 94602, 94603, 94604, 94605, 94606, 94607, 94608, 94609, 94610, 94611, 94612,
                                 94613, 94614, 94615, 94616, 94617, 94618, 94619, 94620, 94621,94623,94624,94661,94662,94701, 94702, 94703, 94704, 94705, 94706, 94707,
                                 94708, 94709, 94710,94712))



Napa_county <- as.character(c(94503,94508,94515,94558,94559,94562,94567,94573,94574,94576,94581,94599))


Sonoma_county <- as.character(c(94922,94923,94927,94928,94931,94951,94952,94953,94954,94955,94972,94975,94999,95401, 95402, 95403, 95404, 95405, 95406, 95407,
                                95408, 95409,95412,95416,95419,95421,95425,95430,95431,95433,95436,95439,95441,95442,95444,95446,95448,95450,95452,95462,95465,95471,95472,95473,95476,95480,95486))


Solana_county <-as.character(c(94510,94512,94533,94534,94535,94571,94585,94589,94590,94591,94592,95620,95625,95687,95688,95696))

SantaCruz_county <- as.character(c(95001,95003,95005,95006,95007,95010,95017,95018,95019,95033,95041,95060,95061,95062,95063,95064,95065,95066,95067,95073,95076,95077))


SanBenito_county <-as.character(c(95075,95043,95045,95024,95023,95045))

SanJoaquin_county <- as.character(c(95201, 95202, 95203, 95204, 95205, 95206, 95207, 95208, 95209, 95210, 95211, 95212, 95213,95215,95219,95220,95227,95230,95231,95234,95236,95237,95240,
                                    95241,95242,95253,95258,95267,95269,95304,95320,95330,95336,95337,95366,95376,95377,95378,95385,95391,95686))

ZSFGH_e$zip_group[ZSFGH_e$ZipCode =="99997" |ZSFGH_e$ZipCode=="99998"|ZSFGH_e$ZipCode=="99999"] <- "Homeless"
ZSFGH_e$zip_group <- ifelse(ZSFGH_e$ZipCode %in% Sf_county,"San Francisco County",ZSFGH_e$zip_group)
ZSFGH_e$zip_group <- ifelse(ZSFGH_e$ZipCode %in% Marin_county,"Marin County",ZSFGH_e$zip_group)
ZSFGH_e$zip_group <- ifelse(ZSFGH_e$ZipCode %in% SanMateo_county,"San Mateo County",ZSFGH_e$zip_group)
ZSFGH_e$zip_group <- ifelse(ZSFGH_e$ZipCode %in% SantaClara_county,"Santa Clara County",ZSFGH_e$zip_group)
ZSFGH_e$zip_group <- ifelse(ZSFGH_e$ZipCode %in% ContraCosta_county,"Contra Costa County",ZSFGH_e$zip_group)
ZSFGH_e$zip_group <- ifelse(ZSFGH_e$ZipCode %in% Alameda_county,"Alameda County",ZSFGH_e$zip_group)
ZSFGH_e$zip_group <- ifelse(ZSFGH_e$ZipCode %in% Napa_county,"Napa County",ZSFGH_e$zip_group)
ZSFGH_e$zip_group <- ifelse(ZSFGH_e$ZipCode %in% Sonoma_county,"Sonoma County",ZSFGH_e$zip_group)
ZSFGH_e$zip_group <- ifelse(ZSFGH_e$ZipCode %in% Solana_county,"Solana County",ZSFGH_e$zip_group)
ZSFGH_e$zip_group <- ifelse(ZSFGH_e$ZipCode %in% SantaCruz_county,"Santa Cruz County",ZSFGH_e$zip_group)
ZSFGH_e$zip_group <- ifelse(ZSFGH_e$ZipCode %in% SanBenito_county,"San Benito",ZSFGH_e$zip_group)
ZSFGH_e$zip_group <- ifelse(ZSFGH_e$ZipCode %in% SanJoaquin_county,"San Joaquin",ZSFGH_e$zip_group)
ZSFGH_e$zip_group[is.na(ZSFGH_e$zip_group )]  <- "Others"
View(ZSFGH_e)





