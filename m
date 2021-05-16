Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63374381E36
	for <lists+linux-leds@lfdr.de>; Sun, 16 May 2021 12:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbhEPKzO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 16 May 2021 06:55:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:47792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229982AbhEPKzI (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 16 May 2021 06:55:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 29F3F6121E;
        Sun, 16 May 2021 10:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621162433;
        bh=h9vGksfsYN6Uc32fL0WmjObXqS0pXNKpGROEG1V8hCI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fVqYMWjlFEM6FXpHotP/eCe8oIJyI3bhbpgSByvZ2c8zcM3NQBw3rQc4OG5RojroU
         9dH9u9ZxpHCwcE8GPcK58IrQpYqdsX48A4VuUsfdH6gIqQ4TCkzfFjhRIOibkfoiOo
         QgUyOL4HiryvJaidHwvG6XhRw3N0ASBulWLQLzLBDD7rAR9LKDNnV1nOvCQb+tEfZ0
         CdUtdyulIYM6f8TwThOhRvfuRoUsRc5vx+mmh/70SbqjJiZ3/l/JWTw/InbpSx25ei
         vmEwy55e+owxNkPln9OPyozrfBSE1KQKoyJmaSjogwm5JYEWepzjSM5tqw4Ah8Dgp1
         eTIA4EJTCXUzw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1liEP9-003s8q-8D; Sun, 16 May 2021 12:53:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Pavel Machek" <pavel@ucw.cz>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 14/17] staging: nuc-wmi: fix software blink behavior logic
Date:   Sun, 16 May 2021 12:53:42 +0200
Message-Id: <26d3ab7a03cb83ec56205add6cd80b8738cd96b0.1621161037.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621161037.git.mchehab+huawei@kernel.org>
References: <cover.1621161037.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The is_visible logic for it is plain wrong:

1. it is used only during devnode creation;
2. it was using the wrong field (id, instead of indicator).

Fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/nuc-led/nuc-wmi.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/nuc-led/nuc-wmi.c b/drivers/staging/nuc-led/nuc-wmi.c
index 68143d45c34c..fab0094a20e4 100644
--- a/drivers/staging/nuc-led/nuc-wmi.c
+++ b/drivers/staging/nuc-led/nuc-wmi.c
@@ -1476,6 +1476,9 @@ static ssize_t show_blink_behavior(struct device *dev,
 	if (led->api_rev == LED_API_NUC6)
 		return nuc6_show_blink_behavior(dev, attr, buf);
 
+	if (led->indicator != LED_IND_SOFTWARE)
+		return -EINVAL;
+
 	return offset_show_blink_behavior(dev, attr, 0, buf);
 }
 
@@ -1489,6 +1492,9 @@ static ssize_t store_blink_behavior(struct device *dev,
 	if (led->api_rev == LED_API_NUC6)
 		return nuc6_store_blink_behavior(dev, attr, buf, len);
 
+	if (led->indicator != LED_IND_SOFTWARE)
+		return -EINVAL;
+
 	return offset_store_blink_behavior(dev, attr, 0, buf, len);
 }
 
@@ -1593,6 +1599,9 @@ static ssize_t show_blink_frequency(struct device *dev,
 	if (led->api_rev == LED_API_NUC6)
 		return nuc6_show_blink_frequency(dev, attr, buf);
 
+	if (led->indicator != LED_IND_SOFTWARE)
+		return -EINVAL;
+
 	return offset_show_blink_frequency(dev, attr, 0, buf);
 }
 
@@ -1606,26 +1615,12 @@ static ssize_t store_blink_frequency(struct device *dev,
 	if (led->api_rev == LED_API_NUC6)
 		return nuc6_store_blink_frequency(dev, attr, buf, len);
 
+	if (led->indicator != LED_IND_SOFTWARE)
+		return -EINVAL;
+
 	return offset_store_blink_frequency(dev, attr, 0, buf, len);
 }
 
-static umode_t nuc_wmi_led_blink_is_visible(struct kobject *kobj,
-					    struct attribute *attr, int idx)
-{
-	struct device *dev = kobj_to_dev(kobj);
-	struct led_classdev *cdev = dev_get_drvdata(dev);
-	struct nuc_nmi_led *led = container_of(cdev, struct nuc_nmi_led, cdev);
-	umode_t mode = attr->mode;
-
-	if (led->api_rev == LED_API_NUC6)
-		return mode;
-
-	if (led->id == LED_IND_SOFTWARE)
-		return mode;
-
-	return 0;
-}
-
 /* HDD activity behavior */
 static ssize_t show_hdd_default(struct device *dev,
 				   struct device_attribute *attr,
@@ -1785,7 +1780,6 @@ static struct attribute *nuc_wmi_led_blink_behavior_attr[] = {
 };
 
 static const struct attribute_group nuc_wmi_led_blink_attribute_group = {
-	.is_visible = nuc_wmi_led_blink_is_visible,
 	.attrs = nuc_wmi_led_blink_behavior_attr,
 };
 
-- 
2.31.1

