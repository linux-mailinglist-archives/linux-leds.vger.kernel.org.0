Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1247DCB98
	for <lists+linux-leds@lfdr.de>; Tue, 31 Oct 2023 12:16:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233766AbjJaLQd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 31 Oct 2023 07:16:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbjJaLQb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 31 Oct 2023 07:16:31 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01olkn2055.outbound.protection.outlook.com [40.92.99.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 225E3C2
        for <linux-leds@vger.kernel.org>; Tue, 31 Oct 2023 04:16:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iLmXXQ3Ae3pV4c0r8i7UP1YzTvd+cB5hbbKx3taLUjzKTDtJvwqXJgI/0+n+dyZ7OYGpFAZ9/caRMwhh7KIPgxuA2NPR4glpZsL0IdE3AQuyRqJhEJzfD+UOD5aKR9VpcVI+riwX0c3dML9ddnGlSnBiq40lk5VtZx6+wcSK7g6imtcb4KzIozjMjUju/tv+9jrSb1ayC4Xc+RjeWZFWxu3Go8hchoSp1r22sPjqLhfXOPHc/HJCEhDfaWN5JqnYOHOuO4y7taoVOQhTfs2u5E90f1obXc9Z1K0tkwhxsRO7oYWKBqmBv8ugW5xmAPKbuc/SYWWVAC7DWdmrriDoTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8maaWRoYA7cJ1d5DM2PNcRYKk4qdWVCQ/BRpiFDfGQ=;
 b=MefSP0eAzBU+VnrHu+SAPOFbyYx6qQwbxa7Kp/d/Pm+qntv5ayKBOI5/tUFVt415R81esAM7NG6GgHi89nymNdGcZqpNkKy9swATPc+/MJbbZN2+tvldrniCLvOrgV2slPRAlBMbXqoHAnMaEfLgtuu5SfARg6F/PbkDus3QFIM//zK+Wlr5k8dorvY268YiO1gSjicLQmC/14wL2JaZBsY0EZbrW4Uxfm5FBD8XXO2IsCEIhweyfltRs130MxSgHY60uoCZHneCEGe6u59BjiJtMQPHKvjRn+2bukY+0RIt5ulu5hKWtX3qLJNu7iDI/fjASAJll42hLleV9tqSCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8maaWRoYA7cJ1d5DM2PNcRYKk4qdWVCQ/BRpiFDfGQ=;
 b=gxirO1T65Bh4z2LF6bo6KJZj7v3v6ONjO/FEHTXiJLEF0pas7Xv3KvtmflAOUZj7H86v1j0bDw84KSP8shOWntpN5ixf0BBr04fqwXJ39nNygqK3d8YR3cF78oy/m/f7MAw9u/ZneIzVcJJw6kxbe8YsYdYegn0xC5JNlHDPqK6aDqHe23j3Q9OAXfKCudq3f2LlvteTyRRjbJDDzTrEohuJOoYzpdsQzXWgcj6kAbGLtLVxvASl9q7pq3CfASeR24yk/1HuKWL12g23GzOuRqfDuIH2Ga47DevT4tjt0KQT0Tvnbt1s+n8l+4zWBbB9pz3kjTlujEKSeYf0byP+2Q==
Received: from TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:8041::8)
 by TYCP286MB3638.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:3c3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Tue, 31 Oct
 2023 11:16:25 +0000
Received: from TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 ([fe80::465a:2534:4d99:a25b]) by TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 ([fe80::465a:2534:4d99:a25b%6]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 11:16:25 +0000
From:   Shiji Yang <yangshiji66@outlook.com>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Olliver Schinagl <oliver@schinagl.nl>,
        Shiji Yang <yangshiji66@outlook.com>
Subject: [PATCH 3/3] dt-bindings: leds: Add "internet" and "rssi" function definitions
Date:   Tue, 31 Oct 2023 19:15:59 +0800
Message-ID: <TYAP286MB0315E7370A5B2D7A3CC18929BCA0A@TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231031111559.12199-1-yangshiji66@outlook.com>
References: <20231031111559.12199-1-yangshiji66@outlook.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN:  [3b/jNIPseuT2Vjpo6E2rmqDnRxoS2KgI1DXwziCvovs=]
X-ClientProxiedBy: SG2PR03CA0123.apcprd03.prod.outlook.com
 (2603:1096:4:91::27) To TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:8041::8)
