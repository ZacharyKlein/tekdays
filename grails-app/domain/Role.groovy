



/**
 * Authority domain class.
 */
class Role implements Serializable {

	static hasMany = [people: TekUser]

	/** description */
	String description
	/** ROLE String */
	String authority

	static constraints = {
		authority(blank: false, unique: true)
		description()
	}
}
