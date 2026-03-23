clean:
	flutter clean
	flutter pub get

fetch-main:
	git fetch
	git checkout main
	git pull
	
regen:
	dart run build_runner build -d

staging:
	@echo "🚀 Building 🛠️ STAGING"
	sh build_pub_ipa_adhoc.sh staging
	sh build_pub_apk.sh staging

production:
	@echo "🚀 Building 🛠️ PRODUCTION"
	sh build_pub_ipa_adhoc.sh production
	sh build_pub_apk.sh production

staging-android:
	sh build_pub_apk.sh staging

staging-ios:
	sh build_pub_ipa_adhoc.sh staging

production-android:
	sh build_pub_apk.sh production

production-ios:
	sh build_pub_ipa_adhoc.sh production

release:
	@echo "🚀 Building 🏰 RELEASE"
	sh build_pub_ios.sh production
	sh build_pub_aab.sh production
