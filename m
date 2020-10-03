Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E9882824D8
	for <lists+linux-leds@lfdr.de>; Sat,  3 Oct 2020 16:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725794AbgJCOnT (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 3 Oct 2020 10:43:19 -0400
Received: from w1.tutanota.de ([81.3.6.162]:48906 "EHLO w1.tutanota.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725787AbgJCOnT (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 3 Oct 2020 10:43:19 -0400
Received: from w3.tutanota.de (unknown [192.168.1.164])
        by w1.tutanota.de (Postfix) with ESMTP id D88B5FA0440;
        Sat,  3 Oct 2020 14:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1601736195;
        s=s1; d=tutanota.com;
        h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
        bh=6WyTEoXuKf0olD8hSeaW5OFlnE+TW4/q7RwsOuaz+qM=;
        b=PjFzWMpMp5M0G7gbXo5sOdoVQjUs+xRoIYbSzwk5Wd+YQUjxn0bIZoQVC2+xnj7p
        sWyKKt62/C8gImT+F1M8xDpxP6Sg2T5yw1DAG8Q4Pc+XtssXDoiPnOTKs2i3NuSKgHF
        8bA4t4bAAtku44tUtfBPrtL3dkd9r253trBNbgwihVOuAhXxT6bzcDosD4KUHJlmDvv
        fUCMm+ujy+AjWA5hMfiy4oS8yNC4oFsBiR1ZFahUr/wWcrqY2fkLM+tbUXGXUpGLn/G
        vlloBJsFMehe2eIch7ve8JHPpPXTrfIjecxpFg5j8fi9CN5aw/3EjBLv1GneQhd7Noz
        8/P07FuSag==
Date:   Sat, 3 Oct 2020 16:43:15 +0200 (CEST)
From:   ultracoolguy@tutanota.com
To:     Pavel Machek <pavel@ucw.cz>
Cc:     marek.behun@nic.cz, Dmurphy <dmurphy@ti.com>,
        Linux Leds <linux-leds@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
Message-ID: <MIiufXs--3-2@tutanota.com>
In-Reply-To: <20201003135600.GA25460@duo.ucw.cz>
References: <MIiYgay--3-2@tutanota.com> <20201003135600.GA25460@duo.ucw.cz>
Subject: Re: [PATCH] leds: lm3697: Fix out-of-bound access
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


>I'll need your real name to apply a patch.

My real name is Gabriel David.

>Ok, so I assume this is only problem with certain device trees, and
not a problem with dts' in mainline?

Yes.=20
Here's the current node I'm using that causes this bug:

&i2c_5 {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 status =3D "ok";

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti_lm3697@36 {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible =
=3D "ti,lm3697";
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-ce=
lls =3D <1>;
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells=
 =3D <0>;
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <0x=
36>;

=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 led@1 {
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reg =3D <1>;
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 led-sources =3D <0 1 2>;
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti,brightness-resolution =3D <2047>;
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 label =3D "white:backlight";
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };
};

>This is not trivial patch, no need to cc trivial tree. OTOH Ccing
Marek who did a lot of cleanups in -next might be useful. Doing that
now.

Sorry for that. Gonna CC Marek from now on.

Btw thanks for the quick response!

Oct 3, 2020, 13:56 by pavel@ucw.cz:

> Hi!
>
>> Signed-off-by: Ultracoolguy <ultracoolguy@tutanota.com>
>>
>
> I'll need your real name to apply a patch.
>
>> Hi, all. This is a patch fixing an out-of-bounds error due to lm3697_ini=
t expecting the device tree to use both control banks.=C2=A0 This fixes it =
by adding a new variable that will hold the number of used banks.
>>
>> Panic caused by this bug:
>>
>> <7>[=C2=A0=C2=A0=C2=A0 3.059893] CPU: 3 PID: 1 Comm: swapper/0 Tainted: =
G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 5.9.0-rc7-postmarketos-qcom-msm8953 #71
>>
>
> Ok, so I assume this is only problem with certain device trees, and
> not a problem with dts' in mainline?
>
> This is not trivial patch, no need to cc trivial tree. OTOH Ccing
> Marek who did a lot of cleanups in -next might be useful. Doing that
> now.
>
> Best regards,
>
>  Pavel
> --=20
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/b=
log.html
>

