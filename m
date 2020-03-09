Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 004B017DAE5
	for <lists+linux-leds@lfdr.de>; Mon,  9 Mar 2020 09:31:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726071AbgCIIbX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Mar 2020 04:31:23 -0400
Received: from enterprise02.smtp.diehl.com ([193.201.238.220]:23378 "EHLO
        enterprise02.smtp.diehl.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725796AbgCIIbX (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 9 Mar 2020 04:31:23 -0400
X-Greylist: delayed 430 seconds by postgrey-1.27 at vger.kernel.org; Mon, 09 Mar 2020 04:31:22 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1583742682; x=1615278682;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=UgnIsQyrw7V0RiG+5o4AS/b+Nah9kEs6rkBtBbKMBog=;
  b=KgvIPbuCgunfKgnvu6jsOkhtPSmMiqmdGglzBmjQhHPYTbWejvC4FVGD
   0p7n5vYGohhzfFTh6rscxlUjKViPdjokuGopL86zAPCARWYWE5vw8ENEQ
   VxbS4PDfsKgHprSSWzco4/xWDVp5RBCdqTerWGCEFsd2bf1Too6+N6+mK
   0jrCZbQr/a2vkybl4CDrfxQ4crSUtDi1d1cP4WNNySGPAUNRoXD88CNJb
   +UQEFPWW99OIWW+xH4HeWg2IOybVVzwy0zDUx3xT8T09NUho66AFm7nLv
   TCEPTdpAzt3vsSgDphWymkyQAnOZDdjrk4yjy9ptXVaA13lP5zx2dyDzy
   A==;
IronPort-SDR: tG2W2IlNj001FKiGJn+JIVXn/ulyclJn6PgAvVSosfqgLki2eO5UiXHQRTzUimUQ32F0NJ82oq
 MZIW9saqpznA==
From:   Denis Osterland-Heim <denis.osterland@diehl.com>
To:     "dmurphy@ti.com" <dmurphy@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Denis Osterland-Heim" <denis.osterland@diehl.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: [RFC PATCH] leds: pwm: add flag to start without PWM init
Thread-Topic: [RFC PATCH] leds: pwm: add flag to start without PWM init
Thread-Index: AQHV9ewaOIgIxoAtxUq/BaTh5/4IBw==
Date:   Mon, 9 Mar 2020 08:24:09 +0000
Message-ID: <20200309082218.13263-1-Denis.Osterland@diehl.com>
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
X-GBS-PROC: PkB65aL1SqtESF35r/jQn+utJHGlOfM4q7b0EC8/4akyCQ5zbSEBILSrYpOrT7a6
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patch add =22pwm,uninitalized=22 devicetree flag support to pwm
leds, which allows to defer pwm init to first use of led.

This allows to configure the PWM early in bootloader to let the LED
blink until an application in Linux userspace set something different.

Signed-off-by: Denis Osterland-Heim <Denis.Osterland@diehl.com>
---
Hi,

I want to ask if such a patch is intresting for mainline and
if it is woth to think about how to represent this state to user space.

Regards Denis

 Documentation/devicetree/bindings/leds/leds-pwm.txt |  1 +
 drivers/leds/leds-pwm.c                             | 10 ++++++++--
 include/linux/leds_pwm.h                            |  1 +
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-pwm.txt b/Docume=
ntation/devicetree/bindings/leds/leds-pwm.txt
index 6c6583c35f2f..4f58df631fc9 100644
--- a/Documentation/devicetree/bindings/leds/leds-pwm.txt
+++ b/Documentation/devicetree/bindings/leds/leds-pwm.txt
@@ -19,6 +19,7 @@ LED sub-node properties:
   see Documentation/devicetree/bindings/leds/common.txt
 - linux,default-trigger :  (optional)
   see Documentation/devicetree/bindings/leds/common.txt
+- pwm,uninitalized : defer PWM init to first brightness change of led
=20
 Example:
=20
diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 8b6965a563e9..02c90f05602a 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -97,7 +97,8 @@ static int led_pwm_add(struct device *dev, struct led_p=
wm_priv *priv,
 	 * FIXME: pwm_apply_args() should be removed when switching to the
 	 * atomic PWM API.
 	 */
-	pwm_apply_args(led_data->pwm);
+	if (!led->pwm_uninitialized)
+		pwm_apply_args(led_data->pwm);
=20
 	pwm_get_args(led_data->pwm, &pargs);
=20
@@ -108,7 +109,9 @@ static int led_pwm_add(struct device *dev, struct led=
_pwm_priv *priv,
 	ret =3D devm_led_classdev_register(dev, &led_data->cdev);
 	if (ret =3D=3D 0) {
 		priv->num_leds++;
-		led_pwm_set(&led_data->cdev, led_data->cdev.brightness);
+		if (!led->pwm_uninitialized)
+			led_pwm_set(&led_data->cdev,
+					led_data->cdev.brightness);
 	} else {
 		dev_err(dev, =22failed to register PWM led for %s: %d=5Cn=22,
 			led->name, ret);
@@ -143,6 +146,9 @@ static int led_pwm_create_fwnode(struct device *dev, =
struct led_pwm_priv *priv)
 		fwnode_property_read_u32(fwnode, =22max-brightness=22,
 					 &led.max_brightness);
=20
+		led.pwm_uninitialized =3D fwnode_property_read_bool(fwnode,
+							=22pwm,uninitialized=22);
+
 		ret =3D led_pwm_add(dev, priv, &led, fwnode);
 		if (ret) {
 			fwnode_handle_put(fwnode);
diff --git a/include/linux/leds_pwm.h b/include/linux/leds_pwm.h
index 93d101d28943..0b04dfd43654 100644
--- a/include/linux/leds_pwm.h
+++ b/include/linux/leds_pwm.h
@@ -10,6 +10,7 @@ struct led_pwm {
 	const char	*default_trigger;
 	unsigned	pwm_id __deprecated;
 	u8 		active_low;
+	u8		pwm_uninitialized;
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
