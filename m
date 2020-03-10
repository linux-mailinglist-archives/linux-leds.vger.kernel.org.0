Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFAD917FE3E
	for <lists+linux-leds@lfdr.de>; Tue, 10 Mar 2020 14:34:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728662AbgCJNeA (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Mar 2020 09:34:00 -0400
Received: from enterprise01.smtp.diehl.com ([193.201.238.219]:55608 "EHLO
        enterprise01.smtp.diehl.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727560AbgCJMrK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 10 Mar 2020 08:47:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1583844429; x=1615380429;
  h=from:to:cc:subject:date:message-id:reply-to:
   content-transfer-encoding:mime-version;
  bh=vJMUNeqDMsTha7ppeHbqyximHbM6DIWnSoKrK5grZ1I=;
  b=HI4fouM3osPsipuSsDRORHWMBkCeo5sru6keNAtqcJm2+IplX2APbBn4
   ETbQXy8igc6H6q52eh0c5Q34ByM/N2/PlafESucJWCfI0d4w7vYm6Y6o2
   GoktJzCgv/plND2Nak/xQGp7GMUdUXT/CADJTf4sg/8FRfB8WPgdVygCg
   Fp0eOXO7j9t9dBySwEs2cvc5RscGnzfaAUexsUvA3fX5ryFKWDMNgLvYz
   F1xuVm3Jrhn8oMiWym49xznpd/ovrvS5Z/rG3qFnNHSaX2V9+tFUwp7ra
   4B/gbYBLQlqAgcmLgXhhvRGbwsnLPSGgx+qu/1F+WzFoU7EVEFNglbqxd
   w==;
IronPort-SDR: HJKi4lh+OgEVnpq5+7C8qWg2DW7WiNTN9D7ZiCg5AttouSI2wgSKdTlbxC7drEZyQaa1l7rfCD
 /FSbIuI8n7Sw==
From:   Denis Osterland-Heim <denis.osterland@diehl.com>
To:     "dmurphy@ti.com" <dmurphy@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Denis Osterland-Heim" <denis.osterland@diehl.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: [PATCH v2] leds: pwm: add support for default-state device property
Thread-Topic: [PATCH v2] leds: pwm: add support for default-state device
 property
Thread-Index: AQHV9tn/0ZJlTn83ZkK/QE6qVZtMDw==
Date:   Tue, 10 Mar 2020 12:47:03 +0000
Message-ID: <20200310123126.4709-1-Denis.Osterland@diehl.com>
Reply-To: "20200309082218.13263-1-Denis.Osterland@diehl.com" 
          <20200309082218.13263-1-Denis.Osterland@diehl.com>
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
X-GBS-PROC: byQFdw3ukCM+zy1/poiPc/AZUMLuadj5bOamS2OKQu8jauJJNj7A4I2WQ4sGAD2T
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patch adds support for =22default-state=22 devicetree property, whic=
h
allows to defer pwm init to first use of led.

This allows to configure the PWM early in bootloader to let the LED
blink until an application in Linux userspace set something different.

Signed-off-by: Denis Osterland-Heim <Denis.Osterland@diehl.com>
---
v1->v2:
  - use default-state =3D =22keep=22, as suggested by Jacek Anaszewski
  - calc initial brightness with PWM state from device

 .../devicetree/bindings/leds/leds-pwm.txt     |  2 ++
 drivers/leds/leds-pwm.c                       | 33 +++++++++++++++++--
 include/linux/leds_pwm.h                      |  1 +
 3 files changed, 33 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.txt b/Docume=
ntation/devicetree/bindings/leds/leds-pwm.txt
index 6c6583c35f2f..d0f489680594 100644
--- a/Documentation/devicetree/bindings/leds/leds-pwm.txt
+++ b/Documentation/devicetree/bindings/leds/leds-pwm.txt
@@ -19,6 +19,8 @@ LED sub-node properties:
   see Documentation/devicetree/bindings/leds/common.txt
 - linux,default-trigger :  (optional)
   see Documentation/devicetree/bindings/leds/common.txt
+- default-state : (optional)
+  see Documentation/devicetree/bindings/leds/common.yaml
=20
 Example:
=20
diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 8b6965a563e9..92726c2e43ba 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -75,7 +75,8 @@ static int led_pwm_add(struct device *dev, struct led_p=
wm_priv *priv,
 	led_data->active_low =3D led->active_low;
 	led_data->cdev.name =3D led->name;
 	led_data->cdev.default_trigger =3D led->default_trigger;
-	led_data->cdev.brightness =3D LED_OFF;
+	ret =3D led->default_state =3D=3D LEDS_GPIO_DEFSTATE_ON;
+	led_data->cdev.brightness =3D ret =3F led->max_brightness : LED_OFF;
 	led_data->cdev.max_brightness =3D led->max_brightness;
 	led_data->cdev.flags =3D LED_CORE_SUSPENDRESUME;
=20
@@ -97,7 +98,8 @@ static int led_pwm_add(struct device *dev, struct led_p=
wm_priv *priv,
 	 * FIXME: pwm_apply_args() should be removed when switching to the
 	 * atomic PWM API.
 	 */
-	pwm_apply_args(led_data->pwm);
+	if (led->default_state !=3D LEDS_GPIO_DEFSTATE_KEEP)
+		pwm_apply_args(led_data->pwm);
=20
 	pwm_get_args(led_data->pwm, &pargs);
=20
@@ -105,10 +107,23 @@ static int led_pwm_add(struct device *dev, struct l=
ed_pwm_priv *priv,
 	if (!led_data->period && (led->pwm_period_ns > 0))
 		led_data->period =3D led->pwm_period_ns;
=20
+	if (led->default_state =3D=3D LEDS_GPIO_DEFSTATE_KEEP) {
+		uint64_t brightness;
+		struct pwm_device *pwm =3D led_data->pwm;
+		struct pwm_state state;
+
+		pwm->chip->ops->get_state(pwm->chip, pwm, &state);
+		brightness =3D led->max_brightness * state.duty_cycle;
+		do_div(brightness, state.period);
+		led_data->cdev.brightness =3D (enum led_brightness)brightness;
+	}
+
 	ret =3D devm_led_classdev_register(dev, &led_data->cdev);
 	if (ret =3D=3D 0) {
 		priv->num_leds++;
-		led_pwm_set(&led_data->cdev, led_data->cdev.brightness);
+		if (led->default_state !=3D LEDS_GPIO_DEFSTATE_KEEP)
+			led_pwm_set(&led_data->cdev,
+					led_data->cdev.brightness);
 	} else {
 		dev_err(dev, =22failed to register PWM led for %s: %d=5Cn=22,
 			led->name, ret);
@@ -126,6 +141,8 @@ static int led_pwm_create_fwnode(struct device *dev, =
struct led_pwm_priv *priv)
 	memset(&led, 0, sizeof(led));
=20
 	device_for_each_child_node(dev, fwnode) {
+		const char *state =3D NULL;
+
 		ret =3D fwnode_property_read_string(fwnode, =22label=22, &led.name);
 		if (ret && is_of_node(fwnode))
 			led.name =3D to_of_node(fwnode)->name;
@@ -143,6 +160,16 @@ static int led_pwm_create_fwnode(struct device *dev,=
 struct led_pwm_priv *priv)
 		fwnode_property_read_u32(fwnode, =22max-brightness=22,
 					 &led.max_brightness);
=20
+		if (!fwnode_property_read_string(fwnode, =22default-state=22,
+						 &state)) {
+			if (!strcmp(state, =22keep=22))
+				led.default_state =3D LEDS_GPIO_DEFSTATE_KEEP;
+			else if (!strcmp(state, =22on=22))
+				led.default_state =3D LEDS_GPIO_DEFSTATE_ON;
+			else
+				led.default_state =3D LEDS_GPIO_DEFSTATE_OFF;
+		}
+
 		ret =3D led_pwm_add(dev, priv, &led, fwnode);
 		if (ret) {
 			fwnode_handle_put(fwnode);
diff --git a/include/linux/leds_pwm.h b/include/linux/leds_pwm.h
index 93d101d28943..c9ef9012913d 100644
--- a/include/linux/leds_pwm.h
+++ b/include/linux/leds_pwm.h
@@ -10,6 +10,7 @@ struct led_pwm {
 	const char	*default_trigger;
 	unsigned	pwm_id __deprecated;
 	u8 		active_low;
+	u8		default_state;
 	unsigned 	max_brightness;
 	unsigned	pwm_period_ns;
 };
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
