Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B7A77DCB97
	for <lists+linux-leds@lfdr.de>; Tue, 31 Oct 2023 12:16:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbjJaLQb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 31 Oct 2023 07:16:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbjJaLQa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 31 Oct 2023 07:16:30 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01olkn2055.outbound.protection.outlook.com [40.92.99.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D233BA6
        for <linux-leds@vger.kernel.org>; Tue, 31 Oct 2023 04:16:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvjHWnblxGAj+l+IBVsx/E8Irx+W+il0HjpCRS5mSukK4Uc6jH7Arc3QOW7dM4brA10NT69KxlvzT2qp6AxJnYti3L0/oIIq15OERwoyLmagV0yVlU9BNuQXOH1AkHpZHpHFKxjSMu2dtSlEPeSL3PGUL8OjTv+2lVw5rf8HWDe4MEeTIPhQIreNwi9H8qRINEDnfYNBarDhv67C/Gi9XLTWMS55r6RrxqsB8J/hOBXM2jsJfy0I+5j7dhHEaDEvtvCZbSIsp0JA8GP0aKWnu0l2W6+7ifIGtjyJoAFaTW1Hzb3TQRwDlLks3XJD1F1ulZgjbvdQ8dWlg0+7RTLZbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UfvWnqwBYDPKqZGL6QboRJ0Sg9K+106By6irwKazDCs=;
 b=YxByifT0IkpV7hAP4STxY1Sx2g4m4neN32v2kfB1p7ZB6U8MJjffaq3n3jico/qXYLkhfol5sn82Fk+n+XBin9WVzf6K0+sTeSkyAj+AQwjQMDKnzE0fCrPJMfdsB398sU7KmAVbh2THouWhn65l3jYCwXm/iAdtP4LzdddMTB0KyZPaAPbtVRe4W0XBjI+8gcAqP8axwTppgXbhR8rj6LjsQGN3/bg4xdR46Kqo+Um7cv255L+1/w2uRdDgo9OgdvPgosPtSfC5/+6eH/Q74pp4+O9m0w0Le6jrIbpBE4Zv18wLlmCUGHqIS/67/XDVH1n0403b1Jz4zIZalCeG5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UfvWnqwBYDPKqZGL6QboRJ0Sg9K+106By6irwKazDCs=;
 b=utFqmcKowdUdS2oroOLYbh1kVF2anuQ3DAWJNL/RTU5g9H3T7ZHccL6ateIiBCDENtLBjUCJJ9sQpjVp5ulOGYuTAcSYF0Zz0+JuON2ytz+ftuSw/GUaDIp2M7s+0xojNc8mQ9U6iNVJzX1OdLym7JYuKEKco6PZMAa5VOPn3L6w+V2cohDlifUV8ksoRUg6jeYfsByyCJrenHB+VtHNgp4lCG827K+LElBRKai7zQDioDgeyL1zLEwgULkCuSC0jDcrOq8kcSNX5iS75i7r9ChchtNkOs7t76d3t08Wxzx4XR1g/E8Pxtl9ZPmuHz6PxGwQ+xusoJ3V1Z9IcPh3OA==
Received: from TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:8041::8)
 by TYCP286MB3638.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3c3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Tue, 31 Oct
 2023 11:16:24 +0000
Received: from TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 ([fe80::465a:2534:4d99:a25b]) by TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 ([fe80::465a:2534:4d99:a25b%6]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 11:16:24 +0000
From:   Shiji Yang <yangshiji66@outlook.com>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Olliver Schinagl <oliver@schinagl.nl>,
        Shiji Yang <yangshiji66@outlook.com>
Subject: [PATCH 2/3] leds: core: add missing LED color strings
Date:   Tue, 31 Oct 2023 19:15:58 +0800
Message-ID: <TYAP286MB0315237004B02512C219026ABCA0A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231031111559.12199-1-yangshiji66@outlook.com>
References: <20231031111559.12199-1-yangshiji66@outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN:  [aosNXrrvZyhYSHo+YXYwY3bk3vZSBlynOyxkzvBS50s=]
X-ClientProxiedBy: SG2PR03CA0123.apcprd03.prod.outlook.com
 (2603:1096:4:91::27) To TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:8041::8)
