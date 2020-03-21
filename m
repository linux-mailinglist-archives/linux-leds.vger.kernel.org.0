Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 70AB618DEB9
	for <lists+linux-leds@lfdr.de>; Sat, 21 Mar 2020 09:16:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728262AbgCUIQK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Mar 2020 04:16:10 -0400
Received: from enterprise01.smtp.diehl.com ([193.201.238.219]:12449 "EHLO
        enterprise01.smtp.diehl.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728247AbgCUIQJ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sat, 21 Mar 2020 04:16:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1584778569; x=1616314569;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PZZKSh2KXGWrjP7LgCelpSRuWflVunnD5QhUJZ1nsBQ=;
  b=Jo9ESMpkOwP1MqlmPWDhFyYTt3uH8lRRhEm1PY60wUTO9zdsvX0BQdj+
   SPzPwJG7fY9AcEQZMn2FDYFtCyOAD8iBA65ob9QIDv/1XWA3AyUTmzHsQ
   ywrgPdjro6oQ8hSIQfxAeWQ1OTUPUG7wAylfUPecAMdH4CFLBjgZpiG4v
   7208Mb7SbtfK7qMYk53CeaXR7sdN5kQaS77qEYMFODOPD3dzcCf9yXN2m
   eQ5YIWQvaDk4sJaBV59bzewYlafhHm+3pAToFuSrk0TXEJ7icAZ9NArwQ
   Zrq0VJ3CnvJrp3Vw/Zd3yOyCaUBK/EhIJ4zP52WNtVVmeJSlwc5mQ4yJG
   g==;
IronPort-SDR: nREVm1FwUL51wSzUEnDLB/DUwVk1OK6CQh1CH+YktPy9KeKGqc9kpzPl1C5IC6pnXcnatbujsG
 UnyLQn1RaDNA==
From:   Denis Osterland-Heim <denis.osterland@diehl.com>
To:     "dmurphy@ti.com" <dmurphy@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Denis Osterland-Heim" <denis.osterland@diehl.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: [PATCH v4 1/5] leds: pwm: remove header
Thread-Topic: [PATCH v4 1/5] leds: pwm: remove header
Thread-Index: AQHV/1jw95ejBv9Q1kWuOGZzdTUiGA==
Date:   Sat, 21 Mar 2020 08:15:53 +0000
Message-ID: <20200321081321.15614-2-Denis.Osterland@diehl.com>
References: <20200321081321.15614-1-Denis.Osterland@diehl.com>
In-Reply-To: <20200321081321.15614-1-Denis.Osterland@diehl.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-TrailerSkip: 1
X-GBS-PROC: PkB65aL1SqtESF35r/jQn7YYrFe7TNyCmnU8Zv2PHXoOZwPucGHZVz6NcGmC5daB
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The header is only used by leds_pwm.c, so move contents to leds_pwm.c
and remove it.
Apply minor changes suggested by checkpatch.
Remove deprecated and unused pwm_id member.

Suggested-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Denis Osterland-Heim <Denis.Osterland@diehl.com>
---
 drivers/leds/leds-pwm.c  | 14 +++++++++++++-
 include/linux/leds_pwm.h | 22 ----------------------
 2 files changed, 13 insertions(+), 23 deletions(-)
 delete mode 100644 include/linux/leds_pwm.h

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 9111cdede0ee..e1848e80aeb4 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -16,9 +16,21 @@
 #include <linux/leds.h>
 #include <linux/err.h>
 #include <linux/pwm.h>
-#include <linux/leds_pwm.h>
 #include <linux/slab.h>
=20
+struct led_pwm {
+	const char	*name;
+	const char	*default_trigger;
+	u8		active_low;
+	unsigned int	max_brightness;
+	unsigned int	pwm_period_ns;
+};
+
+struct led_pwm_platform_data {
+	int		num_leds;
+	struct led_pwm	*leds;
+};
+
 struct led_pwm_data {
 	struct led_classdev	cdev;
 	struct pwm_device	*pwm;
diff --git a/include/linux/leds_pwm.h b/include/linux/leds_pwm.h
deleted file mode 100644
index 93d101d28943..000000000000
--- a/include/linux/leds_pwm.h
+++ /dev/null
@@ -1,22 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * PWM LED driver data - see drivers/leds/leds-pwm.c
- */
-#ifndef __LINUX_LEDS_PWM_H
-#define __LINUX_LEDS_PWM_H
-
-struct led_pwm {
-	const char	*name;
-	const char	*default_trigger;
-	unsigned	pwm_id __deprecated;
-	u8 		active_low;
-	unsigned 	max_brightness;
-	unsigned	pwm_period_ns;
-};
-
-struct led_pwm_platform_data {
-	int			num_leds;
-	struct led_pwm	*leds;
-};
-
-#endif
--=20
2.25.1



Diehl Connectivity Solutions GmbH
Gesch=E4ftsf=FChrung: Horst Leonberger
Sitz der Gesellschaft: N=FCrnberg - Registergericht: Amtsgericht
N=FCrnberg: HRB 32315
_________________________________________________________________________=
__________________________

Der Inhalt der vorstehenden E-Mail ist nicht rechtlich bindend. Diese E-M=
ail enthaelt vertrauliche und/oder rechtlich geschuetzte Informationen.
Informieren Sie uns bitte, wenn Sie diese E-Mail faelschlicherweise erhal=
ten haben. Bitte loeschen Sie in diesem Fall die Nachricht.
Jede unerlaubte Form der Reproduktion, Bekanntgabe, Aenderung, Verteilung=
 und/oder Publikation dieser E-Mail ist strengstens untersagt.
- Informationen zum Datenschutz, insbesondere zu Ihren Rechten, erhalten =
Sie unter https://www.diehl.com/group/de/transparenz-und-informationspfli=
chten/

The contents of the above mentioned e-mail is not legally binding. This e=
-mail contains confidential and/or legally protected information. Please =
inform us if you have received this e-mail by
mistake and delete it in such a case. Each unauthorized reproduction, dis=
closure, alteration, distribution and/or publication of this e-mail is st=
rictly prohibited.=20
- For general information on data protection and your respective rights p=
lease visit https://www.diehl.com/group/en/transparency-and-information-o=
bligations/
