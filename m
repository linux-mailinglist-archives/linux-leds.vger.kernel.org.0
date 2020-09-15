Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19DD526AD63
	for <lists+linux-leds@lfdr.de>; Tue, 15 Sep 2020 21:21:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727683AbgIOTVp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 15 Sep 2020 15:21:45 -0400
Received: from mailout.pepperl-fuchs.com ([185.28.7.214]:38220 "EHLO
        mailout.pepperl-fuchs.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727886AbgIOTVk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 15 Sep 2020 15:21:40 -0400
Received: from pfde-ex2.EU.P-F.BIZ (pfde-ex2.eu.p-f.biz [172.24.5.162])
        by mailout.pepperl-fuchs.com (Postfix) with ESMTP id 8154282A39;
        Tue, 15 Sep 2020 21:12:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=de.pepperl-fuchs.com;
        s=mail; t=1600197169;
        bh=T7oIZxaZBsofqbaAn2FHYk3t7jwaD46SQAZWwbJajoY=;
        h=From:To:CC:Subject:Date;
        b=E7ZBGfQ5X7IQsSC2sJkViX5SECWa9UsbMDFn4swwdw3REGo+Tcfwwm24WvGghwYFJ
         4o8ke43bkfwl+CI6Zt/i9RHHNtZdPI5dWlF8X1BLoVvMT8clNYJBnVpKrqnnV+N+ic
         MfCpYYqqSQWupqzYKhB2KDwepLhqGEtE1Cp0siyI=
Received: from pfde-ex2.EU.P-F.BIZ (172.24.5.162) by pfde-ex2.EU.P-F.BIZ
 (172.24.5.162) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Tue, 15 Sep
 2020 21:12:46 +0200
Received: from pfde-ex2.EU.P-F.BIZ ([fe80::1d2f:1056:2cb8:d231]) by
 pfde-ex2.EU.P-F.BIZ ([fe80::1d2f:1056:2cb8:d231%2]) with mapi id
 15.01.1847.007; Tue, 15 Sep 2020 21:12:45 +0200
From:   Moll Markus <mmoll@de.pepperl-fuchs.com>
To:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
CC:     Pavel Machek <pavel@ucw.cz>, Riku Voipio <riku.voipio@iki.fi>
Subject: [PATCH 1/2] leds: pca9532: correct shift computation in
 pca9532_getled
Thread-Topic: [PATCH 1/2] leds: pca9532: correct shift computation in
 pca9532_getled
Thread-Index: AdaLkmsbzQ8eoUz8SVikaYSmpwCdhA==
Date:   Tue, 15 Sep 2020 19:12:45 +0000
Message-ID: <6a16ba71ed624748b6601933397e697e@de.pepperl-fuchs.com>
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

Each led occupies two bits in the register, so the required shift is
LED_NUM(id) * 2, exactly as in pca9532_setled. Furthermore, irrelevant
higher bits need to be masked appropriately.

The function is used to implement 'default-status =3D "keep"', which did
not work properly before.

Signed-off-by: Markus Moll <mmoll@de.pepperl-fuchs.com>
---
 drivers/leds/leds-pca9532.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-pca9532.c b/drivers/leds/leds-pca9532.c
index 7d515d5e57b..d822ffcdbae 100644
--- a/drivers/leds/leds-pca9532.c
+++ b/drivers/leds/leds-pca9532.c
@@ -260,7 +260,7 @@ static enum pca9532_state pca9532_getled(struct pca9532=
_led *led)

 mutex_lock(&data->update_lock);
 reg =3D i2c_smbus_read_byte_data(client, LED_REG(maxleds, led->id));
-ret =3D reg >> LED_NUM(led->id)/2;
+ret =3D (reg >> LED_NUM(led->id) * 2) & 0x3;
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
