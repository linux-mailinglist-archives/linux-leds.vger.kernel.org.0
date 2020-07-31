Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3032349A7
	for <lists+linux-leds@lfdr.de>; Fri, 31 Jul 2020 18:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732881AbgGaQv0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 31 Jul 2020 12:51:26 -0400
Received: from enterprise01.smtp.diehl.com ([193.201.238.219]:47076 "EHLO
        enterprise01.smtp.diehl.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729910AbgGaQv0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 31 Jul 2020 12:51:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1596214283; x=1627750283;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=N/rnszOrJJ1bhhZKh1f2/GEXIZPrIDcWvxdEGYmNLhQ=;
  b=hb/AW1ApDa11DWF+9Pl7TPqQsU3D36VIZFxzDNY40dGVbrDjKEZFx0R1
   vpVSB3NfYNW9Srj9N3J4YJcdctcoi0g0oiIPraXqUT9uYvUi61xOY8ow1
   TSoO2sbkBOWyaqRIyLCQ1By2PCyzNMy1+MktuOwZkyTERTAQ7MB0Ti3hI
   r9kV0PaeBRQgVeehZiCNWI2fGaydguMXOqlAk42gM81g5DbOr0P+O7mEg
   HbwjCyT5P28+jv82m0lPyWo5UD1Uk3/Hfk7huVEFNt2pEmkjRRJAWaAse
   +5yED26evdTKWzWBMMkVjmkvdO++J/icfGgrpnjb9gu0z/tEu4cLIpL5A
   g==;
IronPort-SDR: 7nYQ8Kee1zymT34XdFySmZT3P7uCRuG7zIh/58/R4C9QVqGyz2pYxTterXODr94xS9taxDVYKL
 icx6LU67b9HA==
X-IronPort-AV: E=Sophos;i="5.75,418,1589234400"; 
   d="scan'208";a="40421617"
From:   Denis Osterland-Heim <denis.osterland@diehl.com>
To:     "dmurphy@ti.com" <dmurphy@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>
CC:     "robh@kernel.org" <robh@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Denis Osterland-Heim <denis.osterland@diehl.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: [PATCH v7 3/3] leds: pwm: add reference to common leds for
 default-state
Thread-Topic: [PATCH v7 3/3] leds: pwm: add reference to common leds for
 default-state
Thread-Index: AQHWZ1rQrOuS7hWX9EqgwlpAGfo+FQ==
Date:   Fri, 31 Jul 2020 16:51:20 +0000
Message-ID: <20200731164945.19515-4-Denis.Osterland@diehl.com>
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
X-GBS-PROC: 5x5xXKsZ7k4sJw6jWwvS4uZcHK5bu42RN30SnBLCwEfgbEQQ4fPA/nPKnEGEBJ0k
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The default-state is now supported for PWM leds.

Signed-off-by: Denis Osterland-Heim <Denis.Osterland@diehl.com>
Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
Acked-by: Rob Herring <robh@kernel.org>
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
