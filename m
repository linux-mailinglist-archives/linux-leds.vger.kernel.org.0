Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC8E218DEB5
	for <lists+linux-leds@lfdr.de>; Sat, 21 Mar 2020 09:16:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728266AbgCUIQL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Mar 2020 04:16:11 -0400
Received: from enterprise02.smtp.diehl.com ([193.201.238.220]:35350 "EHLO
        enterprise02.smtp.diehl.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727961AbgCUIQK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sat, 21 Mar 2020 04:16:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1584778568; x=1616314568;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rAtuuWpp7vXQDSFUAnzPLYg0D3MrIJfjY3pxuv+eRv8=;
  b=tkRjZSXflcGsXyH3PEfGP0D90hrJ6Gxc7lUi/Wzpo4d9EZ+upTeC2m/+
   zFDBjOfMkDq79kxQpJzm3dOIr+UXfwRbsbdHnIgx66cJzb1fPfiB14Gug
   6JvKb1H8+aS5xEjb+pnrfBEsWiG7UogQsEuimEmLOy2y9g3lXSIm0oIuZ
   BLQG+jofrGRhpRNPDE+xkvMKvmmec+Ekklec1DlDYa27zV32R9pCYcsmn
   +SK9eYYgkx5ofuNa1d6xA9fWePAu0pzIXrQ2lLQftcinklL7k+ntXgIT3
   EbkVBTIx1MJ+pcPqWaHTNv1km3vGrT+QM8Gjb24PunLGOMcddnF+In5qX
   Q==;
IronPort-SDR: BBzvbF8Y0nVkkS3xYmIO5QL4B/KrkLKHQ7AyWbwm555p6szc13/7DA73R0W+3C8hr4XT7scgma
 xkkZ5mwXFXcA==
From:   Denis Osterland-Heim <denis.osterland@diehl.com>
To:     "dmurphy@ti.com" <dmurphy@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Denis Osterland-Heim" <denis.osterland@diehl.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: [PATCH v4 5/5] leds: pwm: add reference to common leds for
 default-state
Thread-Topic: [PATCH v4 5/5] leds: pwm: add reference to common leds for
 default-state
Thread-Index: AQHV/1jv4y0tSPQJv0Wp72clTKSY2Q==
Date:   Sat, 21 Mar 2020 08:15:51 +0000
Message-ID: <20200321081321.15614-6-Denis.Osterland@diehl.com>
References: <20200321081321.15614-1-Denis.Osterland@diehl.com>
In-Reply-To: <20200321081321.15614-1-Denis.Osterland@diehl.com>
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
X-GBS-PROC: 415AWy8o668fDtCxszluz7BUnjxMX1ojGuUiAGu+NGs/ca9CoLUYHDf57nxJ6T1T
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
