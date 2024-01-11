--[[ 

Archive of all the functions within this Script

For Clarities sake, this is my very first project built on personal knowledge
Allow me to share some of that with you
In this project, I'll be using several letters that stand for certain values:
'f' for the main metals purity
'mf' for the weight of that main metal
'z' for the remainders metal purity
'mz' for the remainders metal weight
and lastly, 'ml' for the entire alloys weight
After reading through this mostrosity and sharing it with others, it became
clear to me that its absolutely unreadable to someone without these few points
So have fun~

Rounding and Decimal Count
--]]
function math.round(number, decimals)
	local multiplier = 10 ^ decimals
	return math.floor(number * multiplier + 0.5) / multiplier
end

function TwoPartMetalSmelt()

	local correct = false
	while not correct do

	print("What is your metals purity? (e.g 0.750) \n")
	two_sp = io.read()

	print("How many grams of that metal do you have? \n")
	two_sw = io.read()
	print("What is Metal #2's purity? (e.g 0.585) \n")
	two_stp = io.read()

	print("How many grams of THAT metal do you have? \n")
	two_stw = io.read()

	print("#1 Metal purity: "..two_sp)
	print("#1 Metal weight: "..two_sw)
	print("#2 Metal purity: "..two_stp)
	print("#2 Metal weight: "..two_stw)
	print("-----------------------")

	repeat
  	print("Is this correct? (y/n) \n")
  	local confirm = io.read()
 		if confirm == "y" then
    	correct = true
			TwoSmeltMath()
 		elseif confirm ~= "n" then
    	print("Please enter either [y] or [n]")
 		end
 		until confirm == "y" or confirm == "n"
	end
end

function TwoPartMetalMix()

	local mix_correct = false
	while not mix_correct do

	print("What is the purity of metal #1? (e.g 0.900) \n")
	two_mp = io.read()

	print("What is the weight of metal #1? (in grams) \n")
	two_mw = io.read()

	print("What is the purity of metal #2? \n")
	two_mtp = io.read()

	print("What is the weight of metal #2? \n")
	two_mtw = io.read()

	print("Metal #1's purity:"..two_mp)
	print("Metal #1's weight:"..two_mw)
	print("Metal #2's purity:"..two_mtp)
	print("Metal #2's weight:"..two_mtw)
	
	repeat
 		print("Is this correct? (y/n) \n")
 		local mix_confirm = io.read()
 		if mix_confirm == "y" then
   		mix_correct = true
 		elseif mix_confirm ~= "n" then
  		print("Please enter either [y] for yes or [n] for no")
 		end
  		until mix_confirm == "y" or mix_confirm == "n"
	end
	TwoPartMetalConfirm()
end

function TwoProcedureCheck ()

	print("Are you planning to [smelt] or [alloy] these metals? \n")
	local two_procedure = io.read()
	
	if two_procedure ~= "smelt" and two_procedure ~= "alloy" then
		print("Please, only enter smelt, or alloy. What else would you be doing?")
		TwoProcedureCheck() 
	end

	if two_procedure == "smelt" then
		TwoPartMetalSmelt()
	elseif two_procedure == "alloy" then
  	TwoPartMetalMix()
	end
end

function TwoSmeltMath()

	-- Metal #1 Purity of remaining material
	local z1 = 1 - two_sp

	-- Metal #1 Weight of pure material
	local mf1 = two_sw * two_sp

	-- Metal #1 Weight of remaining material
	local mz1 = two_sw * z1

	-- Metal #2 Purity of remaining material
	local z2 = 1 - two_stp

	-- Metal #2 Weight of pure material
	local mf2 = two_stw * two_stp

	-- Metal #2 Weight of remaining material
	local mz2 = two_stw * z2

	-- Total Weight of your Alloy
	local ml = two_sw + two_stw

	-- Alloy Weight of remaining material
	local mz3 = mz1 + mz2

	-- Alloy Weight of pure material
	local mf3 = mf1 + mf2

	-- Alloy Purity of remaining Material
	local z3 = mz3 / ml

	-- Alloy Purity
	local f3 = mf3 / ml

	print("Your Alloy has these properties:")
	print(" ")
	print("Total Weight: "..math.round(ml, 3))
	print("Weight of your pure Metal: "..math.round(mf3, 3))
	print("Weight of your remaining Metal: "..math.round(mz3, 3))
	print("Purity of your pure Metal: "..math.round(f3, 3))
	print("Purity of your remaining Metal: "..math.round(z3, 3))
	
	io.read()
	Init()

end

function TwoPartMetalConfirm()

	repeat
		print("Do you want to [In]crease the purity or [De]crease it? \n")
		two_mix_procedure = io.read()

		if two_mix_procedure ~= "In" and two_mix_procedure ~= "De" then
			print("")
			print("Please, if you want to increase the purity, enter 'In'")
			print("Else, if you want to decrease it, enter 'De'")
			print("")
		end

		if two_mix_procedure == "In" then
			TwoMixInMath()
		elseif two_mix_procedure == "De" then
			TwoMixDeMath()
		end
	until two_mix_procedure == "In" or two_mix_procedure == "De"
end

--[[
For variable names, I will be using a short version called
'tmm' for TwoMixMath, 'tmim' for increase
'tmdm' for decrease in purity
For example: 'tmimf' would be the purity value of the TwoMixInMath metal #1
--]]


function TwoMixInMath()
	print("You reached InMath!")
	io.read()
	Init()
end


function TwoMixDeMath()
	print("You reached DeMath!")
	io.read()
	Init()
end


-- THIS IS WHERE THE ACTUAL INPUT STARTS

function Init()
	repeat
		print("Remember, Capitilisation matters!")
		print("")
		print("Are you working with [2] or [3] metals? \n")
	  local metal_count = io.read()

		if metal_count ~= "2" and metal_count ~= "3" then
			print("With all due respect, we both know you aren't working with 4 or more")
	 	end
    
		if metal_count == "2" then
	    TwoProcedureCheck()
		elseif metal_count == "3" then
	  	 print("Sorry, 3 part Alloys are still WIP T-T")
			 io.read()
			 Init()
		end
	until metal_count == "2" or metal_count == "3"
end

-- Initializes the Script
Init()
