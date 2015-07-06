package dto;

public class Customer {

	private Long id;
	private String firstName;
	private String lastName;
	private String birthDate;
	private String addressLine1;
	private String addressLine2;
	private String addressLine3;

	private String greeting;
	private String emailAddress;
	private Boolean goldMember;
	private String postcode;

	private String username;
	private String password;
    private Boolean admin;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

    public Boolean getAdmin() {
        return admin;
    }

    public void setAdmin(Boolean admin) {
        this.admin = admin;
    }


    public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}


	public String getAddressLine1() {
		return addressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}

	public String getAddressLine2() {
		return addressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}

	public String getAddressLine3() {
		return addressLine3;
	}

	public void setAddressLine3(String addressLine3) {
		this.addressLine3 = addressLine3;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public Boolean isGoldMember() {
		return goldMember;
	}

	public Boolean getGoldMember() {
		return goldMember;
	}

	public void setGoldMember(Boolean goldMember) {
		this.goldMember = goldMember;
	}

	public String getGreeting() {
		return greeting;
	}

	public void setGreeting(String greeting) {
		this.greeting = greeting;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

    public boolean isAdmin(){
        return admin;
    }
    
    @Override
    public String toString(){
    	
    	String toString = getId().toString()+ " " + getFirstName() + " " + getLastName();
    	
    	return toString;
    }

}
