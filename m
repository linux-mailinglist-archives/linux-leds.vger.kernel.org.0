Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8956B381E33
	for <lists+linux-leds@lfdr.de>; Sun, 16 May 2021 12:54:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231258AbhEPKzN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 16 May 2021 06:55:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:47796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230032AbhEPKzI (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 16 May 2021 06:55:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2A8C161221;
        Sun, 16 May 2021 10:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621162433;
        bh=Zwfc7j9efHMjOQ95FQowFtkZnRbepFXiueRLmwb0dSU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=h8hK2cTxu3yUhpkVOFxXJ2rZE7FWYPtNo09bb+tPOG1HSmBOa+6mrwqQUeXaNlkgF
         BniqIJW1AcaIWAzQ9PEXwBuudao0SyKspIrbERhrt7xLuVIKgmfE2jyKFHgsyHAjbC
         f/7J9g5+FOgijog5s1NAmW7PmBq5bNtl4n8OeO9rsBgIxCMJJiwhysUGJDkjm5fhiN
         AwC69hh9Sl+NIlnOTfAh9ENMhp0jCGqbQKQRRFRlJG1bQl6VNk/h78MHSevGqI+tas
         67pON+wX1GH3mzGWxzzHTfu/kF4VzH6fyb8Gm3OZ3DuE5ZvzDiW7bt6nK5VzXQHrkx
         vun6WWx9/UhJw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1liEP9-003s8m-6c; Sun, 16 May 2021 12:53:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Pavel Machek" <pavel@ucw.cz>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 13/17] staging: nuc-led: add support for HDD activity default
Date:   Sun, 16 May 2021 12:53:41 +0200
Message-Id: <3e6c8001d221f724edc28107dbb8d05bf6a6801f.1621161037.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621161037.git.mchehab+huawei@kernel.org>
References: <cover.1621161037.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

There are two possible values for HDD activity behavior:

	- 0 Normally off, ON when active
	- 1 Normally on, OFF when active

Implement a logic to set it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/nuc-led/nuc-wmi.c | 77 +++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/staging/nuc-led/nuc-wmi.c b/drivers/staging/nuc-led/nuc-wmi.c
index 1a6e2b17c888..68143d45c34c 100644
--- a/drivers/staging/nuc-led/nuc-wmi.c
+++ b/drivers/staging/nuc-led/nuc-wmi.c
@@ -1626,10 +1626,86 @@ static umode_t nuc_wmi_led_blink_is_visible(struct kobject *kobj,
 	return 0;
 }
 
+/* HDD activity behavior */
+static ssize_t show_hdd_default(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+	u8 input[NUM_INPUT_ARGS] = { 0 };
+	u8 output[NUM_OUTPUT_ARGS];
+	int ctrl, ret, val;
+
+	if (led->indicator != LED_IND_HDD_ACTIVITY)
+		return -EINVAL;
+
+	ctrl = led->reg_table[led->indicator][LED_FUNC_HDD_BEHAVIOR];
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
+	if (val == 0)
+		return scnprintf(buf, PAGE_SIZE, "off\n");
+
+	return scnprintf(buf, PAGE_SIZE, "on\n");
+}
+
+static ssize_t store_hdd_default(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t len)
+{
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+	u8 input[NUM_INPUT_ARGS] = { 0 };
+	int ctrl, val, ret;
+	const char *tmp;
+
+	if (led->indicator != LED_IND_HDD_ACTIVITY)
+		return -EINVAL;
+
+	ctrl = led->reg_table[led->indicator][LED_FUNC_HDD_BEHAVIOR];
+
+	if (!nuc_wmi_test_control(dev, led, ctrl))
+		return -ENODEV;
+
+	tmp = strsep((char **)&buf, "\n");
+	if (!strcmp(tmp, "on"))
+		val = 1;
+	else if (!strcmp(tmp, "off"))
+		val = 0;
+	else
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
+
 static LED_ATTR_RW(indicator);
 static LED_ATTR_RW(color);
 static LED_ATTR_RW(blink_behavior);
 static LED_ATTR_RW(blink_frequency);
+static LED_ATTR_RW(hdd_default);
 
 LED_ATTR_POWER_STATE_RW(s0_brightness, brightness, 0);
 LED_ATTR_POWER_STATE_RW(s0_blink_behavior, blink_behavior, 0);
@@ -1657,6 +1733,7 @@ LED_ATTR_POWER_STATE_RW(standby_blink_frequency, blink_frequency, 2);
 
 static struct attribute *nuc_wmi_led_attr[] = {
 	&dev_attr_indicator.attr,
+	&dev_attr_hdd_default.attr,
 	NULL,
 };
 
-- 
2.31.1

