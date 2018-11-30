# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#  
I18n.locale = :en
Ambassador.create(firstname: "Sébastien", lastname: "Bras", source_id: 1544, company_name: "Bras", mailer_summary: "En réservant dans notre établissement, vous venez d’offrir la possibilité à des enfants népalais de manger un repas chaud par jour dans leur école",  email: "sebastien@guestonline.com", mailer_description: "")


Ambassador.create(firstname: "Olivier ", lastname: "Roellinger", source_id: 6330, company_name: "Maison de Bricourt", mailer_summary: "", mailer_description: "Liberté et solidarité guident la démarche tant professionnelle que personnelle de notre famille. Le modèle de Réservation Responsable répond à nos valeurs afin d’être connecté, solidaire et libre", email: "olivier.@guestonline.com")

Ambassador.create(firstname: "Vincent", lastname: "Leroux", source_id: 4544, company_name: "Paul Bocuse - Collonges", mailer_summary: "", mailer_description: "L’initiative s’inscrit parfaitement dans les valeurs que nous souhaitons véhiculer : Partage, Transmission et Solidarité.
« Seul on va plus vite, ensemble on va plus loin. »", email: "vincent@guestonline.com")


Ambassador.create(firstname: "André", lastname: "Terrail", source_id: 1997, company_name: "Tour d'Argent", mailer_summary: "", mailer_description: "La Tour, grâce à ses clients s’engage dans la Réservation Responsable pour que tous nos petits efforts servent de grandes causes. Chaque petite réservation web se transforme dorénavant en action solidaire…", email: "andre@guestonline.com")
