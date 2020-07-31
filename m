Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D84992349A8
	for <lists+linux-leds@lfdr.de>; Fri, 31 Jul 2020 18:51:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732856AbgGaQv0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 31 Jul 2020 12:51:26 -0400
Received: from enterprise01.smtp.diehl.com ([193.201.238.219]:47081 "EHLO
        enterprise01.smtp.diehl.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731565AbgGaQvZ (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 31 Jul 2020 12:51:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1596214284; x=1627750284;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=/M/VdMoglksq9/Q9o63RpLEQxjFrpzvCcVVWvvdiT0s=;
  b=DApR5PXf7fHTGqxd/W7+lFcAVlVzatqen2+8cFmqhlJhk2rkUNwpkzzB
   ZjqJpTLNHYd7rP8PNV06a1+75cAkFqVYczWaUZjjEmRIvLUj8H427t/q0
   Cl3IQgZR0j7XZUfiYA6vabr/mHvj692/51B0X374YYame3eLSQNhGyyGH
   g5rnmG5c+Py14Wz8O5vMQmBgqUzyumbjV9KEW5Jst2BUDbXMm1O5tpzTv
   m9QXuhB5BZ6gn5U+wreKV1tLJnONLMCU0aq2RSKffLsRRQMNDKrrleSnq
   uMsTZ60V07rhuZXMJhrkmNkB+j8dEvF9bgc5/42cLvPQ7aNKsusqrXIOH
   g==;
IronPort-SDR: QTgIEfBu4Isb59dke7qGPt/ac+sqEBDBSCkEbBUbfWcCJg87vDUyXz+TAuZ51OD7zmDxqXBgkw
 QOULMALdFQoQ==
X-IronPort-AV: E=Sophos;i="5.75,418,1589234400"; 
   d="scan'208";a="40421618"
From:   Denis Osterland-Heim <denis.osterland@diehl.com>
To:     "dmurphy@ti.com" <dmurphy@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: [PATCH v7 0/3] leds: pwm: add support for default-state device
Thread-Topic: [PATCH v7 0/3] leds: pwm: add support for default-state device
Thread-Index: AQHWZ1rRFxbKa90VkEqpICDUHdmLhQ==
Date:   Fri, 31 Jul 2020 16:51:20 +0000
Message-ID: <20200731164945.19515-1-Denis.Osterland@diehl.com>
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
X-GBS-PROC: PkB65aL1SqtESF35r/jQnxtgDjFz6f85lRVDwolbbm+V/0xjLOfaQZtnGblCB/P9
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

v6 -> v7: apply comments from Jacek
           refactore default state read to separate function
           and use it in leds-gpio and leds-pwm

@Pavel I hope that it is okay to keep your acked-by on 2/3,
       the logic is the same but with switch, in favour of if

 .../devicetree/bindings/leds/leds-pwm.txt          |  2 +
 drivers/leds/led-core.c                            | 15 +++++++
 drivers/leds/leds-gpio.c                           | 12 +-----
 drivers/leds/leds-pwm.c                            | 49 ++++++++++++++++=
+++---
 drivers/leds/leds.h                                |  1 +
 include/linux/leds.h                               | 12 ++++--
 6 files changed, 72 insertions(+), 19 deletions(-)

Message-Id: <20200713054259.7608-1-Denis.Osterland@diehl.com>
base-commit: 2742b4192a279c6ec72e55d5474c4c07756c7845




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
