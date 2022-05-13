Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 988075269D2
	for <lists+linux-leds@lfdr.de>; Fri, 13 May 2022 21:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383490AbiEMTFH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 13 May 2022 15:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381130AbiEMTFG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 13 May 2022 15:05:06 -0400
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70092.outbound.protection.outlook.com [40.107.7.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BF4A95DCF;
        Fri, 13 May 2022 12:05:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xg6eTOoXK5NXzFdTSfTR+xPiMV5C7f4EVxTYLXOCeDKI7+99aPgseFe4h+7iJEaS/NhEZiA7EglKYxxRtXDwUgMWOQII3owxwQlW7mkNKrtvpFN7rFjj4/bDTDISGnvTnSGqigKx33BuS3Q22fXk1XigxMJ5TIbk/tNARHvEyF5naQXG7K2GVV62QMO/KZBZQBzr+MzpIO1CuV0ORXRV+gAmstk7y5sjekZqSimE4sma9jZB3cqPT7ECYlYsQvpJUyltEEVyHyWzlcz/H20SDF6VIMeMaTNzi8xjZ8+1Ulb8uPq1KSf55efqLGgSywEdHNavWqrhbMeSPNRUmJ/Iyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSalcepTslF0yE5GvCRPjFSQleWsb8PuSfZLkv4qJ78=;
 b=XuVPYY2sO6dx3O83auYlhMXoHUs6F69EORLaSGylZC0wOmN66J5UhuU1oV90IQhwHCgEKlfLEYVvY7khXp4axO8QNVpAgR6BToXebajGFbyT5bJwUJQVAtp2d3rOfnCNTD3t24iG7UZpaJBAZIBEKY+fi9asxJvfMdD88p4Jbytoi7VVhbwYiG+8XCWUKUfGZUVJ6mbZhiiENsYwx/oLHtHmGW4oNw0UgtdpCVL1PQw4kVPXQlBC/aTrTLlamElusforoNeSn5kHnHRcJvKL9R0L7O7AkBOlwgXCF/c+bc0oOMGepXI/VFTKCsIvjRXR5iSCK8ax5wy8cQKJ7rEyUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com;
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSalcepTslF0yE5GvCRPjFSQleWsb8PuSfZLkv4qJ78=;
 b=Jl9H6kp+Cmck3+T5gVolYt2aWhc4enxvKBqwW9IgzEsi2kgMGlhdjZEk7SllFvT24LT5ojiVHFFEmhIaxwKsG4mhw46sYVB+eMhNnQIESogc2tU6xb07X3Jt+qFhNNBL9FGkhiqg+N5oUPyhFT3NvS1KEZpHlaR6PKeUczH3SFU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM5P189MB0275.EURP189.PROD.OUTLOOK.COM (2603:10a6:206:1f::12)
 by VI1P189MB0303.EURP189.PROD.OUTLOOK.COM (2603:10a6:802:33::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.22; Fri, 13 May
 2022 19:04:59 +0000
Received: from AM5P189MB0275.EURP189.PROD.OUTLOOK.COM
 ([fe80::f941:9cda:92c3:788e]) by AM5P189MB0275.EURP189.PROD.OUTLOOK.COM
 ([fe80::f941:9cda:92c3:788e%7]) with mapi id 15.20.5250.015; Fri, 13 May 2022
 19:04:59 +0000
From:   Kyle Swenson <kyle.swenson@est.tech>
To:     pavel@ucw.cz, robh+dt@kernel.org, krzk+dt@kernel.org
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Kyle Swenson <kyle.swenson@est.tech>
Subject: [PATCH 1/2] leds: aw21024: Add support for Awinic's AW21024
Date:   Fri, 13 May 2022 13:04:08 -0600
Message-Id: <20220513190409.3682501-1-kyle.swenson@est.tech>
X-Mailer: git-send-email 2.36.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0078.namprd03.prod.outlook.com
 (2603:10b6:303:b6::23) To AM5P189MB0275.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:206:1f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbe05c84-d0f1-45c2-7799-08da351379e7
X-MS-TrafficTypeDiagnostic: VI1P189MB0303:EE_
X-Microsoft-Antispam-PRVS: <VI1P189MB03037E2C81195DC4092A689FE4CA9@VI1P189MB0303.EURP189.PROD.OUTLOOK.COM>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LPtka7TEQ8tsPQhszfoYdFYZuhPPuIBK7EZfi/rPb4sUCqJIA7iFt+NPiwEjDVenYGEaz7zp+qE4LyEOl6H2y/Qytn0kdIu+Ik9ADcdajttpkUTO1fAifA9tJ+lS7Aby4AI6Sft9qLXts2dLTi/vYMwilVJ8RisVuLotwH5ZLJc9B/HbSh8qIiGmsok45eVnq+5gAF8nVby4DjzsatSpHGAUDW7eYV5dYXyyP7LB6bOF06aO/FlacFZOMvPKDdCir/ELu8hEIBnDbaenbSLHTFLSMOK3e8kFMfVFB65jxUQNyOECewSRsBBLkj1yIGhJ7/UFeiM1KxN4rQnxTNowY50TQLkuudpCdh4ytNwcCTgfu5UNsTrqLjTkH8SEZz1VWPyoGKSDvCpQkmfYKQ4HUQYsODykmkEZT5iJFIZD66oxBletfENU9SoqU8ge1yJTjoCmhUYOkjNJCtTwp6hhbi4EnwNuyxArdpstM29eHfXsuJ6kh74Ej9/EPYuJ2tbdShl07IswJoY66XNm7V3o11yhaqQ7iSCg0DBdVl+Ax+0GGUJM3QV7ILs+CxChGllhquGQkXeKqd+LKgdpm29hDIEnjcBj6c86/x6f/o4z79DaPJOnz01lCW8a28GYXtfYtYEGY3D1Lq+sTINkB+kw5+UQl771ORHtdaZLwpS6wqomZfYUpHO1hKVX5FmVyQ7byKkze+Wl8Onwfi/K4RZyu7vM+tE/PnTAza1dB2brhPM95QUND2S5BQE5ZXDf4wBvBFRutiExD1MDrZh7ecZ67JW/cNCK1UUda2v0r9LHRDg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5P189MB0275.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(376002)(346002)(396003)(39840400004)(136003)(366004)(30864003)(5660300002)(1076003)(36756003)(6512007)(2616005)(4326008)(44832011)(52116002)(6506007)(66946007)(26005)(186003)(6666004)(2906002)(66556008)(66476007)(8676002)(83380400001)(8936002)(6486002)(86362001)(966005)(508600001)(316002)(38100700002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YFypurbl0v45RpANIVl7IjOoSOMfo/7kylp/25CEx2jS5+mL0ZeLzVl/ockT?=
 =?us-ascii?Q?JWUs5h1Ci/ztQO5FaU21urhAtczkYyQCbWPVLa9SYTGiCSIgv+lzH/HKi341?=
 =?us-ascii?Q?fQEEPwysdnTC2/CssiZnthLfRXXKa2a7f8Ya5In6sa2wbkXwZuxIdN+EiqX8?=
 =?us-ascii?Q?W2nqvhOiqVjoy9pW88zLtmywId8jRMxrjGDEhaI3I5pWtNrLtejrZLP1spNd?=
 =?us-ascii?Q?XDuGxkQQF+EYFeaEEFJuesd4tM3a53ITVsqNwmFQ0PRoYqgqQwTEcjJXridh?=
 =?us-ascii?Q?MD0nZ+VebSqG8WuKagtcnevSIIMKYdhUw4I9uwy2sFRgRfX/tQNaRCVp6EEF?=
 =?us-ascii?Q?TGBT0C4I0LgHTIVHiptYJFJDiBEY3pmbJXtE2uGspTWUZiKMFNQYTTNtd4c/?=
 =?us-ascii?Q?9UInq1fgVbezpllnWdYbBXZgImUdE7Ctn6PQHJFCRJThH6Uegs9kp0Cm2ZIG?=
 =?us-ascii?Q?E4hjxHGUakPFvqNaalJuWaqBoBCzF82tA5t2mMO2BJ7e7oWlJxwMar4FDBHF?=
 =?us-ascii?Q?zS99GhC8RHy3jtaBJ68UFIw5M4l3oJ1aK1gP1oy3+T5FshO9NxAhuwweJdIc?=
 =?us-ascii?Q?7YmpTdjbeMsRIl8fZWtriHjsgrEBC3lV05GdGE5RLr16E5Cis/WczXb3wHbd?=
 =?us-ascii?Q?nqbmmiaa3By9H4ETYZGXN6GGOX0xriTq+0uxVI5nMqqb9sORunLMUFXbtoNK?=
 =?us-ascii?Q?79++5IctR83BXrHwEXO2eJoThc444eDEpEeMJqamF490EfZzFbje4NIoinrI?=
 =?us-ascii?Q?r9D4nPBvTrceFR8GPczlb7LJWjNAvpGCU5HbBGEjrJnxnQWIb5p58wQ1VD7B?=
 =?us-ascii?Q?btiTOn+q5ZHHZ8qWESu0/4CSGNYudSpPT2naEIs5fFHyGubc3lHKUmCU/0zs?=
 =?us-ascii?Q?2WaVZ7DFT0l03cRzImJt9inJOQ1JYsznMkb01mXWJbUQkSofmIyJ8OREuTke?=
 =?us-ascii?Q?hRhSeto2R4s7ECCJ6QHqTuEdgh5T81Au7PdftkrXF6ifrF7H7u6QRDZ6pANT?=
 =?us-ascii?Q?GKyVjN6ngaQcGh47RY8vpCsTwAcg5CEIzIMB2APjsCiNbiWqnH733ZpGhsbQ?=
 =?us-ascii?Q?QfV1ztcRziYuD9d4TPT/5/HEU/inTE3EZHa00f15MI5dfZRDAEqdvkaZ79K2?=
 =?us-ascii?Q?k0KG5X3WrIdjkuF7QiN/MC+UnVe3P/oa/9oTpZfvZdlvlQbOR4K4CR8lUvYU?=
 =?us-ascii?Q?agS1aA6Tt0D2TGA6XAT7Uh6fABSdyG3OUcT56I/xYibizfOXRTI/3EL93ES0?=
 =?us-ascii?Q?/WhwiQruRnZFTdMXjvftLOSUXSP2V963i0ySeEacaqOEKcGPrUFV5isGqkHK?=
 =?us-ascii?Q?PIjqic92SNGApqF20c+m107feZgGw3u7C77KddvP2Bb3avDnErRVwsqoXL20?=
 =?us-ascii?Q?7XWSShe/gsofG3ZFf6Vg5DVq5CUKd69B9Kci/3cN0yBFAAHt88cwfx96uGDC?=
 =?us-ascii?Q?5ry9UmtPC7UdhHEuTrB2OLadHe+I64yhhUUwtvQtIdtGWfwDcmZDEsXLPksK?=
 =?us-ascii?Q?8xK5RKzCC3sn/PV0UxSPCXsHXk3VR5xEpoXsx1vAQSIhMQ/WWAAD66xP1wSE?=
 =?us-ascii?Q?Fhn8/xLFvGIXICRtyMg7+slGlYIgWHFZTXjySAFqIPxGBNTxABmdyl0Lz63Q?=
 =?us-ascii?Q?tRNgkFRWnUCXg4Rj3dr6i/c6nNqTcymHttq1lTJJEph5Ll7RcIfpyFWdthxZ?=
 =?us-ascii?Q?1TSU/wowt6nQCwYHdRJJbaiYZI6mpJUtZhXz3idmCdMxVFTCTzFpihF7x8VJ?=
 =?us-ascii?Q?AvwDizejBw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe05c84-d0f1-45c2-7799-08da351379e7
X-MS-Exchange-CrossTenant-AuthSource: AM5P189MB0275.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2022 19:04:59.3615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pcKLp1KEkDHfI7iiq0VxfQc4LIrtZGAAK33Bs3AmavrwmQLmIoRrvc9ow5LQcwzBxJmAeTpLU/WcIlEBh8UkrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P189MB0303
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The Awinic AW21024 LED controller is a 24-channel RGB LED controller.
Each LED on the controller can be controlled individually or grouped
with other LEDs on the controller to form a multi-color LED.  Arbitrary
combinations of individual and grouped LED control should be possible.

Signed-off-by: Kyle Swenson <kyle.swenson@est.tech>
---
 drivers/leds/Kconfig        |  11 ++
 drivers/leds/Makefile       |   1 +
 drivers/leds/leds-aw21024.c | 314 ++++++++++++++++++++++++++++++++++++
 3 files changed, 326 insertions(+)
 create mode 100644 drivers/leds/leds-aw21024.c

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index a49979f41eee..c813d7c16ff8 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -102,10 +102,21 @@ config LEDS_AW2013
 	  LED driver.
 
 	  To compile this driver as a module, choose M here: the module
 	  will be called leds-aw2013.
 
+config LEDS_AW21024
+	tristate "LED Support for Awinic AW21024"
+	depends on LEDS_CLASS
+	depends on LEDS_CLASS_MULTICOLOR || !LEDS_CLASS_MULTICOLOR
+	help
+	  If you say yes here you get support for Awinic's AW21024, a 24-channel
+	  RGB LED Driver.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called leds-aw21024.
+
 config LEDS_BCM6328
 	tristate "LED Support for Broadcom BCM6328"
 	depends on LEDS_CLASS
 	depends on HAS_IOMEM
 	depends on OF
diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
index 4fd2f92cd198..09a0e3cb21cb 100644
--- a/drivers/leds/Makefile
+++ b/drivers/leds/Makefile
@@ -14,10 +14,11 @@ obj-$(CONFIG_LEDS_ADP5520)		+= leds-adp5520.o
 obj-$(CONFIG_LEDS_AN30259A)		+= leds-an30259a.o
 obj-$(CONFIG_LEDS_APU)			+= leds-apu.o
 obj-$(CONFIG_LEDS_ARIEL)		+= leds-ariel.o
 obj-$(CONFIG_LEDS_ASIC3)		+= leds-asic3.o
 obj-$(CONFIG_LEDS_AW2013)		+= leds-aw2013.o
+obj-$(CONFIG_LEDS_AW21024)		+= leds-aw21024.o
 obj-$(CONFIG_LEDS_BCM6328)		+= leds-bcm6328.o
 obj-$(CONFIG_LEDS_BCM6358)		+= leds-bcm6358.o
 obj-$(CONFIG_LEDS_BD2802)		+= leds-bd2802.o
 obj-$(CONFIG_LEDS_BLINKM)		+= leds-blinkm.o
 obj-$(CONFIG_LEDS_CLEVO_MAIL)		+= leds-clevo-mail.o
diff --git a/drivers/leds/leds-aw21024.c b/drivers/leds/leds-aw21024.c
new file mode 100644
index 000000000000..4eebc3de1a8a
--- /dev/null
+++ b/drivers/leds/leds-aw21024.c
@@ -0,0 +1,314 @@
+// SPDX-License-Identifier: GPL-2.0
+// Awinic AW21024 LED chip driver
+// Copyright (C) 2022 Nordix Foundation https://www.nordix.org
+
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/init.h>
+#include <linux/leds.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/delay.h>
+#include <linux/slab.h>
+#include <uapi/linux/uleds.h>
+
+#include <linux/led-class-multicolor.h>
+
+/* Called COL0, COL1,..., COL23 in datasheet */
+#define AW21024_REG_DC_CURRENT(_led)	(0x4a + (_led))
+
+/* Called BR0, BR1,..., BR23 in datasheet */
+#define AW21024_REG_BRIGHTNESS(_led)	(0x01 + (_led))
+
+#define AW21024_REG_UPDATE				0x49 /* Write 0x00 to update BR */
+
+#define AW21024_REG_GCR0				0x00 /* Global configuration register */
+#define AW21024_REG_GCC					0x6e /* Global current control */
+#define AW21024_REG_SW_RESET			0x7f
+#define AW21024_REG_VERSION				0x7e
+
+#define AW21024_GCR0_CHIPEN				BIT(0)
+#define AW21024_CHIP_ID					0x18
+#define AW21024_CHIP_VERSION			0xA8
+
+struct aw21024_led_data {
+	struct led_classdev_mc mc_cdev;
+	struct work_struct work;
+	unsigned int *regs;
+	unsigned int nregs;
+	struct aw21024 *parent;
+};
+
+struct aw21024 {
+	struct i2c_client *client;
+	struct device *dev;
+	struct gpio_desc *enable_gpio;
+	struct mutex lock;
+	struct aw21024_led_data **leds;
+	unsigned int nleds;
+};
+
+static int aw21024_led_brightness_set(struct led_classdev *led_cdev,
+					enum led_brightness brightness)
+{
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(led_cdev);
+	struct aw21024_led_data *led = container_of(mc_cdev, struct aw21024_led_data, mc_cdev);
+	struct aw21024 *parent = led->parent;
+	int i;
+	int ret = 0;
+
+	mutex_lock(&parent->lock);
+	if (mc_cdev->num_colors && mc_cdev->subled_info) {
+		for (i = 0; i < led->nregs; i++) {
+			ret = i2c_smbus_write_byte_data(parent->client,
+					AW21024_REG_DC_CURRENT(led->regs[i]),
+					mc_cdev->subled_info[i].intensity);
+			if (ret < 0)
+				goto unlock_ret;
+
+			ret = i2c_smbus_write_byte_data(parent->client,
+					AW21024_REG_BRIGHTNESS(led->regs[i]),
+					brightness);
+			if (ret < 0)
+				goto unlock_ret;
+		}
+	} else {
+		ret = i2c_smbus_write_byte_data(parent->client,
+					AW21024_REG_DC_CURRENT(led->regs[0]), 0xFF);
+		if (ret < 0)
+			goto unlock_ret;
+
+		ret = i2c_smbus_write_byte_data(parent->client,
+					AW21024_REG_BRIGHTNESS(led->regs[0]),
+					brightness);
+		if (ret < 0)
+			goto unlock_ret;
+	}
+	ret = i2c_smbus_write_byte_data(parent->client, AW21024_REG_UPDATE, 0x0);
+unlock_ret:
+	mutex_unlock(&parent->lock);
+	return ret;
+}
+
+static int aw21024_probe_dt(struct aw21024 *data)
+{
+	struct device *dev = &data->client->dev;
+	struct fwnode_handle *child = NULL;
+	struct fwnode_handle *led_node = NULL;
+	struct led_init_data init_data = {};
+	u32 color_id;
+	int  ret, num_colors;
+	unsigned int nleds = 0;
+	struct aw21024_led_data *led;
+	struct led_classdev *led_cdev;
+	struct mc_subled *mc_led_info;
+
+	nleds = device_get_child_node_count(dev);
+
+	data->leds = devm_kcalloc(dev, nleds, sizeof(*(data->leds)), GFP_KERNEL);
+	if (!data->leds)
+		return -ENOMEM;
+
+	device_for_each_child_node(dev, child) {
+		led = devm_kzalloc(dev, sizeof(struct aw21024_led_data), GFP_KERNEL);
+		if (!led) {
+			ret = -ENOMEM;
+			goto ret_put_child;
+		}
+		led->parent = data;
+		led_cdev = &led->mc_cdev.led_cdev;
+		init_data.fwnode = child;
+
+		led_cdev->brightness_set_blocking = aw21024_led_brightness_set;
+		data->leds[data->nleds] = led;
+
+		ret = fwnode_property_count_u32(child, "reg");
+		if (ret < 0) {
+			dev_err(dev, "reg property is invalid in node %s\n",
+					fwnode_get_name(child));
+			goto ret_put_child;
+		}
+
+		led->regs = devm_kcalloc(dev, ret, sizeof(*(led->regs)), GFP_KERNEL);
+		led->nregs = ret;
+		if (!led->regs) {
+			ret = -ENOMEM;
+			goto ret_put_child;
+		}
+
+		ret = fwnode_property_read_u32_array(child, "reg", led->regs, led->nregs);
+		if (ret) {
+			dev_err(dev, "Failed to read reg array, error=%d\n", ret);
+			goto ret_put_child;
+		}
+
+		if (led->nregs > 1) {
+			mc_led_info = devm_kcalloc(dev, led->nregs,
+						    sizeof(*mc_led_info), GFP_KERNEL);
+			if (!mc_led_info) {
+				ret = -ENOMEM;
+				goto ret_put_child;
+			}
+
+			num_colors = 0;
+			fwnode_for_each_child_node(child, led_node) {
+				if (num_colors > led->nregs) {
+					ret = -EINVAL;
+					fwnode_handle_put(led_node);
+					goto ret_put_child;
+				}
+
+				ret = fwnode_property_read_u32(led_node, "color",
+							       &color_id);
+				if (ret) {
+					fwnode_handle_put(led_node);
+					goto ret_put_child;
+				}
+				mc_led_info[num_colors].color_index = color_id;
+				num_colors++;
+			}
+
+			led->mc_cdev.num_colors = num_colors;
+			led->mc_cdev.subled_info = mc_led_info;
+			ret = devm_led_classdev_multicolor_register_ext(dev,
+								&led->mc_cdev,
+								&init_data);
+			if (ret < 0) {
+				dev_warn(dev, "Failed to register multicolor LED %s, err=%d\n",
+						    fwnode_get_name(child), ret);
+				goto ret_put_child;
+			}
+		} else {
+			ret = devm_led_classdev_register_ext(dev,
+							    &led->mc_cdev.led_cdev, &init_data);
+			if (ret < 0) {
+				dev_warn(dev, "Failed to register LED %s, err=%d\n",
+						fwnode_get_name(child), ret);
+				goto ret_put_child;
+			}
+		}
+		data->nleds++;
+	}
+
+	return 0;
+
+ret_put_child:
+	fwnode_handle_put(child);
+	return ret;
+}
+
+/* Expected to be called prior to registering with the LEDs class */
+static int aw21024_configure(struct aw21024 *priv)
+{
+	int ret = 0;
+	struct i2c_client *client = priv->client;
+
+	ret = i2c_smbus_write_byte_data(client, AW21024_REG_GCR0, AW21024_GCR0_CHIPEN);
+	if (ret < 0) {
+		dev_err(&client->dev, "Failed to write chip enable\n");
+		return -ENODEV;
+	}
+
+	ret = i2c_smbus_read_byte_data(client, AW21024_REG_SW_RESET);
+	if (ret < 0) {
+		dev_err(&client->dev, "Failed to read chip id\n");
+		return -ENODEV;
+	}
+
+	if (ret != AW21024_CHIP_ID) {
+		dev_err(&client->dev, "Chip ID 0x%02X doesn't match expected (0x%02X)\n",
+								ret, AW21024_CHIP_ID);
+		return -ENODEV;
+	}
+
+	ret = i2c_smbus_read_byte_data(client, AW21024_REG_VERSION);
+	if (ret < 0) {
+		dev_err(&client->dev, "Failed to read chip version\n");
+		return -ENODEV;
+	}
+	if (ret != AW21024_CHIP_VERSION)
+		dev_warn(&client->dev, "Chip version 0x%02X doesn't match expected 0x%02X\n",
+								ret, AW21024_CHIP_VERSION);
+
+	i2c_smbus_write_byte_data(client, AW21024_REG_SW_RESET, 0x00);
+	mdelay(2);
+	i2c_smbus_write_byte_data(client, AW21024_REG_GCR0, AW21024_GCR0_CHIPEN);
+	i2c_smbus_write_byte_data(client, AW21024_REG_GCC, 0xFF);
+
+	return 0;
+}
+
+static int aw21024_probe(struct i2c_client *client)
+{
+	struct aw21024 *priv;
+	int ret;
+
+	priv = devm_kzalloc(&client->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->client = client;
+	priv->dev = &client->dev;
+
+	mutex_init(&priv->lock);
+
+	priv->enable_gpio = devm_gpiod_get_optional(priv->dev, "enable", GPIOD_OUT_LOW);
+	if (IS_ERR(priv->enable_gpio))
+		return dev_err_probe(priv->dev, PTR_ERR(priv->enable_gpio),
+				       "Failed to get enable GPIO\n");
+
+	if (priv->enable_gpio) {
+		mdelay(1);
+		gpiod_direction_output(priv->enable_gpio, 1);
+		mdelay(1);
+	}
+
+	i2c_set_clientdata(client, priv);
+
+	ret = aw21024_configure(priv);
+	if (ret < 0)
+		return ret;
+
+	return aw21024_probe_dt(priv);
+}
+
+static int aw21024_remove(struct i2c_client *client)
+{
+	struct aw21024 *priv = i2c_get_clientdata(client);
+	int ret;
+
+	ret = gpiod_direction_output(priv->enable_gpio, 0);
+	if (ret)
+		dev_err(priv->dev, "Failed to disable chip, err=%d\n", ret);
+
+	mutex_destroy(&priv->lock);
+	return 0;
+}
+
+static const struct i2c_device_id aw21024_id[] = {
+	{ "aw21024", 0 }, /* 24 Channel */
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, aw21024_id);
+
+static const struct of_device_id of_aw21024_leds_match[] = {
+	{ .compatible = "awinic,aw21024", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, of_aw21024_leds_match);
+
+static struct i2c_driver aw21024_driver = {
+	.driver		= {
+		.name	= "aw21024",
+		.of_match_table = of_match_ptr(of_aw21024_leds_match),
+	},
+	.probe_new		= aw21024_probe,
+	.remove		= aw21024_remove,
+	.id_table = aw21024_id,
+};
+module_i2c_driver(aw21024_driver);
+
+MODULE_AUTHOR("Kyle Swenson <kyle.swenson@est.tech>");
+MODULE_DESCRIPTION("Awinic AW21024 LED driver");
+MODULE_LICENSE("GPL");
-- 
2.36.1

