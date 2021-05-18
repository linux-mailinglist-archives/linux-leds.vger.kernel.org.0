Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23F03387C11
	for <lists+linux-leds@lfdr.de>; Tue, 18 May 2021 17:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350036AbhERPLN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 18 May 2021 11:11:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:49496 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345055AbhERPKh (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 18 May 2021 11:10:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6F6C1613B5;
        Tue, 18 May 2021 15:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621350550;
        bh=3crpsUukJiwOrmYoQySDsb9Gg2iiXjFUvVuCwAECZfw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ND+HmJkIOBv/3v4uWcAy+U/+zYYO5wypLavi4OJxHUAZ2s3/xeTiO0JsKIT/UDA+U
         fB9hHWo0t6gHMSld1Ex4kGFCBUUgXPtltHpl/cl1S/Bn1STNIIzW+DVinoBh7Q/17e
         0N+gXzuqNgMVQQ+2/zUmf7TUQCTFYWlTtDNu/fMQUYATNj/WYPxlFo5hrfxgfqOqtu
         yzbTWIPkA06V94opowwU1mHCKpvqBfWGzAW44Mbk4cd2gAPMneufvVvNP/o62ldynN
         JcHmWDwpotSWEBv2D0QNXVXZ2i9WKjREYlmC3szXREJoLgso5n5flv4biKCc+jX6zg
         0m55NBCfZNG7Q==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lj1LI-007HP0-Nd; Tue, 18 May 2021 17:09:08 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: [PATCH v2 17/17] leds: leds-nuc: add support for changing the power limit scheme
Date:   Tue, 18 May 2021 17:09:06 +0200
Message-Id: <c507ade9ecdd18c8604a8400ff25faa187364616.1621349814.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621349813.git.mchehab+huawei@kernel.org>
References: <cover.1621349813.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The power limit indicator may have 2 behaviors:

1. Its color gradually changes from green to red;
2. It displays a single color

Add support for it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/leds/leds-nuc.c | 93 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 93 insertions(+)

diff --git a/drivers/leds/leds-nuc.c b/drivers/leds/leds-nuc.c
index f84ec5662f5c..c320a7e4c796 100644
--- a/drivers/leds/leds-nuc.c
+++ b/drivers/leds/leds-nuc.c
@@ -1767,6 +1767,8 @@ static ssize_t store_ethernet_type(struct device *dev,
 	if (!nuc_wmi_test_control(dev, led, ctrl))
 		return -ENODEV;
 
+	tmp = strsep((char **)&buf, "\n");
+
 	for (val = 0; val < ARRAY_SIZE(ethernet_type); val++)
 		if (!strcasecmp(tmp, ethernet_type[val]))
 			break;
@@ -1786,12 +1788,102 @@ static ssize_t store_ethernet_type(struct device *dev,
 	return len;
 }
 
+/* Power Limit Indication scheme  */
+static const char * const power_limit_scheme[] = {
+	"green to red",
+	"single color"
+};
+
+static ssize_t show_power_limit_scheme(struct device *dev,
+				       struct device_attribute *attr,
+				       char *buf)
+{
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+	u8 input[NUM_INPUT_ARGS] = { 0 };
+	u8 output[NUM_OUTPUT_ARGS];
+	int ctrl, ret, val, i, n;
+	int size = PAGE_SIZE;
+	char *p = buf;
+
+	if (led->indicator != LED_IND_POWER_LIMIT)
+		return -EINVAL;
+
+	ctrl = led->reg_table[led->indicator][LED_FUNC_POWER_STATE_NUM_CTRLS];
+
+	if (!nuc_wmi_test_control(dev, led, ctrl))
+		return -ENODEV;
+
+	input[0] = LED_NEW_GET_CONTROL_ITEM;
+	input[1] = led->id;
+	input[2] = led->indicator;
+	input[3] = ctrl;
+
+	ret = nuc_nmi_cmd(dev, LED_NEW_GET_STATUS, input, output);
+	if (ret)
+		return ret;
+
+	val = output[0];
+
+	for (i = 0; i < ARRAY_SIZE(power_limit_scheme); i++) {
+		if (i == val)
+			n = scnprintf(p, size, "[%s]  ", power_limit_scheme[i]);
+		else
+			n = scnprintf(p, size, "%s  ", power_limit_scheme[i]);
+		p += n;
+		size -= n;
+	}
+	size -= scnprintf(p, size, "\n");
+
+	return PAGE_SIZE - size;
+}
+
+static ssize_t store_power_limit_scheme(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t len)
+{
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+	u8 input[NUM_INPUT_ARGS] = { 0 };
+	int ctrl, val, ret;
+	const char *tmp;
+
+	if (led->indicator != LED_IND_POWER_LIMIT)
+		return -EINVAL;
+
+	ctrl = led->reg_table[led->indicator][LED_FUNC_POWER_STATE_NUM_CTRLS];
+
+	if (!nuc_wmi_test_control(dev, led, ctrl))
+		return -ENODEV;
+
+	tmp = strsep((char **)&buf, "\n");
+
+	for (val = 0; val < ARRAY_SIZE(power_limit_scheme); val++)
+		if (!strcasecmp(tmp, power_limit_scheme[val]))
+			break;
+
+	if (val >= ARRAY_SIZE(power_limit_scheme))
+		return -EINVAL;
+
+	input[0] = led->id;
+	input[1] = led->indicator;
+	input[2] = ctrl;
+	input[3] = val;
+
+	ret = nuc_nmi_cmd(dev, LED_SET_VALUE, input, NULL);
+	if (ret)
+		return ret;
+
+	return len;
+}
+
 static LED_ATTR_RW(indicator);
 static LED_ATTR_RW(color);
 static LED_ATTR_RW(blink_behavior);
 static LED_ATTR_RW(blink_frequency);
 static LED_ATTR_RW(hdd_default);
 static LED_ATTR_RW(ethernet_type);
+static LED_ATTR_RW(power_limit_scheme);
 
 LED_ATTR_POWER_STATE_RW(s0_brightness, brightness, 0);
 LED_ATTR_POWER_STATE_RW(s0_blink_behavior, blink_behavior, 0);
@@ -1821,6 +1913,7 @@ static struct attribute *nuc_wmi_led_attr[] = {
 	&dev_attr_indicator.attr,
 	&dev_attr_hdd_default.attr,
 	&dev_attr_ethernet_type.attr,
+	&dev_attr_power_limit_scheme.attr,
 	NULL,
 };
 
-- 
2.31.1

