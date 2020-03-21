Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14C1918DEB0
	for <lists+linux-leds@lfdr.de>; Sat, 21 Mar 2020 09:16:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728251AbgCUIQH (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Mar 2020 04:16:07 -0400
Received: from enterprise01.smtp.diehl.com ([193.201.238.219]:12449 "EHLO
        enterprise01.smtp.diehl.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728040AbgCUIQG (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Sat, 21 Mar 2020 04:16:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1584778565; x=1616314565;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=mVZ5QP/lpmFxO2DJwfE+HLWsGNms8QhEeMLogJyEu38=;
  b=JkvyRRrt7hSJT5u3zR7Oj4rjscGpuEV81IpMd5JMo6p9tBc1mgfe7f/i
   XAX1M89mVKZDeIzfxttzKXSxtqsOYKm+SBjy2W8g+llU+f6KdWBMbu8ww
   9mF+SD0B9ZqsSXnUI3QSaPyqtphq+X+VnckY4Nx8y5TV8l0sGqAXWYB1I
   vr8CgqyV8GsdtBTvDG1OMJ/seXrjQmk+qaCvnHZI9udIBeeR/IxSfFo34
   acKM8OKWK1R5SaIosPmr/omolN6/C3K/rzo3sr1C2MkHHecRljr+cxXPV
   LPNmufrB1RmVVISychJ6wQFStXXIluxHK04GXcv1t9sbuBw7GFMPL747F
   g==;
IronPort-SDR: jDdQfhpJH1IIX/BqrFcUiqp7AxvH/mv5hp0tte1F4zxsJnqEtx5VgCQFgkhjntHzP/brmme/FA
 21nNn2UdtuuQ==
From:   Denis Osterland-Heim <denis.osterland@diehl.com>
To:     "dmurphy@ti.com" <dmurphy@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: [PATCH v4 0/5] leds: pwm: add support for default-state device
Thread-Topic: [PATCH v4 0/5] leds: pwm: add support for default-state device
Thread-Index: AQHV/1jws4AzTWJYWUyOwArqe1+PYA==
Date:   Sat, 21 Mar 2020 08:15:52 +0000
Message-ID: <20200321081321.15614-1-Denis.Osterland@diehl.com>
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
X-GBS-PROC: byQFdw3ukCM+zy1/poiPc1AVfwSWUkZzyg26pdxW4F61h8FEbUr8HvF9lcEqQAI6
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

v3->v4:
 - remove deprecated unused pwm_id member from led_pwm
 - remove useless pwm_period_ns member from led_pwm
 - check return value of led_pwm_set() in led_pwm_add()
 - if period is 0 after pwm_get_state(), fall back to off state
   this avoids division by zero

 .../devicetree/bindings/leds/leds-pwm.txt          |  2 +
 drivers/leds/leds-pwm.c                            | 76 ++++++++++++++++=
+++---
 include/linux/leds_pwm.h                           | 22 -------
 3 files changed, 68 insertions(+), 32 deletions(-)

Message-Id: 20200316124851.6303-1-Denis.Osterland@diehl.com





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