X-Microsoft-Original-Message-ID: <20231031111559.12199-3-yangshiji66@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYAP286MB0315:EE_|TYCP286MB3638:EE_
X-MS-Office365-Filtering-Correlation-Id: 15c37b10-a364-4b55-9a6e-08dbda02d07f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QI8eym0FmSiRJ/BwnfoUavtSMqeNm2NkGmXOn6BTNkSECXt/wj3aa/xI6tKgsJBSqwdFvk2sn37u8agRJ+EA86t7MvHaCiBwl1EmkKOuuF1qJ2QvsUyHEWHI4toRgvQ/QTSDJuMQzb9XYrdP2M9toe7WE2idDk5L4mx/L2YmCnEcv06nCpcOOuI9kOVln8YpnpxohespkNqFN4XFTisjYpSMozChUXZ1mjX6RiHLUQ0VXMk5HA7PBTlsTb0OfDQLyecHUzteSJ1+mDV3N+wQTSmc6gj3ITN0EjPODMmTfJ7om87aC3jIjvTW1tczt9P1TWFkLnG8cijR6q009lfOG+y+/riK3i+35tWMRnVIhqscxKSoXveYuU3RGrQW2a5YexyqU2dFDGJ7BTz6erfo1NtsdpJWZM9Skw1qV0yqAdYzH+ph7T+wEJqlC7g+ustR/JGPIk2+TAQy22tC5s6z6nlOPIoxDTTm3bo7q06J4IUGhbSwgCQIM6JQV77Ur712+4cZE7sFqV1XU11HlCliOOvUpAy8eC2MXxUmm4+qm2TUhgWoGF78GJrkLiCOPHvhT2AFsR2sAsM/X0Z6VcGRGHiiDsUUQXJ/f0rc4IEELic=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AsxhlottDpearTwJhITjERg/qiDGTzybNoAFW0PvpN7zTFlX9bjdc6y+JVWM?=
 =?us-ascii?Q?0SCFBHXlNBPIYDygCp5q3vzChPXR6d/mv3sSapL9mJnYsEhN3bYT5C3mwh+e?=
 =?us-ascii?Q?VJHo3jeGYJWXUmpIVHUYm6DQIIcEHpmTw8Ywxmx6XOMFqClwsYpu0RMKOmA7?=
 =?us-ascii?Q?YWkXVHgf/s9KWbupefoOse5BXAO68gUmjZYf52duO0sUqHtJu1UIlm9LnUbG?=
 =?us-ascii?Q?d51aXp7TeBexic0WiIvLh0mcveo5Am6mZZFp7hp+QG09JEtiLi7o7RHlklM6?=
 =?us-ascii?Q?YNMDRmwdotyA/wzXdpANhHguz6wBqT+Tv9R+7nV1m3NXeDosb9P1PG2dqQ39?=
 =?us-ascii?Q?Eq/f2Y9W7IALy35TA/YXemB/AtyELYo9wD6J2b3SYKo7TfAzQhsOa7LzOimQ?=
 =?us-ascii?Q?NX96Xjg2ufg6JF5KR4OqcC2NYS39sKis3gEPfDy6rPwl+pWZZXke0PAv5a6j?=
 =?us-ascii?Q?qLatP1z8FTKXK1hQhgoiOLqMWMYEdluhcho6kprVE9NWHpQorcid2hddF+pr?=
 =?us-ascii?Q?2VUfjIHipYm5FvueMDqv6MI8bynhXsGDdn8SdAU+5yrp71+Jc7OXowc09k9f?=
 =?us-ascii?Q?a1iPIR3iMfeSPBWfJKLDraXL2kNj+QcnnDeP7619/nf+zxCFCWBWP55n0jP+?=
 =?us-ascii?Q?kUcVsmDFBCjY8LpegjKyDNHk82sMAoadvslMed5IdAIkBbcYkF2EQQ6bCSSo?=
 =?us-ascii?Q?8kbUtjQKsibFrvDOu2blHskIyrwKwPh0CDGzKEMf1yTKIZJOfLrIgKbQlOYV?=
 =?us-ascii?Q?TPU83/5JODmWgEvYbSk0maKjyO5LsclqFY42lxnmCOdBAM+kywTx/pvbgX41?=
 =?us-ascii?Q?UouoBpTZxXKdahEDlCMeT2a3ZYYWWiqQQGoYQ3nceDgcJgh26Z33IwyLIaV+?=
 =?us-ascii?Q?2iwlwZoeIk7DLh89tghUjhqdOrup5FfLfAtf5ckMFSO9dpHNz+Y3zAiQ4WSm?=
 =?us-ascii?Q?vk8Tk1GWdRS6G5kkJFq+klwC1vf561Z0nvPU3MkNskfkjMwRpeTNoetKxwTa?=
 =?us-ascii?Q?4vWDA6FG/wnqbJPi6y9zmFtUpjs6V/Ao8cZTNhKLd3Saw0PUQPiUj5fbkL9Z?=
 =?us-ascii?Q?pEvmH+PQLMu1C0PgtW+0p50cGaX/saXhyN0Uzw70ulMYIWvhrVn1k/b7d+lW?=
 =?us-ascii?Q?H3EAY/1WbBoFZTjhgP3Jz7zkZkwCaaZ446vjsR2Hkw1R66WXb3UV/xc/poew?=
 =?us-ascii?Q?9xaKlrJurdeatju2VZN/JYunMRHcz1ePaiL/KzeRp6WEq3+lOI0uxcYqhBM?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c37b10-a364-4b55-9a6e-08dbda02d07f
