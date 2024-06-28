import '../../../core/constants/image_asset.dart';
import '../../models/onboardingmodel.dart';

List<OnBoardingModel> onBoardingList = [
  OnBoardingModel(
      title: "🌿Detect Plant Diseases",
      body:
          "Snap a photo to identify plant diseases. Perfect for gardeners and farmers to maintain healthy plants.",
      image: AppImageAsset.onBoardingImageOne,
      text: 'Magnified  View'),
  OnBoardingModel(
      title: "🤖 Automate Monitoring",
      body:
          "Use our robot to take plant photos. Results appear directly on your mobile for easy monitoring.",
      image: AppImageAsset.onBoardingImageTwo,
      text: 'Detailed  View'),
  OnBoardingModel(
      title: "💬 Community Chat",
      body:
          "Share experiences and get advice from fellow gardeners and farmers. Grow together!",
      image: AppImageAsset.onBoardingImageThree,
      text: 'Clear  View'),
];
