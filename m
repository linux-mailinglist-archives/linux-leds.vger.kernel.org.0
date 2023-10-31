Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC44C7DCB96
	for <lists+linux-leds@lfdr.de>; Tue, 31 Oct 2023 12:16:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbjJaLQ2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 31 Oct 2023 07:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbjJaLQ0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 31 Oct 2023 07:16:26 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01olkn2023.outbound.protection.outlook.com [40.92.99.23])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9302DF
        for <linux-leds@vger.kernel.org>; Tue, 31 Oct 2023 04:16:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UpuNwOG+auBy4byI4QtydCLy0aCdOdhUAbSvsWM1suRMM3YTisq1kG/jM+05QRuZQnY2kfpY3birY+MlIQ2uzHemB1QZXkbRFoCXN3g/lc98dS6/srVAXIvO0Cn3kXYF1c+1G/b3WmQ8JvmH3zRHy8vMIvD4XUKsawMsOHNKoCYzzPSJc4yhkStOIw5lQWpg2F0GbnzTH0qqKcvumpXdZAJOv8Fjb/E6oHoMZJAPBv/YEXC1ryLTDTrllW66IJPiZQ0Uak1t2fbq79V+FhOS7KDDud4pBfVLPvdC77n9ezMqS9h+K0oKqmU7Xi+ACVrIfHTq7qRgfUEcTz8nNQjxcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTYBklPSpM+lRk0bgaAFzO3aJ28ZJqQlD7Tmy518fTc=;
 b=aItzfuVVdy/AoqQ9jPlC4u2glQXpKSv7Y31RpvHKN+5lhOC+L3dgZr0puetlTOmyT/u9IsvI10xgibHdsTHHXyqvpwd9m2ubwBYV1/57JNdH9iEEHjlm/ueaSxpp6LNEA47NvOZiY0VxDOFpN273nEwm548/vgAEglXNVPG7LMYsKtF/38p984UpFdAk0EdQY7I5ZUCiHy7/hXPdFRIo8qAJVHuyjWZVytEX8QjCUjyijvfbsF1JPDeg5JtXHd473243BV5FkUGTxw4ipB6qhsJK0t2fBaMJeEl86EUMdHGCBGrJ3FQBISAlT/jF1b6ZJPYF8x4DsYv578DDtONNTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTYBklPSpM+lRk0bgaAFzO3aJ28ZJqQlD7Tmy518fTc=;
 b=unMiJDgHltrioewMSsuxrUfspLjkNB5bq8czJKsFVc+W+Kdq1keDR3KGu1jCyt2JOYEQmzAb2ZNKbGos2R4KPWkiTYX3blJ+qxfTLQ4X+qWx0fftNlcPbbBl2ey4s6Y4tNMujmRbZun+aiFDTGYbJv0WX4hbkXLIss9DkN1dS0VUzWtnNCuQJ8bit4hNsZDjWwFUWD8uzHS+k2zSBrlSzaz6jCMavGRT1fkChInEeWHmf47XG08N2Uv/vJidzXM1o1IeADrH/83sxNShYyO5WA8hntgGkFWsiUQdD83+6E4yWFV2IHQsa6dKJ7kM4q8b3CWvAUDvMdeODUgKIaJa8A==
Received: from TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:8041::8)
 by TYCP286MB3638.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3c3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Tue, 31 Oct
 2023 11:16:20 +0000
Received: from TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 ([fe80::465a:2534:4d99:a25b]) by TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 ([fe80::465a:2534:4d99:a25b%6]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 11:16:20 +0000
From:   Shiji Yang <yangshiji66@outlook.com>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Olliver Schinagl <oliver@schinagl.nl>,
        Shiji Yang <yangshiji66@outlook.com>
Subject: [PATCH 1/3] dt-bindings: leds: sort LED color definitions by alphabet
Date:   Tue, 31 Oct 2023 19:15:57 +0800
Message-ID: <TYAP286MB0315FE921FF113BF76F7B700BCA0A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231031111559.12199-1-yangshiji66@outlook.com>
References: <20231031111559.12199-1-yangshiji66@outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN:  [CiUalsJ1p7IoLCHSv5T2n3v3Ztlp2UYgrO3k+OPq8Yc=]
X-ClientProxiedBy: SG2PR03CA0123.apcprd03.prod.outlook.com
 (2603:1096:4:91::27) To TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:8041::8)
