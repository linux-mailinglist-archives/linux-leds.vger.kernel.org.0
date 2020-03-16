Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF2D9186B88
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2020 13:54:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731078AbgCPMyF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 Mar 2020 08:54:05 -0400
Received: from enterprise02.smtp.diehl.com ([193.201.238.220]:39077 "EHLO
        enterprise02.smtp.diehl.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731016AbgCPMyE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 16 Mar 2020 08:54:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1584363243; x=1615899243;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rAtuuWpp7vXQDSFUAnzPLYg0D3MrIJfjY3pxuv+eRv8=;
  b=Wfjjsf0tCIb4U5InDHxP68izG+Oz7cDJNUXYBjhrMOvEbCQbVG3mCAuv
   jR2chZ5SoPrf+UYcahhK0DVQxPQ17+DN7HcP8SWOa8MdLapMye/gj5cNH
   1K1hUvmFqg8YdDJbsZXKuwz9l3cZesVlCJp7cfuPzf60voWi5oo/JfGm8
   vkUibKlEnaScYDNmIohQwr8WztDtJsx7kFWxStWpOTa4DyqKTwO510jc1
   WJerZsI60GEIOG2PpieQ8y723Ki3OQddiRX8hb5TC3S6rJ5hZFh+4wZET
   F33QCUsRsDZ3Gm6ReE/I0cwxGYVS3JtJLdbOGdAV5BN2DtAfm7O4SYU9d
   g==;
IronPort-SDR: YL++mGW5MIhCl8QqcRVtXOqw6Magis0N9ifDONAmOPYR0wD+XN5C/62B28D1IRVPhZHRFU6kan
 qt8sZKHR82Ow==
From:   Denis Osterland-Heim <denis.osterland@diehl.com>
To:     "dmurphy@ti.com" <dmurphy@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Denis Osterland-Heim" <denis.osterland@diehl.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: [PATCH v3 3/3] leds: pwm: add reference to common leds for
 default-state
Thread-Topic: [PATCH v3 3/3] leds: pwm: add reference to common leds for
 default-state
Thread-Index: AQHV+5H2vrmXdpP7vk6zewDoYGUoug==
Date:   Mon, 16 Mar 2020 12:54:00 +0000
Message-ID: <20200316124851.6303-4-Denis.Osterland@diehl.com>
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
X-GBS-PROC: 415AWy8o668fDtCxszluz0usJCarfP6B29so9zGpOBDCCPbVOIEMRavJCXLNsob3
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The default-state is now supported for PWM leds.

Signed-off-by: Denis Osterland-Heim <Denis.Osterland@diehl.com>
---
 Documentation/devicetree/bindings/leds/leds-pwm.txt | 2 ++
 1 file changed, 2 insertions(+)

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
