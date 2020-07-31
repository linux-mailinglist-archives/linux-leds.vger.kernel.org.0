Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 346AD2349AB
	for <lists+linux-leds@lfdr.de>; Fri, 31 Jul 2020 18:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732932AbgGaQvd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 31 Jul 2020 12:51:33 -0400
Received: from enterprise02.smtp.diehl.com ([193.201.238.220]:9809 "EHLO
        enterprise02.smtp.diehl.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732474AbgGaQv0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 31 Jul 2020 12:51:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1596214285; x=1627750285;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=9im/ryNwa77q+W0U0nQsF0clIs2BoxnyZNJa+ycU9Pw=;
  b=b+grd5GzjP+6TY7XlUNx9nIpBnsqLwuiDJSLOburZbsM4Hg+KJdQEH6P
   InVSeNlXNPapVs/aN3m8D4riR1QlBj8Be5ytZdH8BwYW1J3qrOMEhdEha
   Y1P4dhW0LoBXGsEDBTTdUUx4P5XSaOWYCK12zcQ7LKn4eOzLBCmh2pqjh
   v7TVVg+GBOk9SngKVHz1bneYV5QMPvN4fV6XoY0wodhc5qfiOV8nX382K
   yn4q3Bi/cX+odWRki6PCh1yR8b3Twn0E84ii2FXOktyNu51kHrUO/mSPh
   LTVSrMsXSHpBiCB8GwJNnCGD5HNEd5NSu5SgqKHj71UAY1iFVVink6miU
   g==;
IronPort-SDR: c0eRmP+6OX//ndFc9V7Zn2tTMsDelRISJIt7jYxrxjgbe+aBzk5y1jDEVzuKnrZqIhfNzH0w9q
 bMlny+cV5KKA==
X-IronPort-AV: E=Sophos;i="5.75,418,1589234400"; 
   d="scan'208";a="65153518"
From:   Denis Osterland-Heim <denis.osterland@diehl.com>
To:     "dmurphy@ti.com" <dmurphy@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Denis Osterland-Heim" <denis.osterland@diehl.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: [PATCH v7 1/3] leds: move default_state read from fwnode to core
Thread-Topic: [PATCH v7 1/3] leds: move default_state read from fwnode to core
Thread-Index: AQHWZ1rRGh0zx45XjEmzN6NiUu4AEg==
Date:   Fri, 31 Jul 2020 16:51:21 +0000
Message-ID: <20200731164945.19515-2-Denis.Osterland@diehl.com>
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
X-GBS-PROC: 5x5xXKsZ7k4sJw6jWwvS4uZcHK5bu42RN30SnBLCwEex4wX9j8rroIL85q/h5+oQ
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patch introduces a new function to read initial
default_state from fwnode.

Signed-off-by: Denis Osterland-Heim <Denis.Osterland@diehl.com>
---
 drivers/leds/led-core.c  | 15 +++++++++++++++
 drivers/leds/leds-gpio.c | 12 ++----------
 drivers/leds/leds.h      |  1 +
 include/linux/leds.h     | 12 +++++++++---
 4 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index 846248a0693d..0ef220c154e4 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -478,3 +478,18 @@ int led_compose_name(struct device *dev, struct led_=
init_data *init_data,
 	return 0;
 }
 EXPORT_SYMBOL_GPL(led_compose_name);
+
+enum led_default_state led_init_default_state_get(struct fwnode_handle *=
fwnode)
+{
+	const char *state =3D NULL;
+
+	if (!fwnode_property_read_string(fwnode, =22default-state=22, &state)) =
{
+		if (!strcmp(state, =22keep=22))
+			return LEDS_DEFSTATE_KEEP;
+		if (!strcmp(state, =22on=22))
+			return LEDS_DEFSTATE_ON;
+	}
+
+	return LEDS_DEFSTATE_OFF;
+}
+EXPORT_SYMBOL_GPL(led_init_default_state_get);
diff --git a/drivers/leds/leds-gpio.c b/drivers/leds/leds-gpio.c
index cf84096d88ce..564a7f497ac0 100644
--- a/drivers/leds/leds-gpio.c
+++ b/drivers/leds/leds-gpio.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 #include <linux/slab.h>
+#include =22leds.h=22
=20
 struct gpio_led_data {
 	struct led_classdev cdev;
@@ -143,7 +144,6 @@ static struct gpio_leds_priv *gpio_leds_create(struct=
 platform_device *pdev)
 	device_for_each_child_node(dev, child) {
 		struct gpio_led_data *led_dat =3D &priv->leds[priv->num_leds];
 		struct gpio_led led =3D {};
-		const char *state =3D NULL;
=20
 		/*
 		 * Acquire gpiod from DT with uninitialized label, which
@@ -163,15 +163,7 @@ static struct gpio_leds_priv *gpio_leds_create(struc=
t platform_device *pdev)
 		fwnode_property_read_string(child, =22linux,default-trigger=22,
 					    &led.default_trigger);
=20
-		if (!fwnode_property_read_string(child, =22default-state=22,
-						 &state)) {
-			if (!strcmp(state, =22keep=22))
-				led.default_state =3D LEDS_GPIO_DEFSTATE_KEEP;
-			else if (!strcmp(state, =22on=22))
-				led.default_state =3D LEDS_GPIO_DEFSTATE_ON;
-			else
-				led.default_state =3D LEDS_GPIO_DEFSTATE_OFF;
-		}
+		led.default_state =3D led_init_default_state_get(child);
=20
 		if (fwnode_property_present(child, =22retain-state-suspended=22))
 			led.retain_state_suspended =3D 1;
diff --git a/drivers/leds/leds.h b/drivers/leds/leds.h
index 2d9eb48bbed9..73451f64e916 100644
--- a/drivers/leds/leds.h
+++ b/drivers/leds/leds.h
@@ -29,6 +29,7 @@ ssize_t led_trigger_read(struct file *filp, struct kobj=
ect *kobj,
 ssize_t led_trigger_write(struct file *filp, struct kobject *kobj,
 			struct bin_attribute *bin_attr, char *buf,
 			loff_t pos, size_t count);
+enum led_default_state led_init_default_state_get(struct fwnode_handle *=
fwnode);
=20
 extern struct rw_semaphore leds_list_lock;
 extern struct list_head leds_list;
diff --git a/include/linux/leds.h b/include/linux/leds.h
index 6a8d6409c993..db16c3ebc6b4 100644
--- a/include/linux/leds.h
+++ b/include/linux/leds.h
@@ -33,6 +33,12 @@ enum led_brightness {
 	LED_FULL	=3D 255,
 };
=20
+enum led_default_state {
+	LEDS_DEFSTATE_OFF	=3D 0,
+	LEDS_DEFSTATE_ON	=3D 1,
+	LEDS_DEFSTATE_KEEP	=3D 2,
+};
+
 struct led_init_data {
 	/* device fwnode handle */
 	struct fwnode_handle *fwnode;
@@ -522,9 +528,9 @@ struct gpio_led {
 	/* default_state should be one of LEDS_GPIO_DEFSTATE_(ON|OFF|KEEP) */
 	struct gpio_desc *gpiod;
 };
-#define LEDS_GPIO_DEFSTATE_OFF		0
-#define LEDS_GPIO_DEFSTATE_ON		1
-#define LEDS_GPIO_DEFSTATE_KEEP		2
+#define LEDS_GPIO_DEFSTATE_OFF		LEDS_DEFSTATE_OFF
+#define LEDS_GPIO_DEFSTATE_ON		LEDS_DEFSTATE_ON
+#define LEDS_GPIO_DEFSTATE_KEEP		LEDS_DEFSTATE_KEEP
=20
 struct gpio_led_platform_data {
 	int 		num_leds;
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