X-Microsoft-Original-Message-ID: <20231031111559.12199-2-yangshiji66@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYAP286MB0315:EE_|TYCP286MB3638:EE_
X-MS-Office365-Filtering-Correlation-Id: fe5e40dd-49e6-46a4-193a-08dbda02cf40
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XYrqgVnUrcmmgHF3wraLbSc9wVS8PYN3KBFWGHyIh5pSrQV8AHV3daXk6XxXeXuRtF0oIVCjCb9uJay45D8B4kud+pTpzuEP4NIS0V1s4W9IcQdc3Moi2qy+iZaxLJORab/IDAkSigW6gyqJGetQsZd2zC9w5DQsogTRYVMSdbok39Fewq0ImYNP7438UQrfRcGmYI16iIpKHdMY6LHbS3/Twx8nYa3SwqcX511kDUOQlHV+A/pWun/kDXKM5orps14HoW8ClhW9eZPARQ6tGNhZVokZHc27zIjEz8FkvQWbEtwGyQKzME1Mmt5v8MacsG9Xvhr19s2xiQSRn7Ay2nkTM4PGz1y0YapMAJEqJBpxKD8KscI90+7N9vlbHnQuVbBye9xWcNq1DMrIuvhQ56QpeAtMyebRq0iIGLyoO6IgiTx8Krz61lhAZBL2gbwrE700jmHLB2xTfrWP/DlEGrD7WhQ/3CcEw30FHkh3XnoUZkqQxuf1+OYlBoutGcozhFwaUDEuaKSXo3tmdhwBzcOGCuz9cOqeprSBGh6on58jCMBtXKZ+wQEhuJzBBDQRzaR5SCNDROGR/aAiFNVTF8+xJnFr14Tft9U7uUUkKZYJFpVFJZ7Ts4OyJLqFfSyp
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xCk7x/vbhVeXRz99lL3eiE3VbxbckHlfK3WjoypXFdFrEponoks9Vs9dfSRI?=
 =?us-ascii?Q?GB/Qo5ot6dPpuZgq2G48Ug0cBPzu5aqhHoLi8NvSVy9mqQ+irawaBtZslMTC?=
 =?us-ascii?Q?MX0e9GincAra6QB4gE0wCxKZ+JAqjX/mZHfyY4CT4ic3RWWfsSB6daMLnZL1?=
 =?us-ascii?Q?sH3sHY55pVJIYyNpnYaAZ4Vt/22BC6PdA4uyquvuOMgeAomUR/tBi1wIu4DY?=
 =?us-ascii?Q?ddjCbRo3Wzf75NLoAcglE85hLVv9T2AAvQgwn1PZuCNWw0iS/veBzS/Pfx7s?=
 =?us-ascii?Q?eTCYQOXJ6DOkbvJ4pIu0TD+rexMLgYV9eobJdqINNUzKAPJ0Mti/PIV+fS6D?=
 =?us-ascii?Q?KEP3FJWdA1DhNFmXj73R2DQ0YtUQWr6TKOaMbhoiFZ034M84Xnm2zIyHLiyV?=
 =?us-ascii?Q?xmXsZXStMDOf4H2dBd5sV+/WAx6j/QOyPeOjCU5s7kbEhg0uvsHhXbykh5cq?=
 =?us-ascii?Q?AAesC8RgktoNGyGddVx1x7iYRnqo+Z0kZLVNLXfivznxpYh3zr1fWAij3zF+?=
 =?us-ascii?Q?NUaXUQ0yu0vck9h5zWw8HvcgOgamGwNUhWmqE/6xtSDdW+m5i8IT6Hf0mIZL?=
 =?us-ascii?Q?1lRpU5T021JGqKhq9iIWP0xC0NnVaxS7tKwfmPUQIcXhcmJI4oMipp+IpFA/?=
 =?us-ascii?Q?Wk3PHDwUSGKpLMI0XQePXePwZ4C7zeW2g3Tf12WnV46/aPGfKW+7WPGoTtu7?=
 =?us-ascii?Q?5Ya6v2WgaVkIcFFT3kIbSiLMjvnwExAIxFUbqML9Xb27zV9svhkJvH4pfHnb?=
 =?us-ascii?Q?k1DeLwRjmZ/mxxkyZClc+vn7ox6EqmnrU5ljfWZRAvNQ4b0zGLY8vpIdL1Qk?=
 =?us-ascii?Q?r0C9K8/szQouE0pBSaBkz9hFA3WejFlYhfICKmxicwzvJ4UUQnmkC5uqlrKo?=
 =?us-ascii?Q?8mVqGuAPkZZa/RHaVdFma6ON3UyJK1+7ByltPDrM0jgsB0o3YyAAH7rEDsAy?=
 =?us-ascii?Q?8SVinQC0unWntKvGKPwWt54CXqnF81VeFQ/bKrKpwbUd7DmLQjwlIUIOpsnO?=
 =?us-ascii?Q?ho3xdO5ROjJVNS5W56Cxx4rcFTBVPGKX6hgLJfClBDf88kapt/xwkkI4vr/G?=
 =?us-ascii?Q?alz/ABcXl2vxJx0rh1merRXbuSPiV12v3uJuGaQApjLhvZ6URJq6X8los3+O?=
 =?us-ascii?Q?vmqC2SRQls+ZLk6zZI4C2Ue5GhN+j57PewHG83yjFxWTeJA9rYCpYwd49ZN4?=
 =?us-ascii?Q?jI5Ith2sp/SJ/t83gGVEfakxZnKDMi6/Aqfdagv4QlrZuSBlOp4SgWS6WQA?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe5e40dd-49e6-46a4-193a-08dbda02cf40
