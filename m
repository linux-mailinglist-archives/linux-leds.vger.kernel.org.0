Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96CE7283E4B
	for <lists+linux-leds@lfdr.de>; Mon,  5 Oct 2020 20:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727274AbgJES35 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 5 Oct 2020 14:29:57 -0400
Received: from w1.tutanota.de ([81.3.6.162]:34914 "EHLO w1.tutanota.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725960AbgJES35 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 5 Oct 2020 14:29:57 -0400
Received: from w3.tutanota.de (unknown [192.168.1.164])
        by w1.tutanota.de (Postfix) with ESMTP id 13115FA03C9;
        Mon,  5 Oct 2020 18:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1601922595;
        s=s1; d=tutanota.com;
        h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
        bh=e3nRvAMrfUuqH8v5Lf03fytftHDw5teOnq4PUPpYSoM=;
        b=1NYLTZ1/q+7L2Sv4uQhdoBxrztBFE4UEk2LTAUjQ9uqzpYI5792jG0ZQ4Q2sSmAX
        af8SnQJq8H7FLallPiJX2KZfpy710Crklgr6w36XVZV+9kP5sp/KDmP46MLrCPCX478
        5s8TyauJ4igtngYQshmej1aWLVGP5e+Y6rj3mPviriezN9X/Cchn3TBUW7JMIJA02Nu
        DOxW9R18awI60CMkvNix+GTgLq18i87K4Z8LH5NRY5HIRf+b/NbaSsolqxHMR3vqbVk
        TJOo3zkjmohd7Fu13cjXsJFSRTbVreBZbTBye8wPboi86OFMSduyV5FNkSewqAkU/1h
        q9TI9nbxOA==
Date:   Mon, 5 Oct 2020 20:29:55 +0200 (CEST)
From:   ultracoolguy@tutanota.com
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Dmurphy <dmurphy@ti.com>, Alexander Dahl <post@lespocky.de>,
        Marek Behun <kabel@blackhole.sk>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Linux Leds <linux-leds@vger.kernel.org>
Message-ID: <MIu0jNf--3-2@tutanota.com>
In-Reply-To: <20201005173227.GA6431@duo.ucw.cz>
References: <MIiYgay--3-2@tutanota.com> <20201005141334.36d9441a@blackhole.sk> <MIt2NiS--3-2@tutanota.com> <3c5fce56-8604-a7d5-1017-8a075f67061e@ti.com> <MItBqjy--3-2@tutanota.com> <966c3f39-1310-dd60-6f33-0d9464ed2ff1@ti.com> <MItOR9Z--3-2@tutanota.com> <20201005164808.slrtmsvmw4pvwppm@falbala.internal.home.lespocky.de> <MItjEho--3-2@tutanota.com> <20201005173227.GA6431@duo.ucw.cz>
Subject: Re: [PATCH] leds: lm3697: Fix out-of-bound access
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This:=20

led->num_banks =3D count;=20

Has to be below devm_kzalloc. Else, it's NULL.
Oct 5, 2020, 17:32 by pavel@ucw.cz:

> Hi!
>
>> Agh. I added the Signed-off-by in an earlier non-published version of th=
e commit, but forgot to add it back. But that doesn't really excuses me.
>>
>> I attached the (hopefully) final version of this patch.=C2=A0 Pavel, I'l=
l send the struct rename separately after I submit this.=20
>>
>
> Thanks, I applied it with ... some tweaks. I hope I did not break it,
> and would not mind testing.
>
> Best regards,
>  Pavel
> =20
>
> --=20
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/b=
log.html
>

