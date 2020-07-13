Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9A421CEF2
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2020 07:45:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728198AbgGMFph (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Jul 2020 01:45:37 -0400
Received: from enterprise01.smtp.diehl.com ([193.201.238.219]:32331 "EHLO
        enterprise01.smtp.diehl.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725804AbgGMFph (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 13 Jul 2020 01:45:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1594619135; x=1626155135;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=FG1fiKCGq6IjBDEa9lBhqy/pbicQpnXIlJbn9BYYlpw=;
  b=j1cUsVY4DwBKwJAxjSLLOM5FvWn4lchjtdKUMPaGOHB/lI6AoBO8AKgA
   9F1Z7zNdRu0fpdK2hB3eOx9oVJFp/Du7NJPF6RWYK/MC8Q3+Wu51Fqz2m
   fKsIWXBFBgTwmH4z5hxzczc8SfK93bMPgctcO3ooGanPsw73KtMHba3Wk
   CNOIY8HYpszqjIcZrnWS5cciMmDt6dwfTVyu1lq6IllpiFcplpcbWu0Yt
   YyPDCGSaweRnX8iau6KsNjcpTiZVrCDhf743703WD04BkyMpbrR20s1qF
   JGV/Erxmxgrnm53e3c7i9YH2xiznDR+U/0mK2dGfxGtjEb6oPQzwpbXyN
   g==;
IronPort-SDR: e+Dqvq5CI9u5z11Qj2ydkkyCBDC4iA1f9hL46hbn58EOLX8Jd51pyjK1RYqUd+KoYTZO4q7IAy
 lToYcR+RWvHg==
X-IronPort-AV: E=Sophos;i="5.75,346,1589234400"; 
   d="scan'208";a="39432126"
From:   Denis Osterland-Heim <denis.osterland@diehl.com>
To:     "dmurphy@ti.com" <dmurphy@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Denis Osterland-Heim" <denis.osterland@diehl.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: [PATCH v6 1/2] leds: pwm: add support for default-state device
 property
Thread-Topic: [PATCH v6 1/2] leds: pwm: add support for default-state device
 property
Thread-Index: AQHWWNjSQP2LVtchSU+nfhnriNBYUA==
Date:   Mon, 13 Jul 2020 05:45:32 +0000
Message-ID: <20200713054259.7608-2-Denis.Osterland@diehl.com>
References: <20200713054259.7608-1-Denis.Osterland@diehl.com>
In-Reply-To: <20200713054259.7608-1-Denis.Osterland@diehl.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-TrailerSkip: 1
X-GBS-PROC: byQFdw3ukCM+zy1/poiPc9DxUHFKa5QuXnUaA65Gx6zwf9MI/d25Zvd3GT5wB3Dg
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patch adds support for =22default-state=22 devicetree property, whic=
h
allows to defer pwm init to first use of led.

This allows to configure the PWM early in bootloader to let the LED
blink until an application in Linux userspace sets something different.

Signed-off-by: Denis Osterland-Heim <Denis.Osterland@diehl.com>
Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
---
 drivers/leds/leds-pwm.c | 54 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 48 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index ef7b91bd2064..7b199c151768 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -18,10 +18,15 @@
 #include <linux/pwm.h>
 #include <linux/slab.h>
=20
+#define LEDS_PWM_DEFSTATE_OFF	0
+#define LEDS_PWM_DEFSTATE_ON	1
+#define LEDS_PWM_DEFSTATE_KEEP	2
+
 struct led_pwm {
 	const char	*name;
 	const char	*default_trigger;
 	u8		active_low;
+	u8		default_state;
 	unsigned int	max_brightness;
 };
=20
@@ -88,7 +93,30 @@ static int led_pwm_add(struct device *dev, struct led_=
pwm_priv *priv,
=20
 	led_data->cdev.brightness_set_blocking =3D led_pwm_set;
=20
-	pwm_init_state(led_data->pwm, &led_data->pwmstate);
+	/* init PWM state */
+	if (led->default_state =3D=3D LEDS_PWM_DEFSTATE_KEEP) {
+		pwm_get_state(led_data->pwm, &led_data->pwmstate);
+		if (!led_data->pwmstate.period) {
+			led->default_state =3D LEDS_PWM_DEFSTATE_OFF;
+			dev_warn(dev,
+				=22failed to read period for %s, default to off=22,
+				led->name);
+		}
+	}
+	if (led->default_state !=3D LEDS_PWM_DEFSTATE_KEEP)
+		pwm_init_state(led_data->pwm, &led_data->pwmstate);
+
+	/* set brightness */
+	if (led->default_state =3D=3D LEDS_PWM_DEFSTATE_ON)
+		led_data->cdev.brightness =3D led->max_brightness;
+	else if (led->default_state =3D=3D LEDS_PWM_DEFSTATE_KEEP) {
+		uint64_t brightness;
+
+		brightness =3D led->max_brightness;
+		brightness *=3D led_data->pwmstate.duty_cycle;
+		do_div(brightness, led_data->pwmstate.period);
+		led_data->cdev.brightness =3D brightness;
+	}
=20
 	ret =3D devm_led_classdev_register(dev, &led_data->cdev);
 	if (ret) {
@@ -97,11 +125,13 @@ static int led_pwm_add(struct device *dev, struct le=
d_pwm_priv *priv,
 		return ret;
 	}
=20
-	ret =3D led_pwm_set(&led_data->cdev, led_data->cdev.brightness);
-	if (ret) {
-		dev_err(dev, =22failed to set led PWM value for %s: %d=22,
-			led->name, ret);
-		return ret;
+	if (led->default_state !=3D LEDS_PWM_DEFSTATE_KEEP) {
+		ret =3D led_pwm_set(&led_data->cdev, led_data->cdev.brightness);
+		if (ret) {
+			dev_err(dev, =22failed to set led PWM value for %s: %d=22,
+				led->name, ret);
+			return ret;
+		}
 	}
=20
 	priv->num_leds++;
@@ -117,6 +147,8 @@ static int led_pwm_create_fwnode(struct device *dev, =
struct led_pwm_priv *priv)
 	memset(&led, 0, sizeof(led));
=20
 	device_for_each_child_node(dev, fwnode) {
+		const char *state =3D NULL;
+
 		ret =3D fwnode_property_read_string(fwnode, =22label=22, &led.name);
 		if (ret && is_of_node(fwnode))
 			led.name =3D to_of_node(fwnode)->name;
@@ -134,6 +166,16 @@ static int led_pwm_create_fwnode(struct device *dev,=
 struct led_pwm_priv *priv)
 		fwnode_property_read_u32(fwnode, =22max-brightness=22,
 					 &led.max_brightness);
=20
+		if (!fwnode_property_read_string(fwnode, =22default-state=22,
+						 &state)) {
+			if (!strcmp(state, =22keep=22))
+				led.default_state =3D LEDS_PWM_DEFSTATE_KEEP;
+			else if (!strcmp(state, =22on=22))
+				led.default_state =3D LEDS_PWM_DEFSTATE_ON;
+			else
+				led.default_state =3D LEDS_PWM_DEFSTATE_OFF;
+		}
+
 		ret =3D led_pwm_add(dev, priv, &led, fwnode);
 		if (ret) {
 			fwnode_handle_put(fwnode);
--=20
2.27.0



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
