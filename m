Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29A3B381E26
	for <lists+linux-leds@lfdr.de>; Sun, 16 May 2021 12:53:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbhEPKzH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 16 May 2021 06:55:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:47652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229437AbhEPKzH (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 16 May 2021 06:55:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C115361182;
        Sun, 16 May 2021 10:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621162432;
        bh=I1yV79WAicyardZtVgX3QIlFbOt2vtB/eAA+wO6deO0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IdkCWul9+GnWF754+OyB6u/hDlB9cqf4dv5gzVXxd5DQzZnr3fgT15bhj2+QT9fHQ
         fTlU5ui4CbCR7EcPeUd+mVL03x5GvSt7CcIeL1llne5A6IPAdxJQ/HUBThXqeVY07X
         4JLT52GMubpN283bD7Ja9xjQUPaAExcICL+tTtciY1gqtko3LQX4KdlmxtgouH1Hq9
         35+dOjRATVie3rlG0xB762A35PlllzfHtzqf+OEYI3N12imz4EjKv8lCpAW23Qcd9r
         P49eDGNiMU7bMvsGrEqHQn+/4WmcqmcuExUZEtsWxjxn2yV/6GRqNb5gQ3/muDsXs9
         0Q5VbBD4sXsEQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1liEP8-003s88-Ow; Sun, 16 May 2021 12:53:50 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Pavel Machek" <pavel@ucw.cz>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 03/17] staging: nuc-wmi: add support for changing S0 brightness
Date:   Sun, 16 May 2021 12:53:31 +0200
Message-Id: <682adcb43cc67c95473a2706b54c023c70799942.1621161037.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621161037.git.mchehab+huawei@kernel.org>
References: <cover.1621161037.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Now that the core logic is in place, let's add support to
adjust the S0 brightness level.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/nuc-led/nuc-wmi.c | 79 +++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/drivers/staging/nuc-led/nuc-wmi.c b/drivers/staging/nuc-led/nuc-wmi.c
index b75ddd47e443..62c2764814dd 100644
--- a/drivers/staging/nuc-led/nuc-wmi.c
+++ b/drivers/staging/nuc-led/nuc-wmi.c
@@ -392,7 +392,85 @@ static ssize_t store_indicator(struct device *dev,
 	return -EINVAL;
 }
 
+/* Get S0 brightness */
+static ssize_t show_s0_brightness(struct device *dev,
+				  struct device_attribute *attr,
+				  char *buf)
+{
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+	u8 cmd, input[NUM_INPUT_ARGS] = { 0 };
+	u8 output[NUM_OUTPUT_ARGS];
+	int ret;
+
+	cmd = LED_NEW_GET_STATUS;
+	input[0] = LED_NEW_GET_CONTROL_ITEM;
+	input[1] = led->id;
+	input[2] = led->indicator;
+	input[3] = 0;
+
+	ret = nuc_nmi_cmd(dev, cmd, input, output);
+	if (ret)
+		return ret;
+
+	/* Multicolor uses a scale from 0 to 100 */
+	if (led->color_type & (LED_BLUE_AMBER | LED_BLUE_WHITE | LED_RGB))
+		return scnprintf(buf, PAGE_SIZE, "%d%%\n", output[0]);
+
+	/* single color uses 0, 50% and 100% */
+	return scnprintf(buf, PAGE_SIZE, "%d%%\n", output[0] * 50);
+}
+
+/* Change S0 brightness */
+static ssize_t store_s0_brightness(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t len)
+{
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+	u8 cmd, input[NUM_INPUT_ARGS] = { 0 };
+	int ret;
+	u8 val;
+
+	if (led->indicator == LED_IND_DISABLE) {
+		dev_dbg(dev, "Led %s is disabled. ignoring it.\n", cdev->name);
+		return -EACCES;
+	}
+
+	if (kstrtou8(buf, 0, &val) || val > 100)
+		return -EINVAL;
+
+	/*
+	 * For single-color LEDs, the value should be between 0 to 2, but,
+	 * in order to have a consistent API, let's always handle it as if
+	 * it is a percentage, for both multicolor and single color LEDs.
+	 * So:
+	 *	value == 0 will disable the LED
+	 * 	value up to 74% will set it the brightness to 50%
+	 * 	value equal or above 75% will use the maximum brightness.
+	 */
+	if (!(led->color_type & (LED_BLUE_AMBER | LED_BLUE_WHITE | LED_RGB))) {
+		if (val > 0 && val < 75)
+			val = 1;
+		if (val >= 75)
+			val = 2;
+	}
+
+	cmd = LED_SET_VALUE;
+	input[0] = led->id;
+	input[1] = led->indicator;
+	input[2] = 0;		/* FIXME: replace by an enum */
+	input[3] = val;
+
+	ret = nuc_nmi_cmd(dev, cmd, input, NULL);
+	if (ret)
+		return ret;
+
+	return len;
+}
+
 static LED_ATTR_RW(indicator);
+static LED_ATTR_RW(s0_brightness);
 
 /*
  * Attributes for multicolor LEDs
@@ -400,6 +478,7 @@ static LED_ATTR_RW(indicator);
 
 static struct attribute *nuc_wmi_multicolor_led_attr[] = {
 	&dev_attr_indicator.attr,
+	&dev_attr_s0_brightness.attr,
 	NULL,
 };
 
-- 
2.31.1

