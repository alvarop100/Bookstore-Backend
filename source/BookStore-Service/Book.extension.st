Extension { #name : #Book }

{ #category : #'*BookStore-Service' }
Book class >> authorFrom: aNeoJSon [
	^ Person fromJson: aNeoJSon
]

{ #category : #'*BookStore-Service' }
Book class >> fromJson: aNeoJSon [
	^ (self
		titled: (aNeoJSon at: #title)
		editedBy: (aNeoJSon at: #editorial)
		createdOn: (aNeoJSon at: #releaseYear)
		by:(self authorFrom:(aNeoJSon at: #author)) )
		id: (aNeoJSon at: #id);
		yourself
]

{ #category : #'*BookStore-Service' }
Book class >> neoJsonMapping: mapper [

	mapper for: self do: [ :mapping | mapping mapInstVars: #(id title editorial releaseYear author) ]
]
