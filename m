Return-Path: <linux-leds+bounces-2785-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E2497D7E9
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2024 17:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F2D41F2273A
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2024 15:55:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E835E17B500;
	Fri, 20 Sep 2024 15:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="iOLcVt5+";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="Kaa2N6cZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de [81.169.146.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E97361FCF
	for <linux-leds@vger.kernel.org>; Fri, 20 Sep 2024 15:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=81.169.146.216
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726847755; cv=pass; b=hb7F0ZAhbx3Q7Rq+2oxzwZXhCH5CeWTHPyvrY24QHuER6IMGPZC7b+7sYF1bQjdBvMbkDwv1/RPikVw/I9/cHcS+L2r6Q5mqI0INftalN8N9D2yWNbraomejRodYrIVSIHmKKe3teUmBiFoYhB9bzNLb8+fPLtnoTZA54WqB0og=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726847755; c=relaxed/simple;
	bh=Vob+MIVWRRiv/h4nl42wArNq/hZQOOhozpqeyboYJHc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=cyAb8JwYWwivkjnqXNNBS3kHNh8jX4ECBmSp78EWDCEGVidQQmZ6aU1eFIffo3YcFybobUAgH4UA+BeG+okdzhHpZ6+DGKw4tGoR3yFH2bh+JsZxDNSAi08iaaJL8FnNSXB8cUlks1Cle+0NBJOdqCK1xZZ4MFNvOiogf6R5k0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=iOLcVt5+; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=Kaa2N6cZ; arc=pass smtp.client-ip=81.169.146.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1726847560; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=tM6nlD8Gq3aECPKNRpsUtW/9+/3RT9zQS0iE/hiUK5XeokyfCrzpTsSgJeLxyU92d/
    IlrgTfSBOQ1Ta92x/xc/WeAye61L5pMMVDqcgYYDdokNW9rnOMZWylV9WR8VGUo3b5Za
    pwigafwTJea/2wa2JZ7A/XZSHrBsKdQ3zfJQ+JVwxF76zwJJ4zPuoVkoIdpVojf2I2cB
    xDlaOK2DmhMF/WPz6idqHKzMj2FexyplW2WuYe1yHI/zIBziKqtq+zO27Whjl/qiK5xS
    E0c1N9UMQ68lXZFWYtOaCAW6XH26g7CltACsLVH1M39bgTu+jDniuAAyBzYsIG4qHNEo
    q2gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1726847560;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=0nuDm9YBg3DbSjqa/Z6hYq3CINiOXSATk5rzJmC7Uq8=;
    b=LHi6dK7GbF69l4J6kJ9zlg0LXtmDHP8w9j90BZWngTSYH4q+m1trQ+wp5E4Zk7oTRn
    lEYEUoctLiUJznhcIQcfl/dLwYUegjw75Ctb/FX5WdbGjQB9EtlG6mNhECp5wrkP9JlT
    +LE4Ltzq9z5+yHHqn+yW2/zQwCOBpU2PjaTG/HqB7IZbu/wKRTx9sbTgaffYQhI4A7sV
    omV/GWq6hNGSKqc2TD+hT3KQrU32HRcFrJ4dejDwPX8097smKzj5E/QtwJJp7r3QQIyf
    7If5uawnk3eGjQUQtgi5HrcBfqZ/I3noO2iej6PtPvpQQKOtkWMys8V9uNxIJiMMGMMg
    ckag==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1726847560;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=0nuDm9YBg3DbSjqa/Z6hYq3CINiOXSATk5rzJmC7Uq8=;
    b=iOLcVt5+BF61LIMmFgXuII8qZWVs3TdyTukD+T7QNCN4QI6GaArzgRbxcXtBUzTVP0
    YfwbQpzDHi2fk3BKSoH7/dJ/arrCFVbQOagC3vyZjjBaaK5fXjTyVOX6dI01UGE79JY6
    I6axmp9gGhzbJpXgrYMBEZYhDgKi8rTb17hCRGAd1ZrqJHE9rkyNbKakwzfS+J/tEW80
    o2XwCRwYmNnMNrRQIWo0G5blqtGcwg+L/1hoy1i4cv3X8AmP6Jk6mOvdFwZzFzOobhuW
    TlwaMNPw0CVGc/n+zPiR6wvqmJqOKrd/MupNQ12RgVCcCUX3qdz15jBoas6LZ0r9103Q
    /fgg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1726847560;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=0nuDm9YBg3DbSjqa/Z6hYq3CINiOXSATk5rzJmC7Uq8=;
    b=Kaa2N6cZ2c5rnUH77KUWLmvgajyLnIW9L6LzjbpEncAsvlbPyAEfbxj3CPgfR4+w1D
    2yesYGGM7/3z+pWvUvAg==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yeDsZ"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 51.2.7 DYNA|AUTH)
    with ESMTPSA id Qd0dc208KFqeJMh
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Fri, 20 Sep 2024 17:52:40 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: leds-is31fl319x
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <BE1P281MB266384F3566241E8B6B5D048FA6C2@BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM>
Date: Fri, 20 Sep 2024 17:52:29 +0200
Cc: "andrey_utkin@fastmail.com" <andrey_utkin@fastmail.com>,
 "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B5403FA8-33A9-4554-92A0-42E471DA3629@goldelico.com>
