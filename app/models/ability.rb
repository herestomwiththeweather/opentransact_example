class Ability
  include CanCan::Ability

  def initialize(person)
    can [:read,:create], Asset
    can [:update,:destroy], Asset, person_id: person.id

    can :read, Transact do |t|
      person.id == t.payer_id || person.id == t.payee_id
    end
    can :create, Transact
    can :destroy, Transact, person_id: person.id

    can [:read,:update,:destroy], Client, person_id: person.id
    can :create, Client
  end
end
