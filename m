Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A86069578
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jul 2019 16:58:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391406AbfGOO5p (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Jul 2019 10:57:45 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:41055 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731999AbfGOO5p (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Jul 2019 10:57:45 -0400
Received: from orion.localdomain ([95.118.111.244]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MORMu-1i6LQj1dJm-00Ptjz; Mon, 15 Jul 2019 16:57:39 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        linux-leds@vger.kernel.org
Subject: [PATCH 3/6] leds: apu: drop iosize field from priv data
Date:   Mon, 15 Jul 2019 16:57:30 +0200
Message-Id: <1563202653-20994-4-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1563202653-20994-1-git-send-email-info@metux.net>
References: <1563202653-20994-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:a5QlfqxNC9mpegKPx69YYUS50jOTAmpdWip2oO48rzaIjJV2h2S
 ezEsCleYu/YVNDUNa4gd3kvtV51aY6cTcfpMyQwSpnsdpgM06cmVGkCqUmIixVKNwyPC4Dq
 4uT6FkngN6KxmK6d0r30dnhNv2yRkzfD6F+cas5n3PiiWOEUrQfKXBywctS7PxD81ClM+Zi
 lE4aJ5WDxszwPuqo7Kvmg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Wi8vDpyQHW0=:Ua/lHXOZHXEWA6yd1eF2W3
 QcTNnSB+7XS733YrY7OKMMauNdEo4FVBtSSnjrMICHYuy4c2kBqEHX5quA+GokDrMooPz3vR2
 tALchpe4SW5z1bjWx/RXsUIy5ZtzLywGVI71xkYwOuDlr6dsCceU/i0AeOUbT4kKMEQqalt3G
 8GULgmKxnOejftllXxLIYkuRF7llKgyX57XI4AxhaatxAsFaYf4Mi6Y9tOgiC1/r/n2ulYgoA
 rl0wnFEcJkaQMy/EN1QlxV/tyh7nQAl7W/e7e65MvPPMkOuMeX5RGs/jyJ/svQH9vutCFXGZ3
 TbyCOGXZjK/Ek++Rz5jmwBNlFYbIjmRc0j0ej3yzX03ofMbM/sUM0zzCTX+d1nAetAl4tK3ij
 fezZZiCyvWbCu18RL1E9KjpqtAP6qmMjHVKXli5VFGq91vR1OeuwZBuyWF+E5EKHyK+E3KuqO
 Dn1dc/q7C5eiBfeAXySErwWM5sM40iJ8GOYZmsoQhXb7hDTNnyfWnPLf8b/fNTBJKABIT7LHl
 LivcceYSfAx/UMAKZgTl2pWydwzUBJmGFRlxiGcXMlVeShWzv2ik5243yEUG0NnroJYtJnrkl
 FMwz9pu+cAvkYTseBjCd+1mlc1lvHpHbaxrYeosvbqi4Iakw0c9/7ZE9iR9pXO7R8fZdPSkRM
 80hqSnHhsrBkgR13cqM2KGMiRHHlHJY5KDnLs33ZXeMXrryIfBwCj5LgndrBOpnqpSG3sb2tK
 PVvs7EwxFMbZamr5bPR/Vpq7DigLnGe7fPWmIQ==
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

As this driver now only supports the APU1 boards, we don't need
to handle different io sizes anymore.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/leds/leds-apu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/leds/leds-apu.c b/drivers/leds/leds-apu.c
index 37b054f..f79146c 100644
--- a/drivers/leds/leds-apu.c
+++ b/drivers/leds/leds-apu.c
@@ -71,7 +71,6 @@ struct apu_led_pdata {
 	struct apu_led_priv *pled;
 	const struct apu_led_profile *profile;
 	int num_led_instances;
-	int iosize; /* for devm_ioremap() */
 	spinlock_t lock;
 };
 
@@ -127,7 +126,7 @@ static int apu_led_config(struct device *dev, struct apu_led_pdata *apuld)
 		led_cdev->brightness_set = apu1_led_brightness_set;
 
 		pled->param.addr = devm_ioremap(dev,
-				apu_led->profile[i].offset, apu_led->iosize);
+				apu_led->profile[i].offset, APU1_IOSIZE);
 		if (!pled->param.addr) {
 			err = -ENOMEM;
 			goto error;
@@ -160,7 +159,6 @@ static int __init apu_led_probe(struct platform_device *pdev)
 
 	apu_led->profile = apu1_led_profile;
 	apu_led->num_led_instances = ARRAY_SIZE(apu1_led_profile);
-	apu_led->iosize = APU1_IOSIZE;
 
 	spin_lock_init(&apu_led->lock);
 	return apu_led_config(&pdev->dev, apu_led);
-- 
1.9.1

