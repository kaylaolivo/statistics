function [siftedData, siftedMean, siftedSTD, siftedNorm] = statistics(rawData, categories, selectedCategory) %creates the function with the necessary inputs and outputs

siftedData = [] % creates an empty array for siftedData value

for i = 1: length(rawData)
    if categories(i) == selectedCategory
        siftedData = [siftedData, rawData(i)]
    end
end % adds all the values from rawData that belong to the chosen category to the siftedData array

total = 0
for i = 1: length(siftedData)
    total = total + siftedData(i)
end % adds up all the values in siftedData
siftedMean = total / length(siftedData) %divides the total of values for siftedData by the number of elements in siftedData to find the mean

deviationtotal = 0
for i = 1: length(siftedData)
     x = abs(siftedData(i) - siftedMean)
     deviationtotal = deviationtotal + x
end %adds up all the values for how much each value in siftedData deviates from the mean 

siftedSTD = deviationtotal / length(siftedData) %finds the standard deviation by dividing deviationtotal by the amount of elements in siftedData

siftedNorm = [] 
for i = 1: length(siftedData)
    siftedNorm(i) = (siftedData(i) - siftedMean) / siftedSTD
end 
end