X-MS-Exchange-CrossTenant-AuthSource: TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 11:16:20.8222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3638
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Sorting LEDs by alphabet can help developers quickly find the colors
they want. Infrared and multicolor LEDs are special so they should
be left at the end of the list.

Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
---
 include/dt-bindings/leds/common.h | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index 9a0d33d02..33c9dd873 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -22,22 +22,23 @@
 #define LEDS_BOOST_FIXED	2
 
 /* Standard LED colors */
-#define LED_COLOR_ID_WHITE	0
-#define LED_COLOR_ID_RED	1
-#define LED_COLOR_ID_GREEN	2
-#define LED_COLOR_ID_BLUE	3
-#define LED_COLOR_ID_AMBER	4
-#define LED_COLOR_ID_VIOLET	5
-#define LED_COLOR_ID_YELLOW	6
-#define LED_COLOR_ID_IR		7
-#define LED_COLOR_ID_MULTI	8	/* For multicolor LEDs */
-#define LED_COLOR_ID_RGB	9	/* For multicolor LEDs that can do arbitrary color,
+#define LED_COLOR_ID_AMBER	0
+#define LED_COLOR_ID_BLUE	1
+#define LED_COLOR_ID_CYAN	2
+#define LED_COLOR_ID_GREEN	3
+#define LED_COLOR_ID_LIME	4
+#define LED_COLOR_ID_ORANGE	5
+#define LED_COLOR_ID_PINK	6
+#define LED_COLOR_ID_PURPLE	7
+#define LED_COLOR_ID_RED	8
+#define LED_COLOR_ID_VIOLET	9
+#define LED_COLOR_ID_WHITE	10
+#define LED_COLOR_ID_YELLOW	11
+/* These LEDs are special */
+#define LED_COLOR_ID_IR		12
+#define LED_COLOR_ID_MULTI	13	/* For multicolor LEDs */
+#define LED_COLOR_ID_RGB	14	/* For multicolor LEDs that can do arbitrary color,
 					   so this would include RGBW and similar */
-#define LED_COLOR_ID_PURPLE	10
-#define LED_COLOR_ID_ORANGE	11
-#define LED_COLOR_ID_PINK	12
-#define LED_COLOR_ID_CYAN	13
-#define LED_COLOR_ID_LIME	14
 #define LED_COLOR_ID_MAX	15
 
 /* Standard LED functions */
-- 
2.39.2

