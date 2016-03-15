#Crazylark's
#Api Document
_if u wander more [click here](https://github.com/Linging/Crazylark)_
---
* ##Mobile number Authentication
	* Description
	 >When user input his mobile number , browser send a json make sure that this mobile has not been signed. 

	* Http request
	
		`POST http://localhost:port/api/users`
	* Query Parameter
	
		`[`
		
		`{`
		

		`"mobile_number": 15908155675`
		
		`}`
		
		`]`
		
---
* ##Message Authentication
	* Description
	 >Server has send a massage to current user's mobile phone including a 6-bit authentic number.And user need to input this number correctly .

	* Http request
	
		`POST http://localhost:port/api/users`
	* Query Parameter
	
		`[`
		
		`{`
		

		`"mobile_number": 15908155675`
		
		`"message": 123456`
		
		`}`
		
		`]`  
		
---
* ##CD-key Authentication
	* Description
	 > Make sure user has payed.

	* Http request
	
		`POST http://localhost:port/api/users`
	* Query Parameter
	
		`[`
		
		`{`
		

		`"mobile_number": 15908155675`
		
		`"message": 123456`
		
		`"key": DAW67GDASL8K`
		
		`}`
		
		`]`  

---




