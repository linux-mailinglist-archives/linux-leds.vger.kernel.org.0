Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F720186B82
	for <lists+linux-leds@lfdr.de>; Mon, 16 Mar 2020 13:54:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731102AbgCPMyG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 Mar 2020 08:54:06 -0400
Received: from enterprise02.smtp.diehl.com ([193.201.238.220]:39081 "EHLO
        enterprise02.smtp.diehl.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730878AbgCPMyG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 16 Mar 2020 08:54:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1584363245; x=1615899245;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=J/iGnR7YmZY9KTs8LrY/4ZVX7F3aL4si4N4VK/NPNYk=;
  b=BhYE/0MMy7vb9217mvfVnTKKGaVHZCwZUmDovz/A2jFUNrxEiiVraZUJ
   A6ibdCAZSBXIBLiBG50uf42+8i3zqdPEAifvI5Hpfwx13k3abXDHfHOcs
   5KRTeb/tKwFqQpKjOSy/TD3n+E6bm4j2kshsJiqdT3zdfFPsLTMI0+Uu1
   eRUmoCswKGCNso9HYnpLLwcYdYKWcGBvtY8snc944zib4oT8UGWgfTyRy
   /NOL8uXIkTr/vYjWmxTs0pvw7ENQ6nAhCnzo5AQxATK8j1Cy1FU3pnBmq
   k+st57YtOv9R+z+5Fb8wUWPCu+oUrROmlaVYzLIpNI8Wz8NlNwUuxlcxi
   w==;
IronPort-SDR: /ffvDTvBI0g2FnUoyrmfvRA988PHKIEOsmKEKGKDrOt6PCcK5nUr8/hsgcS6FS0CvZqVs20ks1
 dIoehy3CFc4g==
From:   Denis Osterland-Heim <denis.osterland@diehl.com>
To:     "dmurphy@ti.com" <dmurphy@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: [PATCH v3 0/3] leds: pwm: add support for default-state device
Thread-Topic: [PATCH v3 0/3] leds: pwm: add support for default-state device
Thread-Index: AQHV+5H28xMtkJy33E69SJJPDStMgQ==
Date:   Mon, 16 Mar 2020 12:54:00 +0000
Message-ID: <20200316124851.6303-1-Denis.Osterland@diehl.com>
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
X-GBS-PROC: PkB65aL1SqtESF35r/jQn8w7kzMrMJ/nFfGPiwdQWaH+CQj/jWPKj2h1ZtogVvvP
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

v2->v3:
 - s/set/sets/
 - remove leds_pwm.h
 - rebase on atomic PWM API
 - separate patch for devicetree changes
 - PWM default state defines instead of GPIO reuse
 - apply elegant if, else if schema

 .../devicetree/bindings/leds/leds-pwm.txt          |  2 +
 drivers/leds/leds-pwm.c                            | 49 ++++++++++++++++=
++++--
 include/linux/leds_pwm.h                           | 22 ----------
 3 files changed, 48 insertions(+), 25 deletions(-)

Message-Id: 20200310123126.4709-1-Denis.Osterland@diehl.com




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
