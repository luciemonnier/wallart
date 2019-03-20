# encoding: utf-8
require 'faker'

puts 'patiente un peu ça seed!'
Rental.delete_all
Photo.delete_all
Tagging.delete_all
Media.delete_all

puts '...'


100.times do
  media = Media.new(
    title: Faker::Book.unique.title,
    artist: Artist.all.sample,
    subscription_type: SubscriptionType.all.sample,
    category: Category.all.reject{|category| category.name == "Vidéo"}.sample,
    price: (1000..1000000).to_a.sample,
    description: Faker::Lorem.paragraph,
    portrait: [true, false].sample
  )
  media.save
end

puts '...'

medias = Media.all
urls = [#'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552491461/kfu5w0okaee1wjeahb5m.jpg',
        # 'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552491373/nrmxjcakoxmtsrym3m9g.jpg',
        #'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552491176/k9qdv08rk4zfkftq0bfs.jpg',
        #'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552490740/zjazgxmhqsjf7xclgce3.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552472145/cassius-boi-426294-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552472145/cassius-boi-426294-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552642998/roman-kraft-1437483-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552643004/ozzie-stern-1437740-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552643004/christoph-rucker-1437621-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552642995/chrissa-giannakoudi-1435555-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552642995/gabrielle-baritaud-figueroa-1437484-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552643374/brian-mcmahon-1436229-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552643371/ameer-basheer-1435648-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552643361/anton-shuvalov-1437235-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552643004/christoph-rucker-1437621-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552643439/wolfgang-rottmann-1437397-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552643439/sandro-gonzalez-1435273-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552643432/steven-wei-1437134-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552643428/utku-ozen-1435365-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552643426/stefan-rodriguez-1435710-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552643426/milica-spasojevic-1434567-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552643411/milica-spasojevic-1434569-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552643410/marcos-felipe-1435294-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552643409/drew-beamer-1435472-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552643409/milica-spasojevic-1434565-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552643408/hannah-reding-1437495-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552643403/florencia-viadana-1437433-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552643398/eberhard-grossgasteiger-1435352-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552643398/greg-rosenke-1431545-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552643393/laurentiu-morariu-1431464-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552643389/hannah-reding-1437493-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552643379/carl-j-1433368-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552643379/gabrielle-baritaud-figueroa-1437485-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552643374/brian-mcmahon-1436229-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552643371/ameer-basheer-1435648-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552643361/anton-shuvalov-1437235-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552644113/adrian-trinkaus-1436883-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552644109/adam-muise-1431323-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552644112/steve-johnson-1435536-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552644113/richard-lee-1435775-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552644113/emeric-1435672-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552644111/husen-siraaj-1434623-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552644110/fabian-moller-1436353-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552644105/lars-millberg-1435062-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552644105/lars-millberg-1435062-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552644104/paula-may-1436366-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552644099/james-peacock-1432733-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552644094/rob-coates-1433558-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552644089/paulo-evangelista-1434830-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552644088/maksim-istomin-1430998-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552644087/bruce-warrington-1431498-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552644086/greg-rosenke-1431547-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552644085/george-tasios-1434735-unsplash.jpg',
        'https://res.cloudinary.com/dqkmjxwwb/image/upload/v1552644079/erzsebet-vehofsics-1435308-unsplash.jpg'
      ]
(0..100).to_a.each do |number|
  photo = Photo.new(
    media: medias[number],
  )
  photo.remote_url_url = urls.sample
  photo.save
end

puts '...'

500.times do
  tagging = Tagging.new(media: medias.sample, tag: Tag.all.sample)
  tagging.save
end

puts "et voilà c'est fini, vas voir le beau site!!"