References: <BE1P281MB266384F3566241E8B6B5D048FA6C2@BE1P281MB2663.DEUP281.PROD.OUTLOOK.COM>
To: "Weber, Thomas" <Thomas.Weber@corscience.com>
X-Mailer: Apple Mail (2.3776.700.51.11.1)

Hi,

> Am 20.09.2024 um 16:48 schrieb Weber, Thomas =
<Thomas.Weber@corscience.com>:
>=20
> Hello,
> you are listed as module authors for the leds-is31fl319x driver.

Well, it is many years ago that I contributed some code, so I don't
know if others have added or changed features in the meantime.

>=20
> Should the color property and the pattern property be functional in =
this module?

What do you expect to be "functional"?

>=20
> I added this to my device tree
>=20
> is31fl@64 {
>    compatible =3D "issi,is31fl3199";
>    reg =3D <0x64>;
>    #address-cells =3D <1>;
>    #size-cells =3D <0>;
>    pinctrl-names =3D "default";
>    pinctrl-0 =3D <&pinctrl_is31_sdb>;
>    shutdown-gpios =3D <&gpio5 6 GPIO_ACTIVE_HIGH>;
>=20
>    led@1 {
>      reg =3D <1>;
>      label =3D "IND_LED_WH_1";
>      color =3D <LED_COLOR_ID_WHITE>;
>      linux,default-trigger =3D "pattern";
>      led-pattern =3D <0 1000 255 2000>;
>    };
>=20
>    led@2 {
>      reg =3D <2>;
>      label =3D "IND_LED_BU_1";
>      color =3D <LED_COLOR_ID_BLUE>;
>    };
>=20
> But in the rootfs I get this:
>=20
> root@vsm:/sys/class/leds/IND_LED_BU_1 cat color
> white

Hm. This is not a feature of the driver but the leds core so
I don't know what happens here.

>=20
> root@vsm:/sys/class/leds/IND_LED_WH_1 cat trigger
> [none] timer heartbeat cpu cpu0 cpu1 cpu2 cpu3 default-on panic mmc2 =
sbs-2-000b-charging-or-full sbs-2-000b-charging sbs-2-000b-full =
sbs-2-000b-charging-blink-full-solid rfkill-any rfkill-none =
bluetooth-power

It seems as if led-patterns are not handled or limited by a
driver but implemented in ledtrig-pattern.c which sets up a
timer to cycle through the patterns.

So both features are general features of the led subsystem
and not of the driver.

These features may not be included (e.g. CONFIG_LEDS_TRIGGER_PATTERN)
or available in your Linux version.

Hope this helps. BR,
Nikolaus


