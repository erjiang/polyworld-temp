#!/bin/sh

# timesteps=$(ls -1 stats/stat.* | sed 's/stats\/stat.//g' | sort -n | tr '\n' ' ')

timesteps="1 100 200 300 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500 1600 1700 1800 1900 2000 2100 2200 2300 2400 2500 2600 2700 2800 2900 3000 3100 3200 3300 3400 3500 3600 3700 3800 3900 4000 4100 4200 4300 4400 4500 4600 4700 4800 4900 5000 5100 5200 5300 5400 5500 5600 5700 5800 5900 6000 6100 6200 6300 6400 6500 6600 6700 6800 6900 7000 7100 7200 7300 7400 7500 7600 7700 7800 7900 8000 8100 8200 8300 8400 8500 8600 8700 8800 8900 9000 9100 9200 9300 9400 9500 9600 9700 9800 9900 10000"

 
# 1250 1500 1750 2000 2250 2500 2750 3000 3250 3500 3750 4000 4250 4500 4750 5000 5250 5500 5750 6000 6250 6500 6750 7000 7250 7500 7750 8000 8250 8500 8750 9000 9250 9500 9750 10000"

grep 'foodBand\[0\]' worldfile | awk '$0 ~ /zMax/ { max = $1 } $0 ~ /zMin/ { min = $1 } $0 ~ /fraction/ { fraction = $1 } END { print "FoodBand0\n  Area:      " (max-min) "\n  Fraction:  " fraction } '
grep 'foodBand\[1\]' worldfile | awk '$0 ~ /zMax/ { max = $1 } $0 ~ /zMin/ { min = $1 } $0 ~ /fraction/ { fraction = $1 } END { print "FoodBand1\n  Area:      " (max-min) "\n  Fraction:  " fraction } '
grep 'useProbabilisticFoodBands' worldfile


# grep 'foodBand' worldfile | awk '{ print "# " $0 }' > FB0.plt
# grep 'foodBand' worldfile | awk '{ print "# " $0 }' > FB1.plt
# grep 'foodBand' worldfile | awk '{ print "# " $0 }' > FB\*.plt
# grep 'foodBand' worldfile | awk '{ print "# " $0 }' > FB\!.plt
# grep 'foodBand' worldfile | awk '{ print "# " $0 }' > food.plt

rm NeurGroups.plt
rm CurNeurGroups.plt
rm population_size.plt
rm fitness.plt
rm normfitness.plt

echo -e "##################\n# Num Food in each foodBand" >> food.plt

for timestep in $timesteps
do
#	num_critters_in_bands=$(cat stats/stat.${timestep} | grep '^FB\*' | awk -F" " '{ print $2 }' timestep=${timestep})
#	num_critters_in_bands5=$(cat stats/stat.${timestep} | grep '^FB\*' | awk -F" " '{ print $3 }' timestep=${timestep})
#	num_critters_in_bands10=$(cat stats/stat.${timestep} | grep '^FB\*' | awk -F" " '{ print $4 }' timestep=${timestep})

#	cat stats/stat.${timestep} | grep '^FB0' | awk -F" " '{ print timestep "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6 "\t" $7 "\t" $2 / num_crit * 100 "\t" $3 / num_crit5 * 100 "\t" $4 / num_crit10 * 100 "\t" $1}' timestep=${timestep} num_crit=${num_critters_in_bands} num_crit5=${num_critters_in_bands5} num_crit10=${num_critters_in_bands10} >> FB0.plt

#	cat stats/stat.${timestep} | grep '^FB1' | awk -F" " '{ print timestep "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6 "\t" $7 "\t" $2 / num_crit * 100 "\t" $3 / num_crit5 * 100 "\t" $4 / num_crit10 * 100 "\t" $1}' timestep=${timestep} num_crit=${num_critters_in_bands} num_crit5=${num_critters_in_bands5} num_crit10=${num_critters_in_bands10} >> FB1.plt

#	cat stats/stat.${timestep} | grep '^FB\*' | awk -F" " '{ print timestep "\t" $2 "\t" $3 "\t" $4 "\t" $5 "\t" $6 "\t" $7 "\t" $2 / num_crit * 100 "\t" $3 / num_crit5 * 100 "\t" $4 / num_crit10 * 100 "\t" $1}' timestep=${timestep} num_crit=${num_critters_in_bands} num_crit5=${num_critters_in_bands5} num_crit10=${num_critters_in_bands10} >> FB\*.plt


	cat stats/stat.${timestep} | grep 'CurNeurGroups' | awk -F" " '{ print timestep "\t" $3 "\t" $5 }' timestep=${timestep} >> CurNeurGroups.plt
	cat stats/stat.${timestep} | grep 'NeurGroups' | awk -F" " '{ print timestep "\t" $3 "\t" $5 }' timestep=${timestep} >> NeurGroups.plt
	cat stats/stat.${timestep} | grep 'critters' | awk -F" " '{ print timestep "\t" $3 }' timestep=${timestep} >> population_size.plt
	cat stats/stat.${timestep} | grep '^Fitness' | tr -d 'm=' | tr -d ',' | awk -F" " '{ print timestep "\t" $2 }' timestep=${timestep} >> fitness.plt
	cat stats/stat.${timestep} | grep '^NormFit' | tr -d 'm=' | tr -d ',' | awk -F" " '{ print timestep "\t" $2 }' timestep=${timestep} >> normfitness.plt
#	cat stats/stat.${timestep} | grep '^FB\*' | awk -F" " '
#	{
#	num_critters = ($2 * 100 / $5)
#	int_critters = int(num_critters)
#	dec_critters = num_critters - int_critters
#	if( dec_critters > 0.5 ) { num_critters = int_critters + 1 }
#	else { num_critters = int_critters }
##	print "Num critters = " num_critters
#	print timestep "\t" num_critters - $2 "\t" num_critters - $3 "\t" num_critters - $4 "\t" 100 - $5 "\t" 100 - $6 "\t" 100 - $7 "\t" "FB!"
#	}' timestep=${timestep} >> FB\!.plt


#	grep "^${timestep}:" foodbandstats.txt | awk -F" " '{colon_pos = index($1, ":"); timestep = substr($1,1,colon_pos-1); total_food=$4 + $5; print timestep "	" $4 /total_food * 100 "	" $5 / total_food * 100 "	" total_food }' >> food.plt

done

