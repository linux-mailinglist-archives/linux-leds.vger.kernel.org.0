Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFF54381E39
	for <lists+linux-leds@lfdr.de>; Sun, 16 May 2021 12:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231421AbhEPKzQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 16 May 2021 06:55:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:47714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230156AbhEPKzI (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 16 May 2021 06:55:08 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2738A61206;
        Sun, 16 May 2021 10:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621162433;
        bh=nW7fKI5PUZp/UFI+qdts0R8ZO5545PmLjbtP18ZvdUY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lwK2y20RmkTHDsgizXnSMAd6PWGlj5TCMzfS72fOYQSXFDUIiJZbphFFFLl8Ri+x4
         kodfzbhHL/J3Dhd4sVdcHtycssqt7FnSN9W8RbmjgvgmKIKthwkYRdHa11AQ8mOOyS
         X2x2z6Rg2aYOdPJj07Gn/P6u1l7taF+7gV95IrI1v+GMW3Mn6UGBi6CQsmFZhrpBAr
         W5DIbegL0Ihpwz+CprlNP1qKI8vaMGhZdaTWjHpTNu90CqTMJFdy++92ENL2T2Xa+l
         ZPzsgSv3HCe5qP6gsQ/bw5Pgt/jI0X5t/X7M5CElWWwRdm2mqoWXMlGTLUWeld8LVy
         dyMByQCKcYxrQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1liEP9-003s8i-4w; Sun, 16 May 2021 12:53:51 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     gregkh@linuxfoundation.org
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Pavel Machek" <pavel@ucw.cz>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 12/17] staging: nuc-wmi: better detect NUC6/NUC7 devices
Date:   Sun, 16 May 2021 12:53:40 +0200
Message-Id: <bca097a3ce2ab35fcd38eb3abdc8090c2c531048.1621161037.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1621161037.git.mchehab+huawei@kernel.org>
References: <cover.1621161037.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

There's no documented way to detect if the WMI API is valid,
as, when it is not valid, it just returns 4 zeros.

However, as having a value of 0x00 for the blinking state
is not valid, we can check for it at detection time, in
order to disable LEDs control on devices that won't
support it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/nuc-led/nuc-wmi.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/staging/nuc-led/nuc-wmi.c b/drivers/staging/nuc-led/nuc-wmi.c
index 5bc4dcec3ea8..1a6e2b17c888 100644
--- a/drivers/staging/nuc-led/nuc-wmi.c
+++ b/drivers/staging/nuc-led/nuc-wmi.c
@@ -312,6 +312,13 @@ static int nuc_wmi_query_leds_nuc6(struct device *dev)
 		return ret;
 	}
 
+	/*
+	 * Detect if NUC6/NUC7 supports the WMI API by checking the
+	 * returned blink state, as valid values range from 0x01 to 0x07.
+	 */
+	if (output[1] == 0x00)
+		return -ENODEV;
+
 	led = &priv->led[priv->num_leds];
 	led->id = POWER_LED;
 	led->color_type = LED_BLUE_AMBER;
@@ -325,6 +332,14 @@ static int nuc_wmi_query_leds_nuc6(struct device *dev)
 		dev_warn(dev, "Get S0 Ring: error %d\n", ret);
 		return ret;
 	}
+
+	/*
+	 * Detect if NUC6/NUC7 supports the WMI API by checking the
+	 * returned blink state, as valid values range from 0x01 to 0x07.
+	 */
+	if (output[1] == 0x00)
+		return -ENODEV;
+
 	led = &priv->led[priv->num_leds];
 	led->id = RING_LED;
 	led->color_type = LED_BLUE_AMBER;
-- 
2.31.1

