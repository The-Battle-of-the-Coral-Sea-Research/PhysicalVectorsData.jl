module PhysicalVectorsData

using Shapefile
using Pkg.Artifacts

export load_shapefile, filter_shape

const artifacts_toml = abspath(joinpath(@__DIR__, "..", "Artifacts.toml"))

function get_artifact_path()
    ensure_artifact_installed("sp50", artifacts_toml)
    sp50_dir = artifact_path(artifact_hash("sp50", artifacts_toml))
    return joinpath(sp50_dir, "ne_50m_land.shp")
end

# load utils

function load_shapefile(path)
    return Shapefile.shapes(Shapefile.Table(path))
end

load_shapefile() = load_shapefile(get_artifact_path())

# plot utils

function filter_shape(sp, left, bottom, right, top)
    sp_new = empty(sp)
    for s in sp
        if (s.MBR.right < left) | (s.MBR.left > right) | (s.MBR.bottom > top) | (s.MBR.top < bottom)
            continue
        end
        for p in s.points
            if (p.x > left) & (p.x < right) & (p.y > bottom) & (p.y < top)
                push!(sp_new, s)
                break
            end
        end
    end
    return sp_new
end


end # module
