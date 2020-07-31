Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ADDC2349A2
	for <lists+linux-leds@lfdr.de>; Fri, 31 Jul 2020 18:51:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732693AbgGaQvZ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 31 Jul 2020 12:51:25 -0400
Received: from enterprise02.smtp.diehl.com ([193.201.238.220]:9804 "EHLO
        enterprise02.smtp.diehl.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729889AbgGaQvY (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 31 Jul 2020 12:51:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1596214283; x=1627750283;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=PnG/70h3N6CUU/w/e7k1IYI8X1CoGva2b7M2lG2roMI=;
  b=Cbap8GNSb0qAX/vXWJN6SEzJ9ArnMgXOpowlhR4nKzuzCJypl1iTInDq
   LkBVh7XIr8FtYqDsC+JYx0QYkj8+12fDSapqipCFrLeEHilYmbyQvFBsF
   q8rj19jhdW4Odjb7FVNoJPfKDglNZr9oTU/33VvbhOHufzFSDtnQ/1B98
   dkogQbnNsRc3YPbLNps1LEya93+c4Q62NZNBH2P3qPQcxoF59n5PnQHDA
   t+Mfy1XMcuD5HRJAaM1oVe0sz5dQxqyO5CgWx/Qx7gHiWoJMzTUNqLMpg
   8e7ouepean8bI+en2Td1y/wXqqrUIigVJ5MQf/pXWvDjQd70u2N6g7QW/
   A==;
IronPort-SDR: c++el8NUJrlHUh1xhQe/nCUJSEVUfk2gmcldw0I8fQeS5K3gwdhXLr930psWvWkQkIeqj7bJz+
 wWFE0wxgHSig==
X-IronPort-AV: E=Sophos;i="5.75,418,1589234400"; 
   d="scan'208";a="65153517"
From:   Denis Osterland-Heim <denis.osterland@diehl.com>
To:     "dmurphy@ti.com" <dmurphy@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Denis Osterland-Heim" <denis.osterland@diehl.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: [PATCH v7 2/3] leds: pwm: add support for default-state device
 property
Thread-Topic: [PATCH v7 2/3] leds: pwm: add support for default-state device
 property
Thread-Index: AQHWZ1rQnUk9+R6ZtE2N61cPqWWIHQ==
Date:   Fri, 31 Jul 2020 16:51:19 +0000
Message-ID: <20200731164945.19515-3-Denis.Osterland@diehl.com>
References: <20200731164945.19515-1-Denis.Osterland@diehl.com>
In-Reply-To: <20200731164945.19515-1-Denis.Osterland@diehl.com>
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
X-GBS-PROC: PkB65aL1SqtESF35r/jQnxtgDjFz6f85lRVDwolbbm+Kx4tdAa60veLkqW/uXjTm
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
 drivers/leds/leds-pwm.c | 49 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index ef7b91bd2064..0c0470c90d5d 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -17,11 +17,13 @@
 #include <linux/err.h>
 #include <linux/pwm.h>
 #include <linux/slab.h>
+#include =22leds.h=22
=20
 struct led_pwm {
 	const char	*name;
 	const char	*default_trigger;
 	u8		active_low;
+	u8		default_state;
 	unsigned int	max_brightness;
 };
=20
@@ -88,7 +90,38 @@ static int led_pwm_add(struct device *dev, struct led_=
pwm_priv *priv,
=20
 	led_data->cdev.brightness_set_blocking =3D led_pwm_set;
=20
-	pwm_init_state(led_data->pwm, &led_data->pwmstate);
+	/* init PWM state */
+	switch (led->default_state) {
+	case LEDS_DEFSTATE_KEEP:
+		pwm_get_state(led_data->pwm, &led_data->pwmstate);
+		if (led_data->pwmstate.period)
+			break;
+		led->default_state =3D LEDS_DEFSTATE_OFF;
+		dev_warn(dev,
+			=22failed to read period for %s, default to off=22,
+			led->name);
+		fallthrough;
+	default:
+		pwm_init_state(led_data->pwm, &led_data->pwmstate);
+		break;
+	}
+
+	/* set brightness */
+	switch (led->default_state) {
+	case LEDS_DEFSTATE_ON:
+		led_data->cdev.brightness =3D led->max_brightness;
+		break;
+	case LEDS_DEFSTATE_KEEP:
+		{
+		uint64_t brightness;
+
+		brightness =3D led->max_brightness;
+		brightness *=3D led_data->pwmstate.duty_cycle;
+		do_div(brightness, led_data->pwmstate.period);
+		led_data->cdev.brightness =3D brightness;
+		}
+		break;
+	}
=20
 	ret =3D devm_led_classdev_register(dev, &led_data->cdev);
 	if (ret) {
@@ -97,11 +130,13 @@ static int led_pwm_add(struct device *dev, struct le=
d_pwm_priv *priv,
 		return ret;
 	}
=20
-	ret =3D led_pwm_set(&led_data->cdev, led_data->cdev.brightness);
-	if (ret) {
-		dev_err(dev, =22failed to set led PWM value for %s: %d=22,
-			led->name, ret);
-		return ret;
+	if (led->default_state !=3D LEDS_DEFSTATE_KEEP) {
+		ret =3D led_pwm_set(&led_data->cdev, led_data->cdev.brightness);
+		if (ret) {
+			dev_err(dev, =22failed to set led PWM value for %s: %d=22,
+				led->name, ret);
+			return ret;
+		}
 	}
=20
 	priv->num_leds++;
@@ -134,6 +169,8 @@ static int led_pwm_create_fwnode(struct device *dev, =
struct led_pwm_priv *priv)
 		fwnode_property_read_u32(fwnode, =22max-brightness=22,
 					 &led.max_brightness);
=20
+		led.default_state =3D led_init_default_state_get(fwnode);
+
 		ret =3D led_pwm_add(dev, priv, &led, fwnode);
 		if (ret) {
 			fwnode_handle_put(fwnode);
--=20
2.28.0



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
