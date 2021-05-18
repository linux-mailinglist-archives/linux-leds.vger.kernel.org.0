Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC8A7387C08
	for <lists+linux-leds@lfdr.de>; Tue, 18 May 2021 17:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345060AbhERPLA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 18 May 2021 11:11:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:49540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343957AbhERPKa (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 18 May 2021 11:10:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5321961377;
        Tue, 18 May 2021 15:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621350550;
        bh=n6zLHZrATy+wjzdZFOZuRrEPeNvHyrUErO937oDY13M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=j3V0PB8oVMkFDifntPLPtzAMRoexdcP+9UbESVhzL7vyg3xMjbHIoXURXCgvuDl4c
         yOsV7Gd/ffsmgOA6xHowdRXg+DYPIQGPT8+B5ATl7KcFdVwTcoc/4Rv5YS7B12iDji
         8R+YrB/IpbQaVPg4y690M7KFo9gr7pjTqCe0fZxjrLHTCxLczmRRs+cE/2S5ms7dT+
         aCGAyNWqb5+2VL/E0wN+qO0z4mWviSoqE4l0obEwXtpF5fQNFa3HBoLHJr5HNz8WOl
         ugSpeJFekzafFSGfUVdJXCYaI1SVHHOEiURalx/h8riSQ2tM221cPw6AOANqpfYkJ9
         ODuhrJ/aLkjsA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lj1LI-007HOo-JV; Tue, 18 May 2021 17:09:08 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: [PATCH v2 14/17] leds: leds-nuc: add support for HDD activity default
Date:   Tue, 18 May 2021 17:09:03 +0200
Message-Id: <08d9c1d025e25a1a095089b9c38a780aef8fb797.1621349814.git.mchehab+huawei@kernel.org>
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

There are two possible values for HDD activity behavior:

	- 0 Normally off, ON when active
	- 1 Normally on, OFF when active

Implement a logic to set it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/leds/leds-nuc.c | 77 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/drivers/leds/leds-nuc.c b/drivers/leds/leds-nuc.c
index af57f54cfb05..719a57841c03 100644
--- a/drivers/leds/leds-nuc.c
+++ b/drivers/leds/leds-nuc.c
@@ -1629,10 +1629,86 @@ static umode_t nuc_wmi_led_blink_is_visible(struct kobject *kobj,
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
@@ -1660,6 +1736,7 @@ LED_ATTR_POWER_STATE_RW(standby_blink_frequency, blink_frequency, 2);
 
 static struct attribute *nuc_wmi_led_attr[] = {
 	&dev_attr_indicator.attr,
+	&dev_attr_hdd_default.attr,
 	NULL,
 };
 
-- 
2.31.1

