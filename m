Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A63218DEAC
	for <lists+linux-leds@lfdr.de>; Sat, 21 Mar 2020 09:16:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728207AbgCUIQB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Mar 2020 04:16:01 -0400
Received: from enterprise02.smtp.diehl.com ([193.201.238.220]:35341 "EHLO
        enterprise02.smtp.diehl.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728040AbgCUIQA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sat, 21 Mar 2020 04:16:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1584778559; x=1616314559;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KperK5pY8kDhUqv+XcVZUo8pjHw5XqETzsLRKfvjUgc=;
  b=Vl//KZYCLa8h86kj8J8zm0YoffLodTeYvkedYcBq2hf9m1pvGCyd71NA
   cA04Jyp/uyMGNtXPNBreTbbhAZI1xDcncTD1OavccQAN2QHODk7o773pY
   Iss8ldl/PgHtbkTkVAxZehr7MraYRDGMETdqkZCeie4e9HFdpyfCfxUgD
   fEYWHQegSad1LzlkfXyMHhQtPqai/oZoDpDTo2S/B5XNgg+eP8588K43Y
   oMm709ZHTfn7poVBvhRlaipOKoyN7L7Cc1vj6Z4BaCJ+/tQuK8CxiF+uo
   JOVZ7yd+li8LPr77jcuWSmryAyu0VW5TWg2VV/4VrRwvGzPZWrnGwfhoH
   w==;
IronPort-SDR: QIVQuVDqT7ODlWyKM+cZVX3U80JAGzto8mXohnvsz+/Gl3mdTBGLzoId1Hnq8UieJQbkaC/5I1
 bXovyx8RG8GQ==
From:   Denis Osterland-Heim <denis.osterland@diehl.com>
To:     "dmurphy@ti.com" <dmurphy@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Denis Osterland-Heim" <denis.osterland@diehl.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: [PATCH v4 2/5] leds: pwm: remove useless pwm_period_ns
Thread-Topic: [PATCH v4 2/5] leds: pwm: remove useless pwm_period_ns
Thread-Index: AQHV/1jw0S0BPC/2zkeJqXSW2+rxlw==
Date:   Sat, 21 Mar 2020 08:15:53 +0000
Message-ID: <20200321081321.15614-3-Denis.Osterland@diehl.com>
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
X-GBS-PROC: 415AWy8o668fDtCxszluz3Qkyqh7rcy46kDTEvbxZbX6ZbOs5H4UIh8DDIXSwv9+
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This member seems to was a way to pass PWM period to the LED.
Since there is no header anymore, this is useless.

Signed-off-by: Denis Osterland-Heim <Denis.Osterland@diehl.com>
---
 drivers/leds/leds-pwm.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index e1848e80aeb4..6caf8bea8cd5 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -23,7 +23,6 @@ struct led_pwm {
 	const char	*default_trigger;
 	u8		active_low;
 	unsigned int	max_brightness;
-	unsigned int	pwm_period_ns;
 };
=20
 struct led_pwm_platform_data {
@@ -91,9 +90,6 @@ static int led_pwm_add(struct device *dev, struct led_p=
wm_priv *priv,
=20
 	pwm_init_state(led_data->pwm, &led_data->pwmstate);
=20
-	if (!led_data->pwmstate.period)
-		led_data->pwmstate.period =3D led->pwm_period_ns;
-
 	ret =3D devm_led_classdev_register(dev, &led_data->cdev);
 	if (ret =3D=3D 0) {
 		priv->num_leds++;
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
