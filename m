Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4986FF43
	for <lists+linux-leds@lfdr.de>; Mon, 22 Jul 2019 14:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727541AbfGVMJV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 22 Jul 2019 08:09:21 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:39705 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727164AbfGVMJV (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 22 Jul 2019 08:09:21 -0400
Received: from orion.localdomain ([77.2.59.209]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MekGB-1iNDJv36EX-00amPr; Mon, 22 Jul 2019 14:09:14 +0200
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        linux-leds@vger.kernel.org
Subject: [PATCH v2] leds: apu: fix error message on probing failure
Date:   Mon, 22 Jul 2019 14:08:51 +0200
Message-Id: <1563797331-20993-1-git-send-email-info@metux.net>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <f54bb3f1-2699-1213-f568-b2c529488306@gmail.com>
References: <f54bb3f1-2699-1213-f568-b2c529488306@gmail.com>
X-Provags-ID: V03:K1:twfbsdyrMY1t8hU0eBnLydbY1wE9g/y95PqHR65xBHZZmB6WuWu
 OdEdXmyaLgx31ljrxTvBh2exohkXbLJ6FTsrK+5+GOF/TcbW65DpnGLpfNkpiq6KXF5B7JG
 mCZD36RJPaUWOVi/A+a1qGiu8SqTS5gntKe9+wohlUQ+P+n1KVPKR1pH+5i/84kaxJHwM9K
 w1JD4Hm77TStf2SpDKy9Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:wPAEYyhkoC8=:wgNty8SQYgWNjCgY6oUu9c
 ySl77B1ICFcqAvTuW6xJpuCzSBu9fueX/YPb+WMqJOWKz5ZLpA/FWDs3mqyjbMFcmRUJYWTTL
 4i1Uei15et+oqi6G8nJSe2FIger3PzkRqFpvhlBWEhTuTzwpeUAcBtans4of/R4zGV5qjcBmM
 w0YfMC8MXkLYadC0H0xuCUmsE28YqlSufaNzBel2Yzm7K+9FeKcq2WM+ro3YDYKdtJaLxpqcX
 y9l4qDissfZJbYcww71HF9QGa41UIJGbFkKjV+rwQdVOZ3tRcpfyALXbTrOFCnWDfgkTRP3SU
 dvhnARiyrIqvr9YMsFL26gpJvovrcobDkHXib/quSO312ipLhVqTjY+RrfbTCFtuFZlV0z8Sk
 /iJAIUlG7I71Gsdjg46bAJgTthOQBB3v2ze5ZF1WGxwEqsyDMxIGOYFf82gwzZS4XXeL/tK10
 oUd5X9FRqYr/r9Prebz6fxQAr+emRXFtgtBseB8VwdnfNJhEBqYxqQmm3umBgAMWEuCvGqAFb
 jMNYuspItKGJKLliftd0Vwd/1hTpxKFgC1T+dBEWBPHpYlJhet2Be5onvdO/OqP9T1IcZSx6r
 ke0fKNIfixdmLuZAA6alhJWXvwBA0c613FPOFeLI3Ap26S0mbViptI4LHp3R6zYsnTCKglsKG
 DdbuqlVjPEKlWXFM13fj5B5ZtO4e2V6klEwB2EVm/D0YFDuvtWAljj2QTOXW0muW0rB0gwQLY
 0rpnMQZ7CnjIF1AjVa8Wvdwi1t7u6IOG/kUNAw==
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
index 451cb9f..d794f49 100644
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
+		pr_err("No PC Engines APUv1 board detected. For APUv2,3 support, enable CONFIG_PCENGINES_APU2\n");
 		return -ENODEV;
 	}
 
-- 
1.9.1