X-MS-Exchange-CrossTenant-AuthSource: TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 11:16:22.8973
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

Some new monochromatic LEDs have been introduced into DT bindings,
but they do not have corresponding descriptions on the led_colors
structure. This patch adds missing LED color strings and sorts
them in the order defined by the dt-bindings.

Fixes: 472d7b9e8141 ("dt-bindings: leds: Expand LED_COLOR_ID definitions")
Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
---
 drivers/leds/led-core.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 214ed81eb..67f53af3b 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -26,12 +26,17 @@ LIST_HEAD(leds_list);
 EXPORT_SYMBOL_GPL(leds_list);
 
 const char * const led_colors[LED_COLOR_ID_MAX] = {
-	[LED_COLOR_ID_WHITE] = "white",
-	[LED_COLOR_ID_RED] = "red",
-	[LED_COLOR_ID_GREEN] = "green",
-	[LED_COLOR_ID_BLUE] = "blue",
 	[LED_COLOR_ID_AMBER] = "amber",
+	[LED_COLOR_ID_BLUE] = "blue",
+	[LED_COLOR_ID_CYAN] = "cyan",
+	[LED_COLOR_ID_GREEN] = "green",
+	[LED_COLOR_ID_LIME] = "lime",
+	[LED_COLOR_ID_ORANGE] = "orange",
+	[LED_COLOR_ID_PINK] = "pink",
+	[LED_COLOR_ID_PURPLE] = "purple",
+	[LED_COLOR_ID_RED] = "red",
 	[LED_COLOR_ID_VIOLET] = "violet",
+	[LED_COLOR_ID_WHITE] = "white",
 	[LED_COLOR_ID_YELLOW] = "yellow",
 	[LED_COLOR_ID_IR] = "ir",
 	[LED_COLOR_ID_MULTI] = "multicolor",
-- 
2.39.2

