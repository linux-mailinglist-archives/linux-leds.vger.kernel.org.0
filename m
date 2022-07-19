Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A83F157A725
	for <lists+linux-leds@lfdr.de>; Tue, 19 Jul 2022 21:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239092AbiGSTTK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 19 Jul 2022 15:19:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239489AbiGSTS5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 19 Jul 2022 15:18:57 -0400
Received: from smtpout1.mo528.mail-out.ovh.net (smtpout1.mo528.mail-out.ovh.net [46.105.34.251])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A240550FF;
        Tue, 19 Jul 2022 12:18:55 -0700 (PDT)
Received: from pro2.mail.ovh.net (unknown [10.108.1.33])
        by mo528.mail-out.ovh.net (Postfix) with ESMTPS id 4166E119C4179;
        Tue, 19 Jul 2022 21:18:38 +0200 (CEST)
Received: from localhost.localdomain (88.161.25.233) by DAG1EX1.emp2.local
 (172.16.2.1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 19 Jul
 2022 21:18:37 +0200
From:   Jean-Jacques Hiblot <jjhiblot@traphandler.com>
To:     <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <sven.schwermer@disruptive-technologies.com>,
        <krzysztof.kozlowski+dt@linaro.org>
CC:     <johan+linaro@kernel.org>, <marijn.suijten@somainline.org>,
        <bjorn.andersson@linaro.org>, <andy.shevchenko@gmail.com>,
        <linux-leds@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Jean-Jacques Hiblot <jjhiblot@traphandler.com>
Subject: [PATCH v2 4/4] leds: Add a multicolor LED driver to group monochromatic LEDs
Date:   Tue, 19 Jul 2022 21:18:01 +0200
Message-ID: <20220719191801.345773-5-jjhiblot@traphandler.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220719191801.345773-1-jjhiblot@traphandler.com>
References: <20220719191801.345773-1-jjhiblot@traphandler.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [88.161.25.233]
X-ClientProxiedBy: DAG2EX1.emp2.local (172.16.2.11) To DAG1EX1.emp2.local
 (172.16.2.1)
X-Ovh-Tracer-Id: 256142230807919067
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudeltddgudefiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhephffvvefufffkofgjfhgggfgtihesthekredtredttdenucfhrhhomheplfgvrghnqdflrggtqhhuvghsucfjihgslhhothcuoehjjhhhihgslhhothesthhrrghphhgrnhgulhgvrhdrtghomheqnecuggftrfgrthhtvghrnhepudetveelveevgffgvdeuffffjefhheehueeitdegtdejgefhheeuuddugeeffeeunecukfhppedtrddtrddtrddtpdekkedrudeiuddrvdehrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehprhhovddrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehjjhhhihgslhhothesthhrrghphhgrnhgulhgvrhdrtghomhdpnhgspghrtghpthhtohepuddprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhohedvke
X-Spam-Status: No, score=-0.6 required=5.0 tests=BAYES_00,
        RCVD_IN_BL_SPAMCOP_NET,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

By allowing to group multiple monochrome LED into multicolor LEDs,
all involved LEDs can be controlled in-sync. This enables using effects
using triggers, etc.

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@traphandler.com>
---
 drivers/leds/rgb/Kconfig                 |   6 +
 drivers/leds/rgb/Makefile                |   1 +
 drivers/leds/rgb/leds-group-multicolor.c | 153 +++++++++++++++++++++++
 3 files changed, 160 insertions(+)
 create mode 100644 drivers/leds/rgb/leds-group-multicolor.c

diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
index 204cf470beae..70b157d1fdca 100644
--- a/drivers/leds/rgb/Kconfig
+++ b/drivers/leds/rgb/Kconfig
@@ -2,6 +2,12 @@
 
 if LEDS_CLASS_MULTICOLOR
 
+config LEDS_GRP_MULTICOLOR
+	tristate "multi-color LED grouping Support"
+	help
+	  This option enables support for monochrome LEDs that are
+	  grouped into multicolor LEDs.
+
 config LEDS_PWM_MULTICOLOR
 	tristate "PWM driven multi-color LED Support"
 	depends on PWM
diff --git a/drivers/leds/rgb/Makefile b/drivers/leds/rgb/Makefile
index 0675bc0f6e18..4de087ad79bc 100644
--- a/drivers/leds/rgb/Makefile
+++ b/drivers/leds/rgb/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 
+obj-$(CONFIG_LEDS_GRP_MULTICOLOR)	+= leds-group-multicolor.o
 obj-$(CONFIG_LEDS_PWM_MULTICOLOR)	+= leds-pwm-multicolor.o
 obj-$(CONFIG_LEDS_QCOM_LPG)		+= leds-qcom-lpg.o
diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/leds-group-multicolor.c
new file mode 100644
index 000000000000..be71b85edfb5
--- /dev/null
+++ b/drivers/leds/rgb/leds-group-multicolor.c
@@ -0,0 +1,153 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * multi-color LED built with monochromatic LED devices
+ *
+ * Copyright 2022 Jean-Jacques Hiblot <jjhiblot@traphandler.com>
+ */
+
+#include <linux/err.h>
+#include <linux/led-class-multicolor.h>
+#include <linux/leds.h>
+#include <linux/math.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+
+struct led_mcg_priv {
+	struct led_classdev_mc mc_cdev;
+	struct led_classdev **monochromatics;
+};
+
+static int led_mcg_set(struct led_classdev *cdev,
+			  enum led_brightness brightness)
+{
+	struct led_classdev_mc *mc_cdev = lcdev_to_mccdev(cdev);
+	struct led_mcg_priv *priv =
+		container_of(mc_cdev, struct led_mcg_priv, mc_cdev);
+	int i;
+
+	led_mc_calc_color_components(mc_cdev, brightness);
+
+	for (i = 0; i < mc_cdev->num_colors; i++) {
+		struct led_classdev *mono = priv->monochromatics[i];
+		int actual_led_brightness;
+
+		/*
+		 * Scale the intensity according the max brightness of the
+		 * monochromatic LED
+		 */
+		actual_led_brightness = DIV_ROUND_CLOSEST(
+			mono->max_brightness * mc_cdev->subled_info[i].brightness,
+			mc_cdev->led_cdev.max_brightness);
+
+		led_set_brightness(mono, actual_led_brightness);
+	}
+	return 0;
+}
+
+static int led_mcg_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct led_init_data init_data = {};
+	struct led_classdev *cdev;
+	struct mc_subled *subled;
+	struct led_mcg_priv *priv;
+	int i, count, ret;
+	unsigned int max_brightness;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return  -ENOMEM;
+
+	dev_set_drvdata(&pdev->dev, priv);
+
+
+	count = 0;
+	max_brightness = 0;
+	for (;;) {
+		struct led_classdev *led_cdev;
+
+		led_cdev = devm_of_led_get(dev, count);
+		if (IS_ERR(led_cdev)) {
+			/* Reached the end of the list ? */
+			if (PTR_ERR(led_cdev) == -ENOENT)
+				break;
+			return dev_err_probe(dev, PTR_ERR(led_cdev),
+					     "Unable to get led #%d", i);
+		}
+		count++;
+
+		/* Make the sysfs of the monochromatic LED read-only */
+		led_cdev->flags |= LED_SYSFS_DISABLE;
+
+		priv->monochromatics = devm_krealloc(dev, priv->monochromatics,
+					count * sizeof(*priv->monochromatics),
+					GFP_KERNEL);
+		if (!priv->monochromatics)
+			return -ENOMEM;
+
+		priv->monochromatics[count - 1] = led_cdev;
+
+		max_brightness = max(max_brightness, led_cdev->max_brightness);
+	}
+
+	subled = devm_kzalloc(dev, count * sizeof(*subled), GFP_KERNEL);
+	if (!subled)
+		return -ENOMEM;
+	priv->mc_cdev.subled_info = subled;
+
+	for (i = 0; i < count; i++) {
+		struct led_classdev *led_cdev = priv->monochromatics[i];
+
+		subled[i].color_index = led_cdev->color;
+		/* by default all LEDs have full intensity */
+		subled[i].intensity = max_brightness;
+
+	}
+
+	/* init the multicolor's LED class device */
+	cdev = &priv->mc_cdev.led_cdev;
+	cdev->flags = LED_CORE_SUSPENDRESUME;
+	cdev->brightness_set_blocking = led_mcg_set;
+	cdev->max_brightness = max_brightness;
+	cdev->color = LED_COLOR_ID_MULTI;
+	priv->mc_cdev.num_colors = count;
+
+	init_data.fwnode = of_fwnode_handle(dev_of_node(dev));
+	ret = devm_led_classdev_multicolor_register_ext(dev, &priv->mc_cdev,
+							&init_data);
+	if (ret)
+		return dev_err_probe(dev, ret,
+			"failed to register multicolor led for %s: %d\n",
+			cdev->name, ret);
+
+	ret = led_mcg_set(cdev, cdev->brightness);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to set led value for %s: %d",
+				     cdev->name, ret);
+
+	return 0;
+}
+
+static const struct of_device_id of_led_mcg_match[] = {
+	{ .compatible = "leds-group-multicolor" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, of_led_mcg_match);
+
+static struct platform_driver led_mcg_driver = {
+	.probe		= led_mcg_probe,
+	.driver		= {
+		.name	= "leds_group_multicolor",
+		.of_match_table = of_led_mcg_match,
+	}
+};
+module_platform_driver(led_mcg_driver);
+
+MODULE_AUTHOR("Jean-Jacques Hiblot <jjhiblot@traphandler.com>");
+MODULE_DESCRIPTION("multi-color LED group driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:leds-group-multicolor");
-- 
2.25.1

