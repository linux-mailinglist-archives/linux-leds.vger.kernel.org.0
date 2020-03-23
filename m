Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD61818F180
	for <lists+linux-leds@lfdr.de>; Mon, 23 Mar 2020 10:14:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727650AbgCWJOP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 23 Mar 2020 05:14:15 -0400
Received: from enterprise02.smtp.diehl.com ([193.201.238.220]:42738 "EHLO
        enterprise02.smtp.diehl.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726037AbgCWJOO (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 23 Mar 2020 05:14:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1584954853; x=1616490853;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=h7MKj78br5bevc3yJERvh6RsXRecxwNZwY4L0iEdVf4=;
  b=aIuTbsNZLK1a6c223o6GaBHgKLZwWsjZd2mCbwbXnENQBIVTnpj7YUuk
   mDdnNkX6/nGzxhkuvz2xgcY5zQokwPY51FA0nvf6ECL6JQeY4RPU2nUpM
   5OOk/UA5K3hcK51Fh7dOI1w/AOSxBXzmY2AWbQvKhsHgZk1MkHctxrLFc
   wsQazS1f++4BrI6VI9ia7M/+iQoF49Wu2bXFShQ7yjtPAQPXhzRXR3pi2
   ZK9CNN0gdxvrgs71HTg+FkrfkB9O4uewKn7/FnMsZhwhaWuyAftKbq7Qs
   pPp5UPVklsk7rzhcQmSCnUHsab0cRipBpPjiTK4ohAv/eh7IPjv3sdI+X
   g==;
IronPort-SDR: g5HfhDMrrz1UuX2EFDd4yK5bLf6CtNaXsx6gi8mgZ5IxtnAu69WKRaNgZrPfTnYxgn2CZVQKcq
 9VIIfEVa12fQ==
From:   Denis Osterland-Heim <denis.osterland@diehl.com>
To:     "dmurphy@ti.com" <dmurphy@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>
CC:     Denis Osterland-Heim <denis.osterland@diehl.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: [PATCH v4] leds: pwm: check result of led_pwm_set() in led_pwm_add()
Thread-Topic: [PATCH v4] leds: pwm: check result of led_pwm_set() in
 led_pwm_add()
Thread-Index: AQHWAPNprlb/rYMY0E2oDLJ9oUB47g==
Date:   Mon, 23 Mar 2020 09:14:10 +0000
Message-ID: <20200323091243.23140-1-Denis.Osterland@diehl.com>
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
X-GBS-PROC: byQFdw3ukCM+zy1/poiPc1XB7Els37C/Owm81uvOshzceWBsb8FY77IDpYY/3EM1
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

led_pwm_set() now returns an error when setting the PWM fails.

Signed-off-by: Denis Osterland-Heim <Denis.Osterland@diehl.com>
---
 drivers/leds/leds-pwm.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index 6caf8bea8cd5..07eab2d8b7c7 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -91,15 +91,21 @@ static int led_pwm_add(struct device *dev, struct led=
_pwm_priv *priv,
 	pwm_init_state(led_data->pwm, &led_data->pwmstate);
=20
 	ret =3D devm_led_classdev_register(dev, &led_data->cdev);
-	if (ret =3D=3D 0) {
-		priv->num_leds++;
-		led_pwm_set(&led_data->cdev, led_data->cdev.brightness);
-	} else {
+	if (ret) {
 		dev_err(dev, =22failed to register PWM led for %s: %d=5Cn=22,
 			led->name, ret);
+		return ret;
 	}
=20
-	return ret;
+	ret =3D led_pwm_set(&led_data->cdev, led_data->cdev.brightness);
+	if (ret) {
+		dev_err(dev, =22failed to set led PWM value for %s: %d=22,
+			led->name, ret);
+		return ret;
+	}
+
+	priv->num_leds++;
+	return 0;
 }
=20
 static int led_pwm_create_fwnode(struct device *dev, struct led_pwm_priv=
 *priv)
--=20
2.25.2



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
