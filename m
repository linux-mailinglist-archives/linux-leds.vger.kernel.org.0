Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44C441B2732
	for <lists+linux-leds@lfdr.de>; Tue, 21 Apr 2020 15:10:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728943AbgDUNJo (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 21 Apr 2020 09:09:44 -0400
Received: from enterprise02.smtp.diehl.com ([193.201.238.220]:16642 "EHLO
        enterprise02.smtp.diehl.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728824AbgDUNJo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 21 Apr 2020 09:09:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1587474583; x=1619010583;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=fXo4AG5qIH9v2xeOGaiFc3LKkrUI5Iwn9hZSaSZiSW8=;
  b=d6xViBeWjhdkuS+3+z+wd+xUvIXvHil3fdiTZeMmyiV6YW7MJlG7O3P9
   CbJ69gfzntfrwoUVFLadAKNsfvoR/hgY5fNCVY32TR8ecEsGlK/fIqrNY
   ZHhMURDbRRJR5tKlHLaxWPrHbuQLvNj52EcsGLptPaY1wJWf5uvc+Y/uv
   SkeZMXGErjfTDYPqztf/jVFRCY0RGeJPG1OBetaSw4en499AwUBZAGysS
   2mR9ZpYsJbxiqV+BxWa72GBo5W/pJN0NwMLWgIV+mlrLmKUH6Z9Jrfrxq
   N/9fYi9d+BUaLCX9X1uZVB8AIoHFKR/gNkHGb5J9RZ5dYL4T1U4gLswuN
   g==;
IronPort-SDR: 9eViOSkg53Ws3jxS76Ir9AqjFk67S6bRMW2tXy2H9mFV/XIaX/d6SlHDt6+bZm+bnPN+sPYnhn
 9kwT71ngirRg==
From:   Denis Osterland-Heim <denis.osterland@diehl.com>
To:     "dmurphy@ti.com" <dmurphy@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>
CC:     "robh@kernel.org" <robh@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Denis Osterland-Heim <denis.osterland@diehl.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: [PATCH v5 3/3] leds: pwm: add reference to common leds for
 default-state
Thread-Topic: [PATCH v5 3/3] leds: pwm: add reference to common leds for
 default-state
Thread-Index: AQHWF94OArUwGDDi3ECluLAI5zwdGw==
Date:   Tue, 21 Apr 2020 13:09:15 +0000
Message-ID: <20200421130644.16059-4-Denis.Osterland@diehl.com>
References: <20200421130644.16059-1-Denis.Osterland@diehl.com>
In-Reply-To: <20200421130644.16059-1-Denis.Osterland@diehl.com>
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
X-GBS-PROC: byQFdw3ukCM+zy1/poiPc5jn58Xuz5PjrByvaI+9WpkPjMBQsr17Xs55nywVHSVC
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
2.26.2



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
