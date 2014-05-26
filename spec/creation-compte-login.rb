require 'capybara/rspec'
require 'capybara/webkit'

feature 'Créer un compte et se connecter' do
    
    scenario 'creer un compte' do
        visit '/'
        click_on 'Sign up | Sign in'
        page.should have_content "Identification"
        
        click_on "Créer un compte"
        page.should have_content "Création de compte"
        
        
        fill_in 'Nom', :with => 'Jefferson'
        fill_in 'Prénom', :with => 'Jack'
        fill_in 'Pseudo', :with => 'JJ117'
        fill_in 'login / email', :with => 'jack.jefferson@oss117-espion.fr'
        fill_in 'Confirmation d\'adresse mail', :with => 'jack.jefferson@oss117-espion.fr'
        fill_in 'Mot de passe', :with => 'noel'
        fill_in 'Confirmation de mot de passe', :with => 'noel'
        fill_in 'Téléphone (facultatif)', :with => '0600700117'
        check 'J\'accepte la charte de la communauté'
        
        click_on 'Créer le compte'
        page.should have_content "Votre compte a été créé avec succès"
    end
    
    scenario 'se connecter' do
        visit '/'
        click_on 'Sign up | Sign in'
        fill_in 'login / email', :with => 'jack.jefferson@oss117-espion.fr'
        fill_in 'Mot de passe', :with => 'noel'
        click_on 'Connexion'

        page.should have_content "Bonjour Jack Jefferson"
    end
    
end
