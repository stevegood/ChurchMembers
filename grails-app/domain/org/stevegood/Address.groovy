package org.stevegood

import org.stevegood.member.Member

class Address {
    
    String street1
    String street2
    String city
    String state
    String zip
    
    static belongsTo = [Member]
    static hasMany = [members:Member]
    
    static constraints = {
        street1 blank:false
        street2 blank:true, nullable:true
        city blank:false
        state blank:false
        zip blank:false
    }
    
    String toString(){
        label
    }
    
    String format(){
        "$street1 $street2, $city, $state $zip"
    }
}