X-Microsoft-Original-Message-ID: <20231031111559.12199-4-yangshiji66@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYAP286MB0315:EE_|TYCP286MB3638:EE_
X-MS-Office365-Filtering-Correlation-Id: ebdf05e5-0e92-427b-b977-08dbda02d1bc
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4XSh6y/J6X1SwmZMYrw0yPNeCI7BMcM+K7X56zJ4QyZC8kJSgUOEguZ3sRkKlX4znr9Aa3YH6O+14zx+vGXv6dOJ16PhE86FoSG8o86CYi+VoKDjJFN6z31ProdsUYpnUp21MjEMKjG67KU72v8AuBYpYa4MLniE8S1S3/Z2WDT+SuwXLAPI7U3YLUhN8KTxcMzsFNQxB7vQ49FG1FTvr+zWJkoGeXST6C+I4yq99lXZyuIAy0IWtdexPGMrSfiWZR8M19q0MQ1XEyhdBHmKWoqnH4nlH+cFWn9JnzqKF638JRQT7nws/ET1SNqYdHybeo0clFsD1QBltqEdqJeZ7JMgzDo+S1UkBOCw/MFBjzzjPMhZulO591zekSRcNrpznCN4xh4MUpXDAyTQJfa/d05ggqo6H72EHMbxcTHrOoZMDEba0B17xbKrCqLvGHQNrA4YzAyLJv7brH3ECfiWx8o5ikWbhJaDu9ZrjWLMTrgfBr+XduAdi+3Y/H/ldbJfU8ioPL8CNpCbwmXAQO9cWpog7fjMQupgCKRXWG479uEg1/OAFlFykrSYcQQ8QFkQOgkAo++RqM++QyUR+g+E0aDWF9tfVZhTueFXs6ZN3LYJAQgBphmnqiOCBQXegvxI
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?noKfxwGSqcjQ94yWJqiJ+Ln84KtXyrj/khO69ow4xHyt2qwxOE03dZ7JI2Se?=
 =?us-ascii?Q?4yojDLOvFirnqnp2lQwyqyk0TNftDEoD8/LXYu/cQmSRkN7Q3G/YEolmGQRH?=
 =?us-ascii?Q?tKsIFWEfgkGFFR7dvDMjNeSDB+ouq4iVtA+Sg82D0FMeeokqpNR3ED+aCMeK?=
 =?us-ascii?Q?TJg+BYxgDNG4Ctez4sDugJ5RXigmIQ1QmJGOVn9K4xvpxoyI+0+VqZyp/M26?=
 =?us-ascii?Q?/qzVzcEhs8pcB8kiRHWAu0Af7leP8FhAu7S3cMlNE6OIXEJCGWqJO1gWmc5I?=
 =?us-ascii?Q?OhfHt6DU4rklruedFGV/VpP5HZWJRPIgJUQM6sdSu+8nTWFXKuyGV2y+tBr7?=
 =?us-ascii?Q?yZfbLcL+o3DJB0a/XWRPgIkF4pZSiP2Hs2izbx4YG+IHnGK34hI1lyIVlYOv?=
 =?us-ascii?Q?xjSFVL0ADNKJecBpFU5SbcbeYDge9gBaClw7ZxdcKEBxXi0lOL30230bRMji?=
 =?us-ascii?Q?Kqn4bLgzc9N0/bytUkYJimWWQFJF19hTp5wb+nHQZzVzFrUkTDf/s0i9kQYg?=
 =?us-ascii?Q?jLWTL3NHBrg+G3RrFXdXqrUEMN9rtv14TZmOv1lEs7+pNxQxFElgoAlf678e?=
 =?us-ascii?Q?qIeh285L9F6TEHX/pRT+ShP+T26yHKFb5v+C97TFDrGtJJxe24aNeBkb18Al?=
 =?us-ascii?Q?ylcz+BQReSCRtqprthBM2kHtIOpxUp/7KNZ/YRcoMcrqRuR/TO1LEll0vgVh?=
 =?us-ascii?Q?owNT66BjxYPH5TI2Faha3naFskMYwRJ0JMGqr1lkXW8hNVJL9+fNNYQNVKEz?=
 =?us-ascii?Q?gtypKBF9KKgAoEFefVoykcDrm6mcOpXf9MrIAf5x1ktLQvpoWaTv+Wl2MYYV?=
 =?us-ascii?Q?BMdxr19IULMaUW3ECRCxzKiroEctFVULx44e7dyWiY1sSD0GwChm6EFOwkvb?=
 =?us-ascii?Q?XWhGLWzMMoxRcC+7tGM8oWS0AO9xsQ7l4OEumi2wdK9hvX/7hwuEmws7QSET?=
 =?us-ascii?Q?i0b0rpL7zzP56aQMDXbk2y6XD+8P6eCP+3kkwqE1Y9rKDj09omNQueJMARYn?=
 =?us-ascii?Q?hTLXuSUk+iFvdbfmnk6ginYTV9EEAzvQWTwPO5QQTazMCOjX7DIylUmYWvdi?=
 =?us-ascii?Q?SR/FefUmawnNFQbQvN+bTHgIAmDr2hwJGYtjDPg+JOpNeFhlLF0AAOa7+JUQ?=
 =?us-ascii?Q?6dOv5uF55JiB/JZ4fn40sghrMZapiKMdarp5oDCn0sHLdQlNbidrmgiJqs6N?=
 =?us-ascii?Q?eM82FsLKt5YVeG8G96Jb1PrkBQkURPh3eiuy6zq88qNwJSY1pgX5taW+7Gc?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebdf05e5-0e92-427b-b977-08dbda02d1bc
X-MS-Exchange-CrossTenant-AuthSource: TYAP286MB0315.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 11:16:25.0374
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

These two types of LEDs are widely used in routers and NICs. The
RSSI (Received Signal Strength Indicator) LED is used to display
the Wi-Fi signal strength, and the Internet LED can indicate
whether the device can access a specific server.

Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
---
 include/dt-bindings/leds/common.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/leds/common.h b/include/dt-bindings/leds/common.h
index 33c9dd873..6d2a27bcb 100644
--- a/include/dt-bindings/leds/common.h
+++ b/include/dt-bindings/leds/common.h
@@ -89,11 +89,13 @@
 #define LED_FUNCTION_FLASH "flash"
 #define LED_FUNCTION_HEARTBEAT "heartbeat"
 #define LED_FUNCTION_INDICATOR "indicator"
+#define LED_FUNCTION_INTERNET "internet"
 #define LED_FUNCTION_LAN "lan"
 #define LED_FUNCTION_MAIL "mail"
 #define LED_FUNCTION_MTD "mtd"
 #define LED_FUNCTION_PANIC "panic"
 #define LED_FUNCTION_PROGRAMMING "programming"
+#define LED_FUNCTION_RSSI "rssi"
 #define LED_FUNCTION_RX "rx"
 #define LED_FUNCTION_SD "sd"
 #define LED_FUNCTION_STANDBY "standby"
-- 
2.39.2

