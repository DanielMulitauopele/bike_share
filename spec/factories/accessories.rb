FactoryBot.define do
  factory :accessory do
      title {'Thing1'}
      description {'A thing for your bike'}
      price {30}
      status {0}
      image {'default-image.jpg'}
  end
end
