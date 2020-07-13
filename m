Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C816B21CEF6
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2020 07:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbgGMFq3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 13 Jul 2020 01:46:29 -0400
Received: from enterprise01.smtp.diehl.com ([193.201.238.219]:43256 "EHLO
        enterprise01.smtp.diehl.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725804AbgGMFq2 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Mon, 13 Jul 2020 01:46:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=diehl.com; i=@diehl.com; q=dns/txt; s=default;
  t=1594619187; x=1626155187;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=575HEkwvnGuRpevqUYYJMxN0/FnyosKPT8D7C6Z2IB4=;
  b=HHyYCo372VU93e47WWKvcHykNP6EuSTTTCaylavKIsaLWe7WOw7sWByH
   LU9hjMniKdTv82jXVews37r6dfycIwrftxncAKdTygrJW/fyfoCh13d7m
   GPZ3kZN22JtRDaRDmU3LvUUDjQybNdGJjIjuzvZcBTIEbFTyWL9UrBSJZ
   VlDtuSczWB0SfdJXIK0q+6OY6RxPSDAzQTNu+bqhbHQJZUJ2zBE//2ddv
   Si79+e+wH1p2n2tCaJ36Pty/nqO1BWHTlX55ymeteFoXepDTlTblmhUoT
   Ol6urXRpVbjbV7bxtAJZvi738DXm++y/ydKEJpHBPBBHmdofmeJTKoBNu
   Q==;
IronPort-SDR: Riw7ZFQkJ1fIB0RG6fMld0k2GJxFi0nmfCfTM4ws2pdbirTW4O46hj1lcagwsN2z/J7J4sYwG6
 MHjtjJjB90fw==
X-IronPort-AV: E=Sophos;i="5.75,346,1589234400"; 
   d="scan'208";a="39432166"
From:   Denis Osterland-Heim <denis.osterland@diehl.com>
To:     "dmurphy@ti.com" <dmurphy@ti.com>, "pavel@ucw.cz" <pavel@ucw.cz>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: [PATCH v6 0/2] leds: pwm: add support for default-state device
Thread-Topic: [PATCH v6 0/2] leds: pwm: add support for default-state device
Thread-Index: AQHWWNjSOiDq5TcOv0aTFx6++gy85w==
Date:   Mon, 13 Jul 2020 05:45:32 +0000
Message-ID: <20200713054259.7608-1-Denis.Osterland@diehl.com>
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
X-GBS-PROC: 415AWy8o668fDtCxszluz/YUUpbtbZKv9hhwd+iOvDKuI0HiOHUkk6gbb3ZKKrmq
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

v5 -> v6: tested the rebase to v5.8-rc2 based for-next

 .../devicetree/bindings/leds/leds-pwm.txt          |  2 +
 drivers/leds/leds-pwm.c                            | 54 ++++++++++++++++=
+++---
 2 files changed, 50 insertions(+), 6 deletions(-)

Message-Id: <20200421130644.16059-1-Denis.Osterland@diehl.com>
base-commit: cf1a1a6a7d81d73bcb5568b23572d6fd593add87





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
