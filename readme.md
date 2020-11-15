# A Julia artifact wrapper and helper for earth physical vector data

## Example

```julia
using PhysicalVectorsData
using Plots

sp = load_shapefile()

plot(sp50)
```
<img width="578" alt="fig_world" src="https://user-images.githubusercontent.com/12798270/99198156-b7c94080-27d1-11eb-9c77-954d953ea551.png">

```julia
left, bottom, right, top = 150, -20, 165, 0
sp_r = filter_shape(sp, left, bottom, right, top)
plot!(sp_r)
plot!(xlims=(left, right), ylim=(bottom, top))
```
<img width="304" alt="fig" src="https://user-images.githubusercontent.com/12798270/99198093-51442280-27d1-11eb-9435-bc9bb3a8db0f.png">

## Source

https://www.naturalearthdata.com/downloads/50m-physical-vectors/
