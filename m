Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31F0B447D5A
	for <lists+linux-leds@lfdr.de>; Mon,  8 Nov 2021 11:12:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237837AbhKHKPC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 8 Nov 2021 05:15:02 -0500
Received: from mail.skyhub.de ([5.9.137.197]:38270 "EHLO mail.skyhub.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237768AbhKHKPB (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 8 Nov 2021 05:15:01 -0500
Received: from zn.tnic (p200300ec2f33110088892b77bd117736.dip0.t-ipconnect.de [IPv6:2003:ec:2f33:1100:8889:2b77:bd11:7736])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 29D311EC04F9;
        Mon,  8 Nov 2021 11:12:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
        t=1636366336;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ok6efC5SIYiZoq3Clku/LtEsHTmqVaorOG6QGXtd3dk=;
        b=SQUhFEWQBwPq/6BEKGcT0itOj4YwUwG+OmoGrgl5k/aVhd2Vty8rgPP38HcEQgA8flQb3V
        RF9JVB1aURvtcSN6s2kikYUaWQbitlJ7mA94sUFIwqlPrtUGonfiONJ8m/orMP4ON8Z9+S
        tqig2lU6KlIEZL01HiAqnuc9i/fp8G8=
From:   Borislav Petkov <bp@alien8.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     linux-leds@vger.kernel.org
Subject: [PATCH v0 10/42] leds: trigger: Check notifier registration return value
Date:   Mon,  8 Nov 2021 11:11:25 +0100
Message-Id: <20211108101157.15189-11-bp@alien8.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211108101157.15189-1-bp@alien8.de>
References: <20211108101157.15189-1-bp@alien8.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Borislav Petkov <bp@suse.de>

Avoid homegrown notifier registration checks.

No functional changes.

Signed-off-by: Borislav Petkov <bp@suse.de>
Cc: linux-leds@vger.kernel.org
---
 drivers/leds/trigger/ledtrig-activity.c  | 6 ++++--
 drivers/leds/trigger/ledtrig-heartbeat.c | 6 ++++--
 drivers/leds/trigger/ledtrig-panic.c     | 4 ++--
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-activity.c b/drivers/leds/trigger/ledtrig-activity.c
index 30bc9df03636..c2b7a3d322f3 100644
--- a/drivers/leds/trigger/ledtrig-activity.c
+++ b/drivers/leds/trigger/ledtrig-activity.c
@@ -247,8 +247,10 @@ static int __init activity_init(void)
 	int rc = led_trigger_register(&activity_led_trigger);
 
 	if (!rc) {
-		atomic_notifier_chain_register(&panic_notifier_list,
-					       &activity_panic_nb);
+		if (atomic_notifier_chain_register(&panic_notifier_list,
+						   &activity_panic_nb))
+			pr_warn("Activity LED trigger notifier already registered\n");
+
 		register_reboot_notifier(&activity_reboot_nb);
 	}
 	return rc;
diff --git a/drivers/leds/trigger/ledtrig-heartbeat.c b/drivers/leds/trigger/ledtrig-heartbeat.c
index 7fe0a05574d2..747c5113d528 100644
--- a/drivers/leds/trigger/ledtrig-heartbeat.c
+++ b/drivers/leds/trigger/ledtrig-heartbeat.c
@@ -190,8 +190,10 @@ static int __init heartbeat_trig_init(void)
 	int rc = led_trigger_register(&heartbeat_led_trigger);
 
 	if (!rc) {
-		atomic_notifier_chain_register(&panic_notifier_list,
-					       &heartbeat_panic_nb);
+		if (atomic_notifier_chain_register(&panic_notifier_list,
+						   &heartbeat_panic_nb))
+			pr_warn("Heartbeat LED Trigger notifier already registered\n");
+
 		register_reboot_notifier(&heartbeat_reboot_nb);
 	}
 	return rc;
diff --git a/drivers/leds/trigger/ledtrig-panic.c b/drivers/leds/trigger/ledtrig-panic.c
index 64abf2e91608..c5103f51c3de 100644
--- a/drivers/leds/trigger/ledtrig-panic.c
+++ b/drivers/leds/trigger/ledtrig-panic.c
@@ -64,8 +64,8 @@ static long led_panic_blink(int state)
 
 static int __init ledtrig_panic_init(void)
 {
-	atomic_notifier_chain_register(&panic_notifier_list,
-				       &led_trigger_panic_nb);
+	if (atomic_notifier_chain_register(&panic_notifier_list, &led_trigger_panic_nb))
+		pr_warn("LED trigger panic notifier already registered\n");
 
 	led_trigger_register_simple("panic", &trigger);
 	panic_blink = led_panic_blink;
-- 
2.29.2

