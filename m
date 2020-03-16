Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D35C186B7F
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2020 13:54:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731049AbgCPMyD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 Mar 2020 08:54:03 -0400
Received: from enterprise01.smtp.diehl.com ([193.201.238.219]:15517 "EHLO
        enterprise01.smtp.diehl.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730878AbgCPMyD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 16 Mar 2020 08:54:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1584363242; x=1615899242;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=feePxLU3b23qOHVy3Y3+dMLz8Wwo2J+vDu1gQ/r/Dlg=;
  b=r9yeCIsnJiuJuU921o8JBcg7Y02/VuHT3lqGBUEKM5QmYfY329zctI5R
   RR5jo589oe8Mv06A9fuGV9/Gakh4R7nuzZ5omtb2mTMJ85t4z9FuFh1N3
   zKc32Vq4WeY0YmAjqjY/Vjfc/q+xlfo8VsT75+Jo79z5oypymcIjGuCJP
   vSIyzXNDVRqcDgwciayGXVKCpP4O+sB3H8kjaVnbAhRd7Az4C1kes9A7C
   F+Kpgp/tbLYd6nowXOhwArPAjcXHz9u2p0ZJD4HTXK6q3pcRuCfDFoWA6
   SwC3plggKiTs+UlSLWq+3R4I/jzag8vLCx1KVA/pYnsJG0sDqWNsJK6yL
   Q==;
IronPort-SDR: WA+Aep83FvM9YI3o8dqfTDYhu4T82RRZQBGypZw1EWP7u5tOIByDt8zwlabX75il4Wd0Z584EG
 VzNW1U+J0fvw==
From:   Denis Osterland-Heim <denis.osterland@diehl.com>
To:     "dmurphy@ti.com" <dmurphy@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Denis Osterland-Heim" <denis.osterland@diehl.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: [PATCH v3 1/3] leds: pwm: remove header
Thread-Topic: [PATCH v3 1/3] leds: pwm: remove header
Thread-Index: AQHV+5H1Iks8TeXaGE2TwcBBeYu7jA==
Date:   Mon, 16 Mar 2020 12:53:58 +0000
Message-ID: <20200316124851.6303-2-Denis.Osterland@diehl.com>
References: <20200316124851.6303-1-Denis.Osterland@diehl.com>
In-Reply-To: <20200316124851.6303-1-Denis.Osterland@diehl.com>
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
X-GBS-PROC: 415AWy8o668fDtCxszluz0usJCarfP6B29so9zGpOBBwmTyEXYBVke9EOfE4UxBx
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The header is only used by leds_pwm.c, so move contents to leds_pwm.c
and remove it.
Apply minor changes suggested by checkpatch.

Suggested-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Denis Osterland-Heim <Denis.Osterland@diehl.com>
---
 drivers/leds/leds-pwm.c  | 15 ++++++++++++++-
 include/linux/leds_pwm.h | 22 ----------------------
 2 files changed, 14 insertions(+), 23 deletions(-)
 delete mode 100644 include/linux/leds_pwm.h

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 9111cdede0ee..5f69b6571595 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -16,9 +16,22 @@
 #include <linux/leds.h>
 #include <linux/err.h>
 #include <linux/pwm.h>
-#include <linux/leds_pwm.h>
 #include <linux/slab.h>
=20
+struct led_pwm {
+	const char	*name;
+	const char	*default_trigger;
+	unsigned int	pwm_id __deprecated;
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
