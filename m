Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 455C56957F
	for <lists+linux-leds@lfdr.de>; Mon, 15 Jul 2019 16:58:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390853AbfGOO6J (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 15 Jul 2019 10:58:09 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:41859 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391203AbfGOO5q (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 15 Jul 2019 10:57:46 -0400
Received: from orion.localdomain ([95.118.111.244]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MQeI4-1i8XHm0850-00Ngop; Mon, 15 Jul 2019 16:57:40 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        linux-leds@vger.kernel.org
Subject: [PATCH 5/6] leds: apu: fix error on probing failure
Date:   Mon, 15 Jul 2019 16:57:32 +0200
Message-Id: <1563202653-20994-6-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1563202653-20994-1-git-send-email-info@metux.net>
References: <1563202653-20994-1-git-send-email-info@metux.net>
X-Provags-ID: V03:K1:QI5rtPQ3bK0AHvmaHVmXuB3T42TP0bp/kIiIn7Ga+GahivZv3am
 a3/qSgR7iY2fuJB4TEqN4Ax5DbX4/RtzX3rNl3Jxw/XucJhTahFmDZFzlXdlngiBe96FXHU
 sjNsHJ6AKJ0FcYl0ibpF7zRG0z7AkSyVo4vZrJmd9pMmOpo8cbSTIyUViedm6aTPSLsacPi
 lXp3uHR1q2vave97xHtdg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:T55pZtApU3E=:1rqzZlArG6nNJjkJPOUZku
 6NLy2wq7GLDG8lxXiRvb2RT1XXae7XXqPxqPuMtemWFUpmQLKJeCvQWhKOhSL8XnYMVdEjP46
 VxcYsk2vmXm4G8gj3SAS+9IedY9f7V5PmwAERaTkULM4fjUiU6Va0NU7A5o82bAcUGQvKFXwJ
 asdusn6e6e8DuZUtc/+sY+0YSgm2iPmMt6VW+1YWipZVAaS8j+Kg32iooT2e6puNIOHH/rkAz
 h9KFzpI9sD9ERjXCfeOSuvktCdtn3siVtHqlf1kMMVWnI8s41LeeSM4FR/ig0xwbtPXcjK+1i
 oXF2oyPIFyZUq+4jUYfDDSmpfHlLaJficwrnfvl4RsHjpQ8eI/SOiVHwB+ZMaIhQbxASN5cSS
 gNB/KbEB6u1tPRDhGkF2mLrnxoxPQ1U2C5ANEsmfR+k3Ot+NYj7c5nTa4N/UbQzZhCKNbQmy4
 dbtLNildMyiPZDmBYhQIKYSiz7VMe80cRGNen/rfy7x85FdEdM3xKPevSc6z/lhoJpHLGfkPe
 CJIzIGk+nQDqP2pSMuJ7hMgqgmra4qjLEIM5eTL9rcEQUEXjIGpAKqgWoHXLfeN3u0jn0vNGC
 9crJWVQ0IOdwaAinPjjdkFMu4LD2d+XxQXh7h6sANGHJ11xWOXMRw2xRoYzWRg5/bWo3HQ9ia
 CDjSwc7xj1HBwQ3QVVN+Sz71JfDbR4hiTC/PgNcjpSs6BAKael4f9zQXEJ8hJrXQtmTbESxWT
 MGarGUGkytXVHU5P9bGpfaPLP4E0hqs1OdFhVg==
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Enrico Weigelt <info@metux.net>

The current error message on failed probing tends to be a bit
misleading. Fix it to tell exactly that an APU v1 was not found.

Signed-off-by: Enrico Weigelt <info@metux.net>
---
 drivers/leds/leds-apu.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/leds/leds-apu.c b/drivers/leds/leds-apu.c
index 451cb9f..892fea7 100644
--- a/drivers/leds/leds-apu.c
+++ b/drivers/leds/leds-apu.c
@@ -170,13 +170,9 @@ static int __init apu_led_init(void)
 	struct platform_device *pdev;
 	int err;
 
-	if (!dmi_match(DMI_SYS_VENDOR, "PC Engines")) {
-		pr_err("No PC Engines board detected\n");
-		return -ENODEV;
-	}
-	if (!(dmi_match(DMI_PRODUCT_NAME, "APU"))) {
-		pr_err("Unknown PC Engines board: %s\n",
-				dmi_get_system_info(DMI_PRODUCT_NAME));
+	if (!(dmi_match(DMI_SYS_VENDOR, "PC Engines") &&
+	      dmi_match(DMI_PRODUCT_NAME, "APU"))) {
+		pr_err("No PC Engines APUv1 board detected\n");
 		return -ENODEV;
 	}
 
-- 
1.9.1

