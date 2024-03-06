library widgets;

import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart' as html;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/helpers/shield_model.dart';

part './app_bars/icon_logo_image_app_bar.dart';

part './app_bars/icon_title_icon_app_bar.dart';

part './loaders/loader_app_dialog.dart';

part './tappable_texts/custom_tappable_text.dart';

part './text_fields/custom_text_form_field.dart';

part 'alert_card/alert_card.dart';

part 'app_bars/icon_image_text_icon_align_left_app_bar.dart';

part 'app_bars/vertical_title_app_bar.dart';

part 'badge/badge_background.dart';

part 'badge/badge_japan.dart';

part 'badge/badge_one_japan.dart';

part 'badge/custom_badge_widget.dart';

part 'banners/icon_text_banner.dart';

part 'bluetooth_state/bluetooth_state.dart';

part 'boost/boost_component.dart';

part 'boost/boost_details.dart';

part 'boost/boost_widget.dart';

part 'bottom_navigation_bar/custom_bottom_navigation_bar.dart';

part 'buttons/button.dart';

part 'buttons/button_width.dart';

part 'buttons/button_with_image_background.dart';

part 'card/card_discount_percentage.dart';

part 'card/custom_card_item.dart';

part 'card/status_card.dart';

part 'challenge_card_japan/challenge_card_japan.dart';

part 'challenge_item_card/challenge_item_card.dart';

part 'challenge_item_card/challenge_item_demo.dart';

part 'challenge_item_card/challenge_item_image.dart';

part 'challenge_item_card/teams_participants_days.dart';

part 'chart/aw_simple_chart.dart';

part 'chart/custom_chart.dart';

part 'chart/custom_interval_chart.dart';

part 'checkbox/checkbox_text_item.dart';

part 'co2_ranking/co2_ranking_widget.dart';

part 'consents_list_item/consents_list_item.dart';

part 'custom_stepper/custom_stepper.dart';

part 'default_page/default_page.dart';

part 'dialogs/full_page_dialog.dart';

part 'dialogs/info_popup_dialog.dart';

part 'dialogs/simple_dialog.dart';

part 'dialogs/two_button_dialog.dart';

part 'dialogs/typed_dialog.dart';

part 'discount_square_score/discount_square_score.dart';

part 'dot/dot.dart';

part 'drawer/custom_drawer.dart';

part 'drawer_list_item/custom_drawer_list_item.dart';

part 'faq_list_item/faq_list_item.dart';

part 'geofence/geofence_list_item.dart';

part 'geofence/tappable_google_place.dart';

part 'inbox/inbox_list_item.dart';

part 'inbox/inbox_reply_item.dart';

part 'inbox/inbox_reply_item_new.dart';

part 'leaderboard/leaderboard_item.dart';

part 'leaderboard/leaderboard_widget.dart';

part 'linear_percentage_bar_with_points/linear_percentage_bar_with_points.dart';

part 'linear_percentage_with_labels_and_image/linear_percentage_with_labels_and_image.dart';

part 'modal_sheet/custom_modal_sheet.dart';

part 'news_list_item/demo_news_item.dart';

part 'news_list_item/news_vertical_list_item.dart';

part 'next_previous_widget/next_previous_widget.dart';

part 'no_data_indicator/no_data_indicator.dart';

part 'odometer/odometer_item.dart';

part 'open_container_widget/aw_open_container_widget.dart';

part 'page_view_indicator/page_view_indicator_dots.dart';

part 'parental_control/info_segment_item.dart';

part 'parental_control/parental_control_list_item.dart';

part 'permissions_page_view_item/permissions_page_view_item.dart';

part 'policy/completition_data.dart';

part 'policy/policy_actions_item.dart';

part 'policy/policy_data.dart';

part 'policy/policy_details_item.dart';

part 'policy/policy_popup_item.dart';

part 'policy/policy_score_item.dart';

part 'policy_cards/amodo_banner.dart';

part 'policy_cards/basic_policy_card.dart';

part 'policy_cards/dynamic_premium_card.dart';

part 'prevent/pentagon.dart';

part 'prevent/pentagon_outline.dart';

part 'privileges_item/privileges_item.dart';

part 'prize_item/prize_item.dart';

part 'prize_item/prize_item_demo.dart';

part 'prize_item/prize_item_image.dart';

part 'progress_percentage_bar/progress_percentage_bar.dart';

part 'progress_percentage_bar/progress_percentage_bar_engagement.dart';

part 'quote/quote_navbar.dart';

part 'reward_contest_card/reward_contest_card.dart';

part 'risk_card_item/risk_card_item.dart';

part 'segment_item/custom_segment.dart';

part 'selectable_list/selectable_list.dart';

part 'settings/settings_group_item.dart';

part 'settings_profile_sections/profile_data_tappable_item.dart';

part 'settings_profile_sections/settings_section.dart';

part 'settings_profile_sections/settings_section_item.dart';

part 'shield_card/aw_shield_card.dart';

part 'shield_card/aw_shield_home_page_card.dart';

part 'shield_card/aw_shield_porsche_card.dart';

part 'statistic_item/custom_statistic_item.dart';

part 'statistic_item/daily_stats_item.dart';

part 'statistic_item/demo_statistic_item.dart';

part 'supervisions/master_supervision_item.dart';

part 'supervisions/supervision_checkbox_item.dart';

part 'switches/switch_with_title_description.dart';

part 'switches/switch_with_title_description_input_field.dart';

part 'tab_bar/tab_bar_widget.dart';

part 'text/fitted_text_widget.dart';

part 'text_fields/underline_text_form_field.dart';

part 'top_contributor_item/top_contributor_item.dart';

part 'training/training_element_achievement.dart';

part 'training/training_element_achievement_japan.dart';

part 'training/training_element_news.dart';

part 'training/training_element_progress_japan_widget.dart';

part 'training/training_progress_bar.dart';

part 'training/training_widget.dart';

part 'trips/google_map.dart';

part 'trips/trip_list_item.dart';

part 'trips/trip_list_item_demo.dart';

part 'trips/trip_list_item_japan.dart';

part 'trips/trip_stat_item.dart';

part 'trips/trip_static_image.dart';

part 'validations/validation_message_item.dart';

part 'validations/validation_messages.dart';

part 'vouchers/one_product_voucher_item.dart';

part 'vouchers/voucher_box_labels.dart';

part 'vouchers/voucher_list_item.dart';

part 'filter_aig_component/filter_aig_component.dart';
