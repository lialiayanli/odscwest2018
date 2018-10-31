data(father.son, package='UsingR')
head(father.son)

library(ggplot2)
ggplot(father.son, aes(x=fheight, y=sheight)) + 
    geom_point() +
    geom_smooth(method='lm')

height1 <- lm(sheight ~ fheight, data=father.son)
coef(height1)

33.88 + 0.51*60
33.88 + 0.51*72

land_train <- readr::read_csv('data/manhattan_Train.csv')

View(land_train)

valueFormula <- TotalValue ~ FireService + 
    ZoneDist1 + ZoneDist2 + Class + LandUse + 
    OwnerType + LotArea + BldgArea + ComArea + 
    ResArea + OfficeArea + RetailArea + 
    GarageArea + FactryArea + NumBldgs + 
    NumFloors + UnitsRes + UnitsTotal + 
    LotFront + LotDepth + BldgFront + 
    BldgDepth + LotType + Landmark + BuiltFAR +
    Built + HistoricDistrict - 1

value1 <- lm(valueFormula, data=land_train)
coef(value1)
summary(value1)

library(coefplot)
coefplot(value1,sort='magnitude')


sports <- c('Hockey', 'Lacrosse', 'Curling', 'Football', 
            'Hockey', 'Curling', 'Hockey')
sports
model.matrix( ~ sports)

boros <- tibble::tribble(
    ~ Boro, ~ Pop, ~ Size, ~ Random,
    'Manhattan', 1600000, 23, 13,
    'Brooklyn', 2600000, 78, 42,
    'Queens', 2330000, 104, 26,
    'Bronx', 1500000, 42, 1,
    'Staten Island', 480000, 60, 7
)

boros

library(useful)

build.x( ~ Pop, data=boros)
build.x( ~ Pop + Size, data=boros)
build.x( ~ Pop * Size, data=boros)
build.x( ~ Pop : Size, data=boros)
build.x( ~ Pop + Size - 1, data=boros)
build.x( ~ Pop + Boro, data=boros)
build.x( ~ Pop + Boro, data=boros, contrasts=FALSE)
build.x( ~ Pop + Boro, data=boros, contrasts=FALSE, sparse=TRUE)
