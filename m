Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1BA186B87
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2020 13:54:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731075AbgCPMyF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 Mar 2020 08:54:05 -0400
Received: from enterprise01.smtp.diehl.com ([193.201.238.219]:15522 "EHLO
        enterprise01.smtp.diehl.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731023AbgCPMyE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 16 Mar 2020 08:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1584363243; x=1615899243;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ER2QqLcezibDMSXGEObfIVVmWurWCCq2yGT0KmuLoQ0=;
  b=OnmS4CBrLk9Ua2vXBRBJmnt3lAkWq3DWJbrjtv/Y+oJpJh+qWgw5j1MI
   Sz27jFNcs6YdkSrdhhKoa/JU0bYDPvy2yqFde0gPq0Eu6hvG295opQtHb
   yY0OX1nxhzIZKDGjHr34mBYsFiEcY/I+ZykEyD76Llbd5jPSErj+ECmtd
   suVdkwYi80y/kQQlt9ra8pXihEV2lx5tteJrGuwj4AK7EHhFigZjQrfGV
   9x8XjhaxJ/IdiqoKOvwlOU4HbUPmSFVZRbEEA+OjkO7kg+5zGJBji8jN4
   aSXMcTPQn+eMWUF5B5RgDmKYlZWDQNkG3Kqp4v8bHQk5LzXaQwmMWHszS
   g==;
IronPort-SDR: NiPyy0izlDW5CsecNNrAyuLfm5QQKAlYX6OuB5Y4F0oSILp78ExVKpsVGHhExBJHxOOibUkyRw
 GcWvSuZL2Mdg==
From:   Denis Osterland-Heim <denis.osterland@diehl.com>
To:     "dmurphy@ti.com" <dmurphy@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Denis Osterland-Heim" <denis.osterland@diehl.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: [PATCH v3 2/3] leds: pwm: add support for default-state device
 property
Thread-Topic: [PATCH v3 2/3] leds: pwm: add support for default-state device
 property
Thread-Index: AQHV+5H21uxgWjW9wEe6B/TzHpI38w==
Date:   Mon, 16 Mar 2020 12:53:59 +0000
Message-ID: <20200316124851.6303-3-Denis.Osterland@diehl.com>
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
X-GBS-PROC: 415AWy8o668fDtCxszluz0usJCarfP6B29so9zGpOBCP3VvdIGTGcW31xNRj+VSU
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
---
 drivers/leds/leds-pwm.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 5f69b6571595..fce7969e7918 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -18,11 +18,16 @@
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
 	unsigned int	pwm_id __deprecated;
 	u8		active_low;
+	u8		default_state;
 	unsigned int	max_brightness;
 	unsigned int	pwm_period_ns;
 };
@@ -72,7 +77,6 @@ static int led_pwm_add(struct device *dev, struct led_p=
wm_priv *priv,
 	led_data->active_low =3D led->active_low;
 	led_data->cdev.name =3D led->name;
 	led_data->cdev.default_trigger =3D led->default_trigger;
-	led_data->cdev.brightness =3D LED_OFF;
 	led_data->cdev.max_brightness =3D led->max_brightness;
 	led_data->cdev.flags =3D LED_CORE_SUSPENDRESUME;
=20
@@ -92,13 +96,27 @@ static int led_pwm_add(struct device *dev, struct led=
_pwm_priv *priv,
=20
 	pwm_init_state(led_data->pwm, &led_data->pwmstate);
=20
+	if (led->default_state =3D=3D LEDS_PWM_DEFSTATE_ON)
+		led_data->cdev.brightness =3D led->max_brightness;
+	else if (led->default_state =3D=3D LEDS_PWM_DEFSTATE_KEEP) {
+		uint64_t brightness;
+
+		pwm_get_state(led_data->pwm, &led_data->pwmstate);
+		brightness =3D led->max_brightness;
+		brightness *=3D led_data->pwmstate.duty_cycle;
+		do_div(brightness, led_data->pwmstate.period);
+		led_data->cdev.brightness =3D (enum led_brightness)brightness;
+	}
+
 	if (!led_data->pwmstate.period)
 		led_data->pwmstate.period =3D led->pwm_period_ns;
=20
 	ret =3D devm_led_classdev_register(dev, &led_data->cdev);
 	if (ret =3D=3D 0) {
 		priv->num_leds++;
-		led_pwm_set(&led_data->cdev, led_data->cdev.brightness);
+		if (led->default_state !=3D LEDS_PWM_DEFSTATE_KEEP)
+			led_pwm_set(&led_data->cdev,
+					led_data->cdev.brightness);
 	} else {
 		dev_err(dev, =22failed to register PWM led for %s: %d=5Cn=22,
 			led->name, ret);
@@ -116,6 +134,8 @@ static int led_pwm_create_fwnode(struct device *dev, =
struct led_pwm_priv *priv)
 	memset(&led, 0, sizeof(led));
=20
 	device_for_each_child_node(dev, fwnode) {
+		const char *state =3D NULL;
+
 		ret =3D fwnode_property_read_string(fwnode, =22label=22, &led.name);
 		if (ret && is_of_node(fwnode))
 			led.name =3D to_of_node(fwnode)->name;
@@ -133,6 +153,16 @@ static int led_pwm_create_fwnode(struct device *dev,=
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
