Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0EF4381E2E
	for <lists+linux-leds@lfdr.de>; Sun, 16 May 2021 12:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbhEPKzL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 16 May 2021 06:55:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:47726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229845AbhEPKzI (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 16 May 2021 06:55:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EBC5C611AD;
        Sun, 16 May 2021 10:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621162433;
        bh=60ix63Nu6D2Dul5CtMoNGAh9PQM0tFOKH8GuGgj6JCU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cK1Qh+kUPk5zyPWqPQbCTok4Kujw6wB76kcF/DP8naXCecFTUGbxridA0+3gCtOJd
         TC4/5/iIWPtwekb+osUK2nCH9Le4T7Q0JLBK5vwgStk9mZd5xSW70UJt+Rr5FSjNJ4
         DsmoCtuSG8QyBiHDzibvy+9Y3ys6t5G6XVdeOFeQGUvbFYk0cHzJ3wbjD0TwqKKd+c
         I864fGlFc5nljNUnRCDf+MPn+WfestQ1nmxTxfiXt3BVkJ6DFCS335Y5n+kErbR0S6
         HfWthvfYzhLy/8UW2uyPUdAKL377ABEFQguOYJdrIExFU4Cnf8ZJFtAs2jwI1d4eSz
         h9K2mPbrGAvXA==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1liEP9-003s8e-32; Sun, 16 May 2021 12:53:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Pavel Machek" <pavel@ucw.cz>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 11/17] staging: nuc-wmi: implement blink control for NUC6
Date:   Sun, 16 May 2021 12:53:39 +0200
Message-Id: <b10e39f214f921e629983f315812955b0466447f.1621161037.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621161037.git.mchehab+huawei@kernel.org>
References: <cover.1621161037.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The blink control logic for NUC6 API is somewhat messy, as it
uses a single register for controlling both the blink type
and the frequency, using a random order.

Let's use the same API as defined for other versions,
splitting this setting on two different properties.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/nuc-led/nuc-wmi.c | 269 +++++++++++++++++++++++++++++-
 1 file changed, 267 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nuc-led/nuc-wmi.c b/drivers/staging/nuc-led/nuc-wmi.c
index 78b0a3279f25..5bc4dcec3ea8 100644
--- a/drivers/staging/nuc-led/nuc-wmi.c
+++ b/drivers/staging/nuc-led/nuc-wmi.c
@@ -713,6 +713,247 @@ static ssize_t nuc6_store_color(struct device *dev,
 	return len;
 }
 
+enum nuc6_blink_mode_freq {
+	NUC6_BLINK_MODE_BLINK_1HZ	= 0x01,
+	NUC6_BLINK_MODE_BLINK_0_25HZ	= 0x02,
+	NUC6_BLINK_MODE_FADE_1HZ	= 0x03,
+	NUC6_BLINK_MODE_DONT_BLINK	= 0x04,
+
+	/* BIOS equal or upper AY0038 or BN0043 */
+	NUC6_BLINK_MODE_BLINK_0_5HZ	= 0x05,
+	NUC6_BLINK_MODE_FADE_0_25HZ	= 0x06,
+	NUC6_BLINK_MODE_FADE_0_5HZ	= 0x07
+};
+
+enum nuc6_blink_mode {
+	NUC6_BLINK_MODE_SOLID,
+	NUC6_BLINK_MODE_BLINK,
+	NUC6_BLINK_MODE_FADE
+};
+
+static const char * const nuc6_blink_behavior[] = {
+	"solid",
+	"blink",
+	"fade",
+};
+
+enum nuc6_blink_freq {
+	NUC6_BLINK_FREQ_1HZ,
+	NUC6_BLINK_FREQ_0_5HZ,
+	NUC6_BLINK_FREQ_0_25HZ,
+};
+
+static const char * const nuc6_blink_frequency[] = {
+	"1",
+	"0.5",
+	"0.25",
+};
+
+static int nuc_wmi_nuc6_set_blink(struct device *dev,
+				  struct nuc_nmi_led *led,
+				  int freq, enum nuc6_blink_mode mode)
+{
+	int val;
+
+	switch(mode) {
+	case NUC6_BLINK_MODE_SOLID:
+		val = NUC6_BLINK_MODE_DONT_BLINK;
+		break;
+	case NUC6_BLINK_MODE_BLINK:
+		if (freq == NUC6_BLINK_FREQ_0_25HZ)
+			val = NUC6_BLINK_MODE_BLINK_0_25HZ;
+		else if (freq == NUC6_BLINK_FREQ_0_5HZ)
+			val = NUC6_BLINK_MODE_BLINK_0_5HZ;
+		else
+			val = NUC6_BLINK_MODE_BLINK_1HZ;
+		break;
+	case NUC6_BLINK_MODE_FADE:
+		if (freq == NUC6_BLINK_FREQ_0_25HZ)
+			val = NUC6_BLINK_MODE_FADE_0_25HZ;
+		else if (freq == NUC6_BLINK_FREQ_0_5HZ)
+			val = NUC6_BLINK_MODE_FADE_0_5HZ;
+		else
+			val = NUC6_BLINK_MODE_FADE_1HZ;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return nuc_wmi_nuc6_led_get_set(dev, led, NULL, &val, NULL);
+}
+
+static ssize_t nuc6_show_blink_behavior(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buf)
+{
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+	int val = -1, mode = -1, ret, i, n;
+	int size = PAGE_SIZE;
+	char *p = buf;
+
+	ret = nuc_wmi_nuc6_led_get_set(dev, led, NULL, &val, NULL);
+	if (ret)
+		return ret;
+
+	switch (val) {
+	case NUC6_BLINK_MODE_BLINK_1HZ:
+	case NUC6_BLINK_MODE_BLINK_0_25HZ:
+	case NUC6_BLINK_MODE_BLINK_0_5HZ:
+		mode = NUC6_BLINK_MODE_BLINK;
+		break;
+	case NUC6_BLINK_MODE_FADE_1HZ:
+	case NUC6_BLINK_MODE_FADE_0_25HZ:
+	case NUC6_BLINK_MODE_FADE_0_5HZ:
+		mode = NUC6_BLINK_MODE_FADE;
+		break;
+	case NUC6_BLINK_MODE_DONT_BLINK:
+		mode = NUC6_BLINK_MODE_SOLID;
+		break;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(nuc6_blink_behavior); i++) {
+		if (i == mode)
+			n = scnprintf(p, size, "[%s]  ", nuc6_blink_behavior[i]);
+		else
+			n = scnprintf(p, size, "%s  ", nuc6_blink_behavior[i]);
+		p += n;
+		size -= n;
+	}
+	size -= scnprintf(p, size, "\n");
+
+	return PAGE_SIZE - size;
+
+}
+
+static ssize_t nuc6_store_blink_behavior(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t len)
+{
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+	int ret, val = -1, freq;
+	const char *tmp;
+
+	tmp = strsep((char **)&buf, "\n");
+
+	ret = nuc_wmi_nuc6_led_get_set(dev, led, NULL, &val, NULL);
+	if (ret)
+		return ret;
+
+	/* Preserve the frequency */
+	switch (val) {
+	case NUC6_BLINK_MODE_BLINK_0_25HZ:
+	case NUC6_BLINK_MODE_FADE_0_25HZ:
+		freq = NUC6_BLINK_FREQ_0_25HZ;
+		break;
+	case NUC6_BLINK_MODE_BLINK_0_5HZ:
+	case NUC6_BLINK_MODE_FADE_0_5HZ:
+		freq = NUC6_BLINK_FREQ_0_5HZ;
+		break;
+	default:
+		freq = NUC6_BLINK_FREQ_1HZ;
+		break;
+	}
+
+	for (val = ARRAY_SIZE(nuc6_blink_behavior)+1; val >= 0; val--)
+		if (!strcasecmp(tmp, nuc6_blink_behavior[val]))
+			    break;
+	if (val < 0)
+		return -EINVAL;
+
+	ret = nuc_wmi_nuc6_set_blink(dev, led, val, freq);
+	if (ret)
+		return ret;
+
+	return len;
+}
+
+static ssize_t nuc6_show_blink_frequency(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buf)
+{
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+	int val = -1, freq = -1, ret, i, n;
+	int size = PAGE_SIZE;
+	char *p = buf;
+
+	ret = nuc_wmi_nuc6_led_get_set(dev, led, NULL, &val, NULL);
+	if (ret)
+		return ret;
+
+	switch (val) {
+	case NUC6_BLINK_MODE_BLINK_0_25HZ:
+	case NUC6_BLINK_MODE_FADE_0_25HZ:
+		freq = NUC6_BLINK_FREQ_0_25HZ;
+		break;
+	case NUC6_BLINK_MODE_BLINK_0_5HZ:
+	case NUC6_BLINK_MODE_FADE_0_5HZ:
+		freq = NUC6_BLINK_FREQ_0_5HZ;
+		break;
+	default:
+		freq = NUC6_BLINK_FREQ_1HZ;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(nuc6_blink_frequency); i++) {
+		if (i == freq)
+			n = scnprintf(p, size, "[%s]  ", nuc6_blink_frequency[i]);
+		else
+			n = scnprintf(p, size, "%s  ", nuc6_blink_frequency[i]);
+		p += n;
+		size -= n;
+	}
+	size -= scnprintf(p, size, "\n");
+
+	return PAGE_SIZE - size;
+}
+
+static ssize_t nuc6_store_blink_frequency(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t len)
+{
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+	enum nuc6_blink_mode mode;
+	int ret, freq, val = -1;
+	const char *tmp;
+
+	tmp = strsep((char **)&buf, "\n");
+
+	ret = nuc_wmi_nuc6_led_get_set(dev, led, NULL, &val, NULL);
+	if (ret)
+		return ret;
+
+	/* Preserve the blink mode */
+	switch (val) {
+	case NUC6_BLINK_MODE_BLINK_1HZ:
+	case NUC6_BLINK_MODE_BLINK_0_25HZ:
+	case NUC6_BLINK_MODE_BLINK_0_5HZ:
+		mode = NUC6_BLINK_MODE_BLINK;
+		break;
+	case NUC6_BLINK_MODE_FADE_1HZ:
+	case NUC6_BLINK_MODE_FADE_0_25HZ:
+	case NUC6_BLINK_MODE_FADE_0_5HZ:
+		mode = NUC6_BLINK_MODE_FADE;
+		break;
+	default: /* setting frequency NUC6_BLINK_MODE_SOLID won't make sense */
+		return -EINVAL;
+	}
+
+	for (freq = ARRAY_SIZE(nuc6_blink_frequency)+1; freq >= 0; freq--)
+		if (!strcasecmp(tmp, nuc6_blink_frequency[freq]))
+			    break;
+	if (freq < 0)
+		return -EINVAL;
+
+	ret = nuc_wmi_nuc6_set_blink(dev, led, mode, freq);
+	if (ret)
+		return ret;
+
+	return len;
+}
+
 /* Show/change the LED indicator */
 
 static const char * const led_indicators[] = {
@@ -1214,6 +1455,12 @@ static ssize_t show_blink_behavior(struct device *dev,
 				   struct device_attribute *attr,
 				   char *buf)
 {
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+
+	if (led->api_rev == LED_API_NUC6)
+		return nuc6_show_blink_behavior(dev, attr, buf);
+
 	return offset_show_blink_behavior(dev, attr, 0, buf);
 }
 
@@ -1221,6 +1468,12 @@ static ssize_t store_blink_behavior(struct device *dev,
 				    struct device_attribute *attr,
 				    const char *buf, size_t len)
 {
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+
+	if (led->api_rev == LED_API_NUC6)
+		return nuc6_store_blink_behavior(dev, attr, buf, len);
+
 	return offset_store_blink_behavior(dev, attr, 0, buf, len);
 }
 
@@ -1319,6 +1572,12 @@ static ssize_t show_blink_frequency(struct device *dev,
 				   struct device_attribute *attr,
 				   char *buf)
 {
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+
+	if (led->api_rev == LED_API_NUC6)
+		return nuc6_show_blink_frequency(dev, attr, buf);
+
 	return offset_show_blink_frequency(dev, attr, 0, buf);
 }
 
@@ -1326,6 +1585,12 @@ static ssize_t store_blink_frequency(struct device *dev,
 				    struct device_attribute *attr,
 				    const char *buf, size_t len)
 {
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+
+	if (led->api_rev == LED_API_NUC6)
+		return nuc6_store_blink_frequency(dev, attr, buf, len);
+
 	return offset_store_blink_frequency(dev, attr, 0, buf, len);
 }
 
@@ -1337,9 +1602,8 @@ static umode_t nuc_wmi_led_blink_is_visible(struct kobject *kobj,
 	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
 	umode_t mode = attr->mode;
 
-	// TODO: implement for NUC6 API
 	if (led->api_rev == LED_API_NUC6)
-		return 0;
+		return mode;
 
 	if (led->id == LED_IND_SOFTWARE)
 		return mode;
@@ -1443,6 +1707,7 @@ static const struct attribute_group *nuc_wmi_led_attribute_groups[] = {
 
 static const struct attribute_group *nuc_wmi_nuc6_led_attribute_groups[] = {
 	&nuc_wmi_led_color_attribute_group,
+	&nuc_wmi_led_blink_attribute_group,
 	NULL
 };
 
-- 
2.31.1

