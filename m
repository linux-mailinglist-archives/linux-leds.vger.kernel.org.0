Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58220387C06
	for <lists+linux-leds@lfdr.de>; Tue, 18 May 2021 17:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349936AbhERPKq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 18 May 2021 11:10:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:49522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245708AbhERPK3 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 18 May 2021 11:10:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 43DA561376;
        Tue, 18 May 2021 15:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621350550;
        bh=irwt4RJFPgBRv9/8y13zzRL/edaGKx0UeKl9yigDS0M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=db1LhzBiRIIlRiB7UoFwrmSfyzqvvSI2W++A5Tnq/22PoSxQWTZKH7zhmvBSC1bKr
         KNkDRbDgoKNLKqZ8Pqdw1oTLmFE+Fkan3rkNd6ONzlNk+BfjtRERVn6qqxk0JOEh6R
         DExfTiz1iM69QqmjUo0kKsrbmm+Vale6QfYTPZBcbrfEec92tp+H4rQ0/eFr6UsVvL
         SbcW921TtUOcYr0a2QhdBEHEDbL0T6TmjwSQhSn1fRip3wvtUt7/OPscGfZuSLJFx4
         R/4O1IGRIN4Fvo5ZzswS9KfQ5eDyUG19U+yfEDGVEmoyg9S2tH7/rOfNvT6BkmPqld
         pQ1uUwG+YxS8w==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1lj1LI-007HOk-Ho; Tue, 18 May 2021 17:09:08 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Pavel Machek <pavel@ucw.cz>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: [PATCH v2 13/17] leds: leds-nuc: better detect NUC6/NUC7 devices
Date:   Tue, 18 May 2021 17:09:02 +0200
Message-Id: <29e9896e41eec83e8e775295d92fe3034735c792.1621349814.git.mchehab+huawei@kernel.org>
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

There's no documented way to detect if the WMI API is valid,
as, when it is not valid, it just returns 4 zeros.

However, as having a value of 0x00 for the blinking state
is not valid, we can check for it at detection time, in
order to disable LEDs control on devices that won't
support it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/leds/leds-nuc.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/leds/leds-nuc.c b/drivers/leds/leds-nuc.c
index 6aa0bf16c8b7..af57f54cfb05 100644
--- a/drivers/leds/leds-nuc.c
+++ b/drivers/leds/leds-nuc.c
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

