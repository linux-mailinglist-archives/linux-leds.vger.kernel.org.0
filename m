Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E143D42BBC4
	for <lists+linux-leds@lfdr.de>; Wed, 13 Oct 2021 11:37:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237064AbhJMJjZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 13 Oct 2021 05:39:25 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:33636 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238229AbhJMJjY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 13 Oct 2021 05:39:24 -0400
Date:   Wed, 13 Oct 2021 11:37:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1634117840;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c6t1294zW40uTsgxhF7VflF36oGN1GJDjpJ6UZNbMv8=;
        b=k2cB4NifrEAxdkAvWlikOkg/0PYbHrdGigI6YSwC/M9BYdUKxC3pURtJ156FIx/UNJD0di
        pKfdK414dtMw659ycLGXRuQ5mshBMFKV46vEChCCEtDfwSM4e79yQdVdNjnEScMdY7QZAC
        WAphHINskHwJlU2quUGyZeUMyvHo62WWc06fqX/iDs/4rfEmsxknkPBs4wMu6l/ZlnYODj
        P7IZ7R8C4NQhrbDZghfVHrnvpvLkcQ374Gy6f3cu4K9eLf/x0nG2uY+AGZli7a0RrAg7bX
        IYQbG8yLPDMPDK/zw1k/gu3HfycEw/HIfA0fXu345SRgrgLCUxsoeX1ED0W4SA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1634117840;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=c6t1294zW40uTsgxhF7VflF36oGN1GJDjpJ6UZNbMv8=;
        b=IX07gSlIFEOW8Pmrb1EjaLXwrZUQXJtNGFIP+vJXV54hQ5vRSu3po38vWsjkgrRsy1czN3
        pGMwJtDM1ObAgMDw==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Thomas Gleixner <tglx@linutronix.de>, johannes.berg@intel.com,
        linux-leds@vger.kernel.org
Subject: [PATCH v2] leds: trigger: Disable CPU trigger on PREEMPT_RT
Message-ID: <20211013093719.tur5427notjy6rbq@linutronix.de>
References: <20210924111501.m57cwwn7ahiyxxdd@linutronix.de>
 <20210927142345.GB18276@duo.ucw.cz>
 <87wnn2av6h.ffs@tglx>
 <20210927154451.GA17112@duo.ucw.cz>
 <20210927171802.uak3tbpqaig3mm7m@linutronix.de>
 <20210927190650.GA13992@duo.ucw.cz>
 <20210927193424.glrddglskpohbosn@linutronix.de>
 <20211013080838.GA10864@amd>
 <20211013083900.g4pqwpov62cm2zsw@linutronix.de>
 <20211013084237.GA13150@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211013084237.GA13150@amd>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The CPU trigger is invoked on ARM from CPU-idle. That trigger later
invokes led_trigger_event() which may invoke the callback of the actual dri=
ver.
That driver can acquire a spinlock_t which is okay on kernel without
PREEMPT_RT. On a PREEMPT_RT enabled kernel this lock is turned into a
sleeping lock and must not be acquired with disabled interrupts.

Disable the CPU trigger on PREEMPT_RT.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Link: https://lkml.kernel.org/r/20210924111501.m57cwwn7ahiyxxdd@linutronix.=
de
---
v1=E2=80=A6v2: Reword commit message now that read lock has been removed.

 drivers/leds/trigger/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- a/drivers/leds/trigger/Kconfig
+++ b/drivers/leds/trigger/Kconfig
@@ -64,6 +64,7 @@ config LEDS_TRIGGER_BACKLIGHT
=20
 config LEDS_TRIGGER_CPU
 	bool "LED CPU Trigger"
+	depends on !PREEMPT_RT
 	help
 	  This allows LEDs to be controlled by active CPUs. This shows
 	  the active CPUs across an array of LEDs so you can see which
