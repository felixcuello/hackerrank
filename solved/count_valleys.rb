def countingValleys(steps, path)
    check = false
    sea_level = 0
    valleys = 0
    for i in (0..steps-1)
        sea_level += (path[i] == 'U') ? 1 : -1
        if check && sea_level == 0
            valleys += 1
            check = false
        end
        check = true if sea_level < 0
    end
    
    valleys
end
