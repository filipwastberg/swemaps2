1# swemaps 1.0.1

* Added a `NEWS.md` file to track changes to the package.

## New map objects

The previous map objects where data.frames. Instead the new objects are
sf-objects that make it easier to create maps and manipulate map data.

## New maps

A number of new maps have been added:

- `county`, with county borders 
- `municipality`, with municipality borders
- `fa_region`, with FA region borders
- `sthlm`, with region borders of Stockholm
- `sthlm_points`, with region center points in Stockholm
- `gbg`, with region borders of Gothenburg
- `malmo`, with region borders of Malmö

## Load DeSO and RegSO map data

Statistics Sweden have two excellent region classifications called 
DeSO and RegSO. These regions are very detailed and should be used for creating
detailed maps over for example municipalities. 

Because these datasets are large we use `load_deso()` and `load_regso()` to
load these into the R environment, instead of having them as datasets in the
package.