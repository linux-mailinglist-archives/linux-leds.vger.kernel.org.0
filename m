Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A0B44170B5
	for <lists+linux-leds@lfdr.de>; Fri, 24 Sep 2021 13:15:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244891AbhIXLQi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 24 Sep 2021 07:16:38 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:41438 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244448AbhIXLQh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 24 Sep 2021 07:16:37 -0400
Date:   Fri, 24 Sep 2021 13:15:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1632482103;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=fFKGK8ugpZGACTpJ5qRmuYf9VgnaenXYS3xkX26UrjQ=;
        b=bt+laq0ZrJ/wY4bIZEL01Vu2s/PEUAslkAusZoKFuOuh/jZqJjhu9PGI3GCZtli0mMvQMY
        xz0ssUBBjs0VVNJdfvs7IDyJ9g5biOsFstAdBnKBNayeQajjptfEl7Zodg2QL3tPOK+6lU
        PdDFyX7MrPMH744RvJCkEofqisgWlYoZd13h9Ml7xMWS1X+3K9wb5f3NMql6OrBkQrnIxM
        W4edCIJAU+aBWoQsGdX7LrVQzLAZ5P7djRr0VSz4NGp3Xd9FIbpcud9ELtvA5ZD+jQ2dLS
        o2TmP1T0afuXAq1NZDgJ28uydAL27KdjjC5B+WEr9zppXlTXrF2kGE0St3eq1g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1632482103;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type;
        bh=fFKGK8ugpZGACTpJ5qRmuYf9VgnaenXYS3xkX26UrjQ=;
        b=I2StprE7CALAf4AtuDna6g3KTbplVgDCyaOCWfrAXoZCHox00X+lNnJUIJVGKjtQy4G6km
        RIi2y8t/JvAp6YCw==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] leds: trigger: Disable CPU trigger on PREEMPT_RT
Message-ID: <20210924111501.m57cwwn7ahiyxxdd@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The CPU trigger is invoked on ARM from CPU-idle. That trigger later
invokes led_trigger_event() which acquires a read lock in an IRQ-off
section. The problematic part on PREEMPT_RT is that this lock is turned
into a sleeping lock and must not be acquired with disabled interrupts.

The problem continues as that the LED driver underneath must not acquire
any sleeping locks itself.

Disable the CPU trigger on PREEMPT_RT.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/leds/trigger/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/trigger/Kconfig b/drivers/leds/trigger/Kconfig
index 1f1d572880859..dc6816d36d069 100644
--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -64,6 +64,7 @@ config LEDS_TRIGGER_BACKLIGHT
 
 config LEDS_TRIGGER_CPU
 	bool "LED CPU Trigger"
+	depends on !PREEMPT_RT
 	help
 	  This allows LEDs to be controlled by active CPUs. This shows
 	  the active CPUs across an array of LEDs so you can see which
-- 
2.33.0

