Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9AA72710F9
	for <lists+linux-leds@lfdr.de>; Sun, 20 Sep 2020 00:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbgISWPy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 19 Sep 2020 18:15:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726740AbgISWPy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 19 Sep 2020 18:15:54 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53518C0613CF
        for <linux-leds@vger.kernel.org>; Sat, 19 Sep 2020 15:15:54 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id D54D9140A98;
        Sun, 20 Sep 2020 00:15:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600553752; bh=l5EZnvD0y3TF1B58/iFHlosNxgMfoWrFOqjt3P7RTFQ=;
        h=From:To:Date;
        b=pS5OnIlLoySwCSvP59eGRB0VIuuFRZILAb6UOAzAVdDG/33MqCZlw2qSqaGVkbsgH
         Gl4ovi5CoF8JBBWmnlSpHp8fBVr9RMz8i+98e10b4BDoHvRP15iGsG9CvOYtYXG1nL
         su2uwyeFvnr3IFr2I3gPtVZjZ2UsvcWuzRycrBrs=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        NeilBrown <neilb@suse.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        "H . Nikolaus Schaller" <hns@goldelico.com>
Subject: [PATCH leds + devicetree 12/13] leds: tca6507: set registers to zero before LEDs/GPIOs registration
Date:   Sun, 20 Sep 2020 00:15:47 +0200
Message-Id: <20200919221548.29984-13-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200919221548.29984-1-marek.behun@nic.cz>
References: <20200919221548.29984-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Spam-Status: No, score=0.00
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The LED registering functions can internally call brightness changes. If
we zero the registers only after LEDs are registered, then the values
set by registration code are lost.

Therefore set chip's registers to zero before registering LEDs/GPIOs.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: NeilBrown <neilb@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: H. Nikolaus Schaller <hns@goldelico.com>
---
 drivers/leds/leds-tca6507.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index e32e628f2e460..ad4af6b6e94c7 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -732,14 +732,14 @@ static int tca6507_probe(struct i2c_client *client,
 	spin_lock_init(&tca->lock);
 	i2c_set_clientdata(client, tca);
 
+	/* set all registers to known state - zero */
+	tca->reg_set = 0x7f;
+	tca6507_work(&tca->work);
+
 	err = tca6507_register_leds_and_gpios(dev, tca);
 	if (err)
 		return err;
 
-	/* set all registers to known state - zero */
-	tca->reg_set = 0x7f;
-	schedule_work(&tca->work);
-
 	return 0;
 }
 
-- 
2.26.2

