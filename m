Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62E2D387C0F
	for <lists+linux-leds@lfdr.de>; Tue, 18 May 2021 17:10:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350024AbhERPLK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 18 May 2021 11:11:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:49628 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344982AbhERPKe (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 18 May 2021 11:10:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6ADCF613B4;
        Tue, 18 May 2021 15:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621350550;
        bh=8fwuaq8tsCOrCFnHrBrg5Jr8mMwviHOuxKo1IfHykBs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=q7b9VfADkXACHt69AAPgCNc1IWGXY7tSSU89sIzY6b12t3jlbaL28p23dYoz2H773
         F9FzP0clVvTDHchSQJYwlapeP0hx8l8XXv5kY7VkKb40kOxkZ/KrCkH8M60ENDJ14b
         +MFGD3JHLmN+L+87OyxNIoxfz+D4QipuvMhPISZvwn2hmWeTlz/kA5gjxOoce3Ftkm
         g2uWChrKkK0f1Va6TZuyel86dtlggojJOwiZHTAUQ6t2jtsjjeBj9U4/3k68TWsd98
         bDC9g8IlSxNwod1vofcwayKg/jC954BF4ElTtf5GmXlOM3us+7cynBpCmUlqABWW4Q
         0Jv8sqBp/LLNw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lj1LI-007HOs-Kf; Tue, 18 May 2021 17:09:08 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: [PATCH v2 15/17] leds: leds-nuc: fix software blink behavior logic
Date:   Tue, 18 May 2021 17:09:04 +0200
Message-Id: <44aed20dc44c893c12ad26b109a8a0e49bc4dab0.1621349814.git.mchehab+huawei@kernel.org>
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

The is_visible logic for it is plain wrong:

1. it is used only during devnode creation;
2. it was using the wrong field (id, instead of indicator).

Fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/leds/leds-nuc.c | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/drivers/leds/leds-nuc.c b/drivers/leds/leds-nuc.c
index 719a57841c03..4d4ea6fbeff4 100644
--- a/drivers/leds/leds-nuc.c
+++ b/drivers/leds/leds-nuc.c
@@ -1479,6 +1479,9 @@ static ssize_t show_blink_behavior(struct device *dev,
 	if (led->api_rev == LED_API_NUC6)
 		return nuc6_show_blink_behavior(dev, attr, buf);
 
+	if (led->indicator != LED_IND_SOFTWARE)
+		return -EINVAL;
+
 	return offset_show_blink_behavior(dev, attr, 0, buf);
 }
 
@@ -1492,6 +1495,9 @@ static ssize_t store_blink_behavior(struct device *dev,
 	if (led->api_rev == LED_API_NUC6)
 		return nuc6_store_blink_behavior(dev, attr, buf, len);
 
+	if (led->indicator != LED_IND_SOFTWARE)
+		return -EINVAL;
+
 	return offset_store_blink_behavior(dev, attr, 0, buf, len);
 }
 
@@ -1596,6 +1602,9 @@ static ssize_t show_blink_frequency(struct device *dev,
 	if (led->api_rev == LED_API_NUC6)
 		return nuc6_show_blink_frequency(dev, attr, buf);
 
+	if (led->indicator != LED_IND_SOFTWARE)
+		return -EINVAL;
+
 	return offset_show_blink_frequency(dev, attr, 0, buf);
 }
 
@@ -1609,26 +1618,12 @@ static ssize_t store_blink_frequency(struct device *dev,
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
@@ -1788,7 +1783,6 @@ static struct attribute *nuc_wmi_led_blink_behavior_attr[] = {
 };
 
 static const struct attribute_group nuc_wmi_led_blink_attribute_group = {
-	.is_visible = nuc_wmi_led_blink_is_visible,
 	.attrs = nuc_wmi_led_blink_behavior_attr,
 };
 
-- 
2.31.1

