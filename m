Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4542526AD64
	for <lists+linux-leds@lfdr.de>; Tue, 15 Sep 2020 21:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727709AbgIOTVq (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 15 Sep 2020 15:21:46 -0400
Received: from mailout.pepperl-fuchs.com ([185.28.7.214]:38219 "EHLO
        mailout.pepperl-fuchs.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727771AbgIOTVl (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Sep 2020 15:21:41 -0400
X-Greylist: delayed 528 seconds by postgrey-1.27 at vger.kernel.org; Tue, 15 Sep 2020 15:21:39 EDT
Received: from pfde-ex2.EU.P-F.BIZ (pfde-ex2.eu.p-f.biz [172.24.5.162])
        by mailout.pepperl-fuchs.com (Postfix) with ESMTP id 7412682976;
        Tue, 15 Sep 2020 21:12:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.pepperl-fuchs.com;
        s=mail; t=1600197169;
        bh=zf9QxKMNzZ5jIH+u98LimxEMyPEwIfem0PoLphl0yVA=;
        h=From:To:CC:Subject:Date;
        b=OIt3VGVukVaR6M27Y2nkHp2SyJ9X1v1ybeJ/Ojieus9d+xfVdKn8MCOqiNXZTzCB3
         f1fYKdHbBDYUxEFFQYnQFyb9DtvOZ6jDLniLAUtWdHr4xq2JL2iiCLhl2bHQS62aoC
         29zh6opwQHCVjHVBQwSdrfBChoI0rJohneaaM8GU=
Received: from pfde-ex2.EU.P-F.BIZ (172.24.5.162) by pfde-ex2.EU.P-F.BIZ
 (172.24.5.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Tue, 15 Sep
 2020 21:12:46 +0200
Received: from pfde-ex2.EU.P-F.BIZ ([fe80::1d2f:1056:2cb8:d231]) by
 pfde-ex2.EU.P-F.BIZ ([fe80::1d2f:1056:2cb8:d231%2]) with mapi id
 15.01.1847.007; Tue, 15 Sep 2020 21:12:46 +0200
From:   Moll Markus <mmoll@de.pepperl-fuchs.com>
To:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
CC:     Riku Voipio <riku.voipio@iki.fi>, Pavel Machek <pavel@ucw.cz>
Subject: [PATCH 2/2] leds: pca9532: use mask and shift helper macros
Thread-Topic: [PATCH 2/2] leds: pca9532: use mask and shift helper macros
Thread-Index: AdaLk9H+b+IDHNwES3aPM/LBy/MH6Q==
Date:   Tue, 15 Sep 2020 19:12:46 +0000
Message-ID: <517672dc62754eafb8e57ec731402236@de.pepperl-fuchs.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.5.159]
x-exclaimer-md-config: 1e262833-c6b8-4d86-a546-40bddc43f2e2
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Each led setting occupies two bits in a corresponding led register.
Accessing these bits requires shifting and masking. The new helper
macros concentrate the computation of those masks in one place.

Signed-off-by: Markus Moll <mmoll@de.pepperl-fuchs.com>
---

 drivers/leds/leds-pca9532.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index d822ffcdbae..890f19d3c62 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -27,6 +27,8 @@
 #define PCA9532_REG_PWM(m, i)(PCA9532_REG_OFFSET(m) + 0x2 + (i) * 2)
 #define LED_REG(m, led)(PCA9532_REG_OFFSET(m) + 0x5 + (led >> 2))
 #define LED_NUM(led)(led & 0x3)
+#define LED_SHIFT(led)(LED_NUM(led) * 2)
+#define LED_MASK(led)(0x3 << LED_SHIFT(led))

 #define ldev_to_led(c)       container_of(c, struct pca9532_led, ldev)

@@ -162,9 +164,9 @@ static void pca9532_setled(struct pca9532_led *led)
 mutex_lock(&data->update_lock);
 reg =3D i2c_smbus_read_byte_data(client, LED_REG(maxleds, led->id));
 /* zero led bits */
-reg =3D reg & ~(0x3<<LED_NUM(led->id)*2);
+reg =3D reg & ~LED_MASK(led->id);
 /* set the new value */
-reg =3D reg | (led->state << LED_NUM(led->id)*2);
+reg =3D reg | (led->state << LED_SHIFT(led->id));
 i2c_smbus_write_byte_data(client, LED_REG(maxleds, led->id), reg);
 mutex_unlock(&data->update_lock);
 }
@@ -260,7 +262,7 @@ static enum pca9532_state pca9532_getled(struct pca9532=
_led *led)

 mutex_lock(&data->update_lock);
 reg =3D i2c_smbus_read_byte_data(client, LED_REG(maxleds, led->id));
-ret =3D (reg >> LED_NUM(led->id) * 2)&0x3;
+ret =3D (reg & LED_MASK(led->id)) >> LED_SHIFT(led->id);
 mutex_unlock(&data->update_lock);
 return ret;
 }
--
2.25.1


i.A. Dr. Markus Moll
Pepperl+Fuchs SE
Gesch=E4ftsbereich VT-IVC
Lilienthalstra=DFe 200
68307 Mannheim
Telefon: +49 621 776 - 4282




Pepperl+Fuchs SE, Mannheim
Vorst=E4nde/Board members: Dr.-Ing. Gunther Kegel (Vors.), Werner Guthier (=
stellv. Vors.), Mehmet Hatiboglu
Vorsitzender des Aufsichtsrats/Chairman of the supervisory board: Michael F=
uchs sen.
Registergericht/Register Court: AG Mannheim HRB 737016 - UST-ID Nr. DE 1438=
77372


Wichtiger Hinweis:
Diese E-Mail einschliesslich ihrer Anhaenge enthaelt vertrauliche und recht=
lich geschuetzte Informationen, die nur fuer den Adressaten bestimmt sind. =
Sollten Sie nicht der bezeichnete Adressat sein, so teilen Sie dies bitte d=
em Absender umgehend mit und loeschen Sie diese Nachricht und ihre Anhaenge=
. Die unbefugte Weitergabe, das Anfertigen von Kopien und jede Veraenderung=
 der E-Mail ist untersagt. Der Absender haftet nicht fuer die Inhalte von v=
eraenderten E-Mails.

Important Information:
This e-mail message including its attachments contains confidential and leg=
ally protected information solely intended for the addressee. If you are no=
t the intended addressee of this message, please contact the addresser imme=
diately and delete this message including its attachments. The unauthorized=
 dissemination, copying and change of this e-mail are strictly forbidden. T=
he addresser shall not be liable for the content of such changed e-mails.
