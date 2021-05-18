Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABCDF387C10
	for <lists+linux-leds@lfdr.de>; Tue, 18 May 2021 17:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350030AbhERPLL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 18 May 2021 11:11:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:49626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344988AbhERPKe (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 18 May 2021 11:10:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 66FDF613AF;
        Tue, 18 May 2021 15:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621350550;
        bh=DLdEfx6xwQIJPGQdiBgHEYPiWWkAAU8NZ8TS0QVIJfo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SHXdEkXqJRbfyeImoZNRyK3cV+2OWJTIzLCRSpmvac0YB36l64vEcf3j8IMHwMzTr
         rdsUkP+i/e/mc97bjaPSUQ8CCMqzes0zhdPPmsv2lrL8ns1LRVUWSf3sbWwqaerr3V
         36c9twPHni0prdQ6TqwkytqFHxa9NWMt2pHLKeFqtehyczzW7jBOXWx2zK7vPZdznG
         emAmqCnOd4VJIzw356tuwW+Sc5Xduo9yncKW/ks1Y5vlTCXogUSvVCYvLF8EEDJcaa
         /U2ltWkejDiQUgsao9DuagaHyWLCjYbN+zSldjWBeUdbaRgKS5C+CwV/RcduEle03H
         3x6cTZSU5Cf4w==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lj1LI-007HOw-MP; Tue, 18 May 2021 17:09:08 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: [PATCH v2 16/17] leds: leds-nuc: add support for changing the ethernet type indicator
Date:   Tue, 18 May 2021 17:09:05 +0200
Message-Id: <792598f4a1a3219b6517057c92559b0f0a95b419.1621349814.git.mchehab+huawei@kernel.org>
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

The Ethernet type indicator can be configured to show the status
of LAN1, LAN1 or both. Add support for it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/leds/leds-nuc.c | 89 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/drivers/leds/leds-nuc.c b/drivers/leds/leds-nuc.c
index 4d4ea6fbeff4..f84ec5662f5c 100644
--- a/drivers/leds/leds-nuc.c
+++ b/drivers/leds/leds-nuc.c
@@ -1698,12 +1698,100 @@ static ssize_t store_hdd_default(struct device *dev,
 	return len;
 }
 
+/* Ethernet type  */
+static const char * const ethernet_type[] = {
+	"LAN1",
+	"LAN2",
+	"LAN1+LAN2"
+};
+
+static ssize_t show_ethernet_type(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+	u8 input[NUM_INPUT_ARGS] = { 0 };
+	u8 output[NUM_OUTPUT_ARGS];
+	int ctrl, ret, val, i, n;
+	int size = PAGE_SIZE;
+	char *p = buf;
+
+	if (led->indicator != LED_IND_ETHERNET)
+		return -EINVAL;
+
+	ctrl = led->reg_table[led->indicator][LED_FUNC_ETH_TYPE];
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
+	for (i = 0; i < ARRAY_SIZE(ethernet_type); i++) {
+		if (i == val)
+			n = scnprintf(p, size, "[%s]  ", ethernet_type[i]);
+		else
+			n = scnprintf(p, size, "%s  ", ethernet_type[i]);
+		p += n;
+		size -= n;
+	}
+	size -= scnprintf(p, size, "\n");
+
+	return PAGE_SIZE - size;
+}
+
+static ssize_t store_ethernet_type(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t len)
+{
+	struct led_classdev *cdev = dev_get_drvdata(dev);
+	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
+	u8 input[NUM_INPUT_ARGS] = { 0 };
+	int ctrl, val, ret;
+	const char *tmp;
+
+	if (led->indicator != LED_IND_ETHERNET)
+		return -EINVAL;
+
+	ctrl = led->reg_table[led->indicator][LED_FUNC_ETH_TYPE];
+
+	if (!nuc_wmi_test_control(dev, led, ctrl))
+		return -ENODEV;
+
+	for (val = 0; val < ARRAY_SIZE(ethernet_type); val++)
+		if (!strcasecmp(tmp, ethernet_type[val]))
+			break;
+
+	if (val >= ARRAY_SIZE(ethernet_type))
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
 
 static LED_ATTR_RW(indicator);
 static LED_ATTR_RW(color);
 static LED_ATTR_RW(blink_behavior);
 static LED_ATTR_RW(blink_frequency);
 static LED_ATTR_RW(hdd_default);
+static LED_ATTR_RW(ethernet_type);
 
 LED_ATTR_POWER_STATE_RW(s0_brightness, brightness, 0);
 LED_ATTR_POWER_STATE_RW(s0_blink_behavior, blink_behavior, 0);
@@ -1732,6 +1820,7 @@ LED_ATTR_POWER_STATE_RW(standby_blink_frequency, blink_frequency, 2);
 static struct attribute *nuc_wmi_led_attr[] = {
 	&dev_attr_indicator.attr,
 	&dev_attr_hdd_default.attr,
+	&dev_attr_ethernet_type.attr,
 	NULL,
 };
 
-- 
2.31.1

