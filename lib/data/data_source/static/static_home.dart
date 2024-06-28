import '../../../core/constants/image_asset.dart';
import '../../models/onboardingmodel.dart';

List<OnBoardingModel> homeList = [
  OnBoardingModel(
    title: "🌿Detect Plant Diseases",
    body:
        "Snap a photo to identify plant diseases. Perfect for gardeners and farmers to maintain healthy plants.",
    image: AppImageAsset.homeImage1,
  ),
  OnBoardingModel(
    title: "🤖 Automate Monitoring",
    body:
        "Use our robot to take plant photos. Results appear directly on your mobile for easy monitoring.",
    image: AppImageAsset.homeImage2,
  ),
  OnBoardingModel(
    title: "💬 Community Chat",
    body:
        "Share experiences and get advice from fellow gardeners and farmers. Grow together!",
    image: AppImageAsset.homeImage3,
  ),
];

List<String> categoriesList = [
  'All',
  'Fragrance',
  'Makeup',
  'Hair',
  'Skincare'
];
