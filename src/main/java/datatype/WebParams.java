package datatype;

public class WebParams {
	String website;
	String page;
	String pageAccessType;
	String referrer;
	String Year;
	String MonthOfYear;
	String DayOfMonth;
	String HourOfDay;
	String MinuteOfHour;
	String SecondOfMinute;
	String IPAddress;
	String UserAgentBrowser;
	String UserAgentOS;
	String UserID;
	String UserName;
	String DurationPageVisit;
	String Timestamp;
	
	
	
	public WebParams(String website, String page, String pageAccessType,
			String referrer, String year, String monthOfYear,
			String dayOfMonth, String hourOfDay, String minuteOfHour,
			String secondOfMinute, String iPAddress, String userAgentBrowser,
			String userAgentOS, String userID, String userName,
			String durationPageVisit, String timestamp) {
		super();
		this.website = website;
		this.page = page;
		this.pageAccessType = pageAccessType;
		this.referrer = referrer;
		Year = year;
		MonthOfYear = monthOfYear;
		DayOfMonth = dayOfMonth;
		HourOfDay = hourOfDay;
		MinuteOfHour = minuteOfHour;
		SecondOfMinute = secondOfMinute;
		IPAddress = iPAddress;
		UserAgentBrowser = userAgentBrowser;
		UserAgentOS = userAgentOS;
		UserID = userID;
		UserName = userName;
		DurationPageVisit = durationPageVisit;
		Timestamp = timestamp;
	}
	
	
	public WebParams() {
		this.pageAccessType="clickthrough";
	}
	
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getPageAccessType() {
		return pageAccessType;
	}
	public void setPageAccessType(String pageAccessType) {
		this.pageAccessType = pageAccessType;
	}
	public String getReferrer() {
		return referrer;
	}
	public void setReferrer(String referrer) {
		this.referrer = referrer;
	}
	public String getYear() {
		return Year;
	}
	public void setYear(String year) {
		Year = year;
	}
	public String getMonthOfYear() {
		return MonthOfYear;
	}
	public void setMonthOfYear(String monthOfYear) {
		MonthOfYear = monthOfYear;
	}
	public String getDayOfMonth() {
		return DayOfMonth;
	}
	public void setDayOfMonth(String dayOfMonth) {
		DayOfMonth = dayOfMonth;
	}
	public String getHourOfDay() {
		return HourOfDay;
	}
	public void setHourOfDay(String hourOfDay) {
		HourOfDay = hourOfDay;
	}
	public String getMinuteOfHour() {
		return MinuteOfHour;
	}
	public void setMinuteOfHour(String minuteOfHour) {
		MinuteOfHour = minuteOfHour;
	}
	public String getSecondOfMinute() {
		return SecondOfMinute;
	}
	public void setSecondOfMinute(String secondOfMinute) {
		SecondOfMinute = secondOfMinute;
	}
	public String getIPAddress() {
		return IPAddress;
	}
	public void setIPAddress(String iPAddress) {
		IPAddress = iPAddress;
	}
	public String getUserAgentBrowser() {
		return UserAgentBrowser;
	}
	public void setUserAgentBrowser(String userAgentBrowser) {
		UserAgentBrowser = userAgentBrowser;
	}
	public String getUserAgentOS() {
		return UserAgentOS;
	}
	public void setUserAgentOS(String userAgentOS) {
		UserAgentOS = userAgentOS;
	}
	public String getUserID() {
		return UserID;
	}
	public void setUserID(String userID) {
		UserID = userID;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getDurationPageVisit() {
		return DurationPageVisit;
	}
	public void setDurationPageVisit(String durationPageVisit) {
		DurationPageVisit = durationPageVisit;
	}
	public String getTimestamp() {
		return Timestamp;
	}
	public void setTimestamp(String timestamp) {
		Timestamp = timestamp;
	}


	@Override
	public String toString() {
		return website + "," + page + "," + pageAccessType + "," + referrer
				+ "," + Year + "," + MonthOfYear + "," + DayOfMonth + ","
				+ HourOfDay + "," + MinuteOfHour + "," + SecondOfMinute
				+ "," + IPAddress + "," + UserAgentBrowser + ","
				+ UserAgentOS + "," + UserID + "," + UserName + ","
				+ DurationPageVisit + "," + Timestamp +"";
	}
	
	
	
}
