Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C63C6468D64
	for <lists+linux-leds@lfdr.de>; Sun,  5 Dec 2021 22:01:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239107AbhLEVEc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 5 Dec 2021 16:04:32 -0500
Received: from mail-mw2nam10olkn2095.outbound.protection.outlook.com ([40.92.42.95]:30305
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238875AbhLEVEc (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 5 Dec 2021 16:04:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CrAPvx1AuZQ8hYgKH6fy3tub66GYh1jHJGp3rGq9r/mnq+2wIQXS4lbkhq9ht2Ohz1YDAr2rd16+Z4JRACOB8QKAp8+o4tTJczaST5SvpfIegH3kjJ3jvwjivHtp0PAgrnjihmOMXG+aceRAuk66B0h/HhYRBhVfgVuOHAMEKumSpmFO0VXJS4NCvM4xlfdyiS/JuMVcnw+rbVnpWUsjheHsksiDNqMO+4VnIakmJKK4MZzM/pkHFg9NazmfQ+IeZvsbqgYQzYyz+vK8TkpckcI24Efzs85DNhw1Hl2dzxf4T+cFHBuBIvRnY4GabTvpLoLSJnYIY/BLXrbPEMqd+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiAZz8vji255FILfjGARXmt9N8f6E/SmoiUH482dX8g=;
 b=l8rcz0DM+n5UvNY+Wb6KrkL0Cxm28DxNrd4gOvfW7OjDNAwztsP8YIwXNJTUiriVQn3tayz4m3mB3yUV/yJ30o7Zp82RGQLhcWJkyFELwEkFazjYufVRupp5u1D0zjgp6ep1nY4TM1xvkbt5hHkyiZEAmWK/IHw1HvdzEzRVRcZHy7q8IC9gG0mpgyUGkmYVgfHDq95o1G2nBKSgXtevawj+Gu64yEx2GiYD9BgYJK78+kHLah91eDnAdtpIJtV5+xUszeJ02Z2cPtpTgTLbHZ0IObagwqxFGrl9oO8lrZlh1hhw/7sqjs60EPZY2ZYKKsOS2voBRu4X6DL7PvqibQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NiAZz8vji255FILfjGARXmt9N8f6E/SmoiUH482dX8g=;
 b=roNj++KZSRDhwhM58Gf8hJzGhmQBeyvG8nFpaF/qDBZ5XBgGw+1so/oVKsEQUBy3cXtaMmGEc4NPX2fGCUF+oyRTtNRDTmaNPROljwiRXcLDMNf9pQLF6gXi1apaeWVSPZD9yGTg9Qw+vdvQi9KubXvR4DbIJ64VFMVGYSBe2vl4/mgWpsAtOprtV4QqoCHAiC8D+Hg1IidNsuZjdvqm0JL6RJNUMs82pwFhyXNVd0hB3CulcqbstlQoVio3skoPtXZLTKyekDCvMY3yvnPBBkZ/UagHbVS9fBhdY0iJWNwKfnyQC/Tk6zsTgMSJFReqiGxWnsxjUH7tdvWkjPZxjA==
Received: from BY5PR04MB6327.namprd04.prod.outlook.com (2603:10b6:a03:1e8::20)
 by BY5PR04MB6851.namprd04.prod.outlook.com (2603:10b6:a03:220::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Sun, 5 Dec
 2021 21:01:03 +0000
Received: from BY5PR04MB6327.namprd04.prod.outlook.com
 ([fe80::2929:5741:e81e:1d4]) by BY5PR04MB6327.namprd04.prod.outlook.com
 ([fe80::2929:5741:e81e:1d4%5]) with mapi id 15.20.4755.021; Sun, 5 Dec 2021
 21:01:01 +0000
From:   bernardocrodrigues@live.com
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org,
        Bernardo Rodrigues <bernardocrodrigues@live.com>
Subject: [PATCH] leds: pca963x: fix blink with hw acceleration
Date:   Sun,  5 Dec 2021 18:00:49 -0300
Message-ID: <BY5PR04MB6327FCAC33A75918EA3B65B9A56C9@BY5PR04MB6327.namprd04.prod.outlook.com>
X-Mailer: git-send-email 2.32.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN:  [dWff0CuzRu7iW9Nm3/IvyuHZ1VbAP51vIgog9BTDEVZ3pXHDcUeWeBeOat9y4/57]
X-ClientProxiedBy: CP2PR80CA0179.lamprd80.prod.outlook.com
 (2603:10d6:102:15::21) To BY5PR04MB6327.namprd04.prod.outlook.com
 (2603:10b6:a03:1e8::20)
X-Microsoft-Original-Message-ID: <20211205210049.131209-1-bernardocrodrigues@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from bcr-XPS-15-9560 (2804:431:cfcc:8f94:739:b913:5c4c:85ba) by CP2PR80CA0179.lamprd80.prod.outlook.com (2603:10d6:102:15::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend Transport; Sun, 5 Dec 2021 21:01:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ba5291d-05be-4cd4-1807-08d9b8325817
X-MS-Exchange-SLBlob-MailProps: DJLbvgWm8MYAJWQYOsfUse+p/t3b4blxiTdpy8SCxMeymZsNFDwnghy3fIV45j9qJ+6qvRrgjZU5Mj1xQX3flrQO8e6ZyJcCa6FT78YFiAEm5w2vhnpiQfYgSMRiPSizi5EMsKiWNehnvtsq1gYVRQ6CQlhT5aIg+riviUKqaFfJ4saHMoAh/JBb7McskI1xw/M4m57SkPxaLkwoZkj0R2EEQv2SWeYLk9txxoNyQEp+7DIY0P7/S7Kkh/jFMZp6KT910VshsKRgponpTaXKeSsac6ukW6Kxm6a5E+AEJp38DKhCs87J8kDRLNE7vhLQQfTtEYwxhQSxDhIm5rqMSV/++PCpoA2Rq1RVbu3mXkLTNfgtBGJf0529WxrIF9isLQ3VG2YIhVX0hyLknJDlwGeTgsbJh/Q4B7AJrY/FgcC/OtuL8hUOi4cqrJ3uV6gPz4k5B/RZ/LCouDvYiRQ2YCUvjnSOwIuEXmX0IfYbs+vvM5cO+AhDAv8CbXakl4lMoIAACx1vAny0SYk58YK2nGYPa5kEFnUAvppB7guIi3/+rIu/e42xo77RYsvR8ZUE58V0wre1JiXx/lLt+GOzXIkiQq1r0b/bHCwxsBg4M/VkorrIJZeFKv4IVvq40plYTvpux11q9A+NM0gGlAmoFuxcpZ5uD5tG4o/CF5sFIC9mfqyBDOwXwsCCcCzWHpRGef+U8xpTJ6OUeQQ8GDQ0wQ==
X-MS-TrafficTypeDiagnostic: BY5PR04MB6851:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EKsMbYbU1euHS2+iLvySSlhbOBr6qz5B6BtQEcBl67Usfx2Q2YwT+FyS/qDfffM6qveYcTfVAHg6l4SkXnz/M4esc6/e+z8hkKvl2oddXY8IwsKmLn1gS3C4aYo/x2mrseDYlvqRhLIuWKYH9FT/FUqYUJroTl8Qt72lSTwztJE7rBykmbThwJVbP4r4wnoGW8Dbc6DQBECSssFtJMkqc068yyY29LOBKKUK0y97JV2fWCIXL9OarMojDQ4nDG26DzFBrOf4G0iFGvqtHqkxtNPSqF4aF9nI4DJ4xfv03tuMGGo6rztQ+Aj5yyDVknzUNWxXhQE/6J6aQ6zLyCMCVOLvQ3ZA+YZfvb0rU3dtPyEn4O9k6pJzxo2peZmdM4DhJKT+91uh+HuBBWLhLWOkPFv71c4VszQBraU2oiPhZiJ7fZd5eWCFJ9PlngFv5XR7Kvp3v+0l+wNEAfov+n2l2XuYwvM8b27dkH4fEqYi8x4MjP5L0HmuvJofUKYhvNEEMngM2HlCB4sd7OSwpedJg2vii8ILlEa8bze1VDuI7BL6Jf+vnwMb2uVwUvQlvqMZp3ScOt+hEsGFGGpFBHsTeA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M1HVVNFu5Vy3C51J0lBLcGSdjZyXeEHwPNcnTcF97Iq2aIYMRhSAJqSgbZv+?=
 =?us-ascii?Q?7pMYts9wpZ2C2BrwNAAWO65C0Ge+CocK2pnC7hX14Y2EIFwUf5R568R+Thbw?=
 =?us-ascii?Q?NO4gZYkhEtPXORYx08QUnTmWxuXLdmu+ZpwmHNI2O5jrU8u4/fhreDR4zKLf?=
 =?us-ascii?Q?/lKQypX1gE26Wo//NU9jf8R+kC85MavnlnCeTnBgCkyF9t+qMzA1FD3u5lQ3?=
 =?us-ascii?Q?tzk/KAWvZXBddbtivRXDKwjuX5D6A1E8Bw5XAXutyCO1Y8lee9aO+w2L8GVO?=
 =?us-ascii?Q?7H6jfQ6c1pKKyLJmCPX/XZqIdsNSHHGjEVy1Y3Xydvw5Sszqz343rx3HR8L9?=
 =?us-ascii?Q?EYYnVrmSAzrAfmQwYcVryEyONcdfPxt+xtBgkfO3Ys8ToEP22QgGg1j+G3E8?=
 =?us-ascii?Q?uE59S/PsC7kHAMOr2VBICkYlujaqqzpccfbbedZkpyCSKSTZ8gM4lNJrlhcf?=
 =?us-ascii?Q?yxEeW546y2MItraH46D2fxhHit+A7yA5P6YMHZ2pnZaNf99SsUeGd+xEgl6r?=
 =?us-ascii?Q?doE2PYoodiTcpNGXQVAT+FchUWdL8/J/2CQc8jwP8WXTreEEEgvAmLzYLvEI?=
 =?us-ascii?Q?8+2ajriNMt3iG8driKXxtW5yykJGS4Ah4FTLKKr4Yb0row/xUauXSaZiAfHr?=
 =?us-ascii?Q?PjA9ONThxxvi32Q01oOKIBAGPNDZ8NpylprQXHuyKQ35I1fbQQOLYuY/CCAb?=
 =?us-ascii?Q?XveeBQUtnyYDrKVB71Xt0av4nh7vwk4W/kfFHrBUcxdTOhCAwNziKmlo4OjK?=
 =?us-ascii?Q?/kIZstTbSWs5S8R5Sa55ZmsY012FWDLsB7svztGInckntoHSRv4bXk0R5WuS?=
 =?us-ascii?Q?Q/ChG9JVrx+ZGzhxyRUPX230WHXCsEpRAhWSG5we7PWuMNX/MVyOZ3OrDyHx?=
 =?us-ascii?Q?KaoXVV4KpvAo0SEgCKzC2Dq/KteUthbysfnN8pXfxDsa22tkuhjn1R5zIV5e?=
 =?us-ascii?Q?6nJGnWjj4AYU2tGNajoHl2PW82sbDO9oaWjQO3SyRhFbUgrdWbmVBrBxV25h?=
 =?us-ascii?Q?rtXYV7aogJKuDzvbuCviyM3DxA=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-edb50.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba5291d-05be-4cd4-1807-08d9b8325817
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6327.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2021 21:01:01.9342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6851
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Bernardo Rodrigues <bernardocrodrigues@live.com>

LEDs would behave differently depending on the blink hardware
acceleration configuration. This commit will make LEDs respond exactly
the same independently of the hardware acceleration status.

In other words, if you had two pca963x, side by side, one with blink
hardware acceleration "ON" and the other "OFF; and performed some
arbitrary sequence of API calls (e.g. turn on/off, change brightness,
change blink mode, etc.) you probably would end with not matching LED
states.

'pca963x software blink' and 'leds-gpio' behavior were used as
reference.

Actual chip used to validate this change: pca9634

Some of the unmatched behaviors being fixed are (when hw blink was "ON")
    - Leds would stop blinking when the brightness was changed.
    - Leds would persist their blinking mode even after being
      turned off (brightness = 0).
    - Leds would only blink if another led was solid (pca963x will be
      forced out of low power)

Signed-off-by: Bernardo Rodrigues <bernardocrodrigues@live.com>
---
 drivers/leds/leds-pca963x.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index 00aecd67e348..d8d866bcda19 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -101,6 +101,7 @@ struct pca963x_led {
 	struct pca963x *chip;
 	struct led_classdev led_cdev;
 	int led_num; /* 0 .. 15 potentially */
+	bool blinking;
 	u8 gdc;
 	u8 gfrq;
 };
@@ -129,12 +130,21 @@ static int pca963x_brightness(struct pca963x_led *led,
 
 	switch (brightness) {
 	case LED_FULL:
-		val = (ledout & ~mask) | (PCA963X_LED_ON << shift);
+		if (led->blinking) {
+			val = (ledout & ~mask) | (PCA963X_LED_GRP_PWM << shift);
+			ret = i2c_smbus_write_byte_data(client,
+						PCA963X_PWM_BASE +
+						led->led_num,
+						LED_FULL);
+		} else {
+			val = (ledout & ~mask) | (PCA963X_LED_ON << shift);
+		}
 		ret = i2c_smbus_write_byte_data(client, ledout_addr, val);
 		break;
 	case LED_OFF:
 		val = ledout & ~mask;
 		ret = i2c_smbus_write_byte_data(client, ledout_addr, val);
+		led->blinking = false;
 		break;
 	default:
 		ret = i2c_smbus_write_byte_data(client,
@@ -144,7 +154,11 @@ static int pca963x_brightness(struct pca963x_led *led,
 		if (ret < 0)
 			return ret;
 
-		val = (ledout & ~mask) | (PCA963X_LED_PWM << shift);
+		if (led->blinking)
+			val = (ledout & ~mask) | (PCA963X_LED_GRP_PWM << shift);
+		else
+			val = (ledout & ~mask) | (PCA963X_LED_PWM << shift);
+
 		ret = i2c_smbus_write_byte_data(client, ledout_addr, val);
 		break;
 	}
@@ -181,6 +195,7 @@ static void pca963x_blink(struct pca963x_led *led)
 	}
 
 	mutex_unlock(&led->chip->mutex);
+	led->blinking = true;
 }
 
 static int pca963x_power_state(struct pca963x_led *led)
@@ -275,6 +290,8 @@ static int pca963x_blink_set(struct led_classdev *led_cdev,
 	led->gfrq = gfrq;
 
 	pca963x_blink(led);
+	led->led_cdev.brightness = LED_FULL;
+	pca963x_led_set(led_cdev, LED_FULL);
 
 	*delay_on = time_on;
 	*delay_off = time_off;
@@ -337,6 +354,7 @@ static int pca963x_register_leds(struct i2c_client *client,
 		led->led_cdev.brightness_set_blocking = pca963x_led_set;
 		if (hw_blink)
 			led->led_cdev.blink_set = pca963x_blink_set;
+			led->blinking = false;
 
 		init_data.fwnode = child;
 		/* for backwards compatibility */
-- 
2.32.0

