function lorentzian(ω, p)
    A, ω₀, γ = p
    return @. A * γ / ((ω - ω₀)^2 +  γ^2) / π
end


function trapezoid(x, y)
    area = 0
    i = 1
    while i < length(y)
        area += (y[i] + y[i+1]) * (x[i+1] - x[i]) / 2.0
        i += 1
    end
    return area
end

function find_maxima(dir)

    max_vals = []
    spectra = []
    files = readdir(dir)

    for file in files
        filepath = joinpath(dir, file)
        spec = readdlm(filepath, skipstart=1)
        x = spec[:, 1]
        y = spec[:, 2]
        max = findfirst(x -> x == maximum(y), y)
        push!(spectra, spec)
        push!(max_vals, max)
    end

    return spectra, max_vals
end
