Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2F4D3384C7
	for <lists+linux-leds@lfdr.de>; Fri, 12 Mar 2021 05:49:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231816AbhCLEs5 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 11 Mar 2021 23:48:57 -0500
Received: from smtp2.axis.com ([195.60.68.18]:6934 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231912AbhCLEsy (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 11 Mar 2021 23:48:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1615524534;
  x=1647060534;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rF0+CeiqNT/JL8EaOzph1Uz1foa3kNRnCcYH1amvbB8=;
  b=JAmXyeQQk1/4h0tHzAMP4b53IcIudRNHw5VZTiDPEeBGlC69YOtOzgdf
   9ZEMQsYtkIra6XlKCRS8OTSZ9ySKWs/UpiXPjRzVyXiOi1fcQGA+9QtVQ
   3LlleO4Avzcs6USpWniEv4xQiFQAILgdlxSb1u9lgpdMSgkuiaAIXY2PN
   utSuoa6Kr0cf5M4XVo/iVoreEbbyJDbCfsINYKP3p2GjPgSAvdxrqcFsC
   JhpyMn9kN49Dl+IVKBL/+w4FzfDiT4WzntkwSYBoE0TDPQDWj1rOBofLE
   dPGUusZr5KUO7FNe9A2hXju0Is1UcRg6OsCkyBCS7OkplJnW7+fI5ie7g
   g==;
From:   Hermes Zhang <Hermes.Zhang@axis.com>
To:     Marek Behun <marek.behun@nic.cz>
CC:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        kernel <kernel@axis.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: RE: [PATCH] leds: leds-dual-gpio: Add dual GPIO LEDs driver
Thread-Topic: [PATCH] leds: leds-dual-gpio: Add dual GPIO LEDs driver
Thread-Index: AQHXFnc53ECqmB4gek68ETSLZV586Kp+22cAgAAAc4CAANwtQA==
Date:   Fri, 12 Mar 2021 04:48:52 +0000
Message-ID: <161920e0746e4c0daff7f83163b71677@XBOX03.axis.com>
References: <20210311130408.10820-1-chenhui.zhang@axis.com>
        <20210311163814.74c1885f@nic.cz> <20210311163951.0046fb5c@nic.cz>
In-Reply-To: <20210311163951.0046fb5c@nic.cz>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

>=20
> Sorry, leds-regulator has only a binary state LED.
>=20
> Maybe you could extend leds-regulator to be able to use all regulator sta=
tes?
>=20
> Or you can extend leds-gpio driver to support N states via log N gpios,
> instead of adding new driver.

It seems a good idea to extend leds-gpio, so in my case, I should have such=
 dts:

 63         leds {
 64                 compatible =3D "gpio-leds";
 65=20
 66                 recording_front {
 67                         label =3D "recording_front:red";
 68                         gpios =3D <&gpio 130 GPIO_ACTIVE_HIGH>, <&gpio =
129 GPIO_ACTIVE_HIGH>;
 69                         default-state =3D "off";
 70                 };
 71         };

For my case, two leds is enough, but it sill easy to extend the support num=
ber bigger than two. And the length of gpios array is not fixed, so it coul=
d compatible with exist "gpio-leds" dts, right?=20

If this idea work, should I create a new commit or still in this track (V2)=
?

Best Regards,
Hermes=20

>=20
> Marek
