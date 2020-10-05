Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 293C3283E53
	for <lists+linux-leds@lfdr.de>; Mon,  5 Oct 2020 20:31:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725960AbgJESbS (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 5 Oct 2020 14:31:18 -0400
Received: from w1.tutanota.de ([81.3.6.162]:35210 "EHLO w1.tutanota.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726935AbgJESbS (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 5 Oct 2020 14:31:18 -0400
Received: from w3.tutanota.de (unknown [192.168.1.164])
        by w1.tutanota.de (Postfix) with ESMTP id 9CDB6FA0400;
        Mon,  5 Oct 2020 18:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1601922676;
        s=s1; d=tutanota.com;
        h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
        bh=FyGnVACqUfIMK6u5r4pLOucerf6LwFRTJg4C0HOGYDc=;
        b=LPz0pzRVpMFFYJFbY7NhGduQgYIm4s54WWDLM+LuKF1m+dNJkNzfl0HalHEWFzqm
        g3X8R1ESBEIn6Ewyp3IS+5aUNnlIui6UARYCAHbCQm4SFNOFojv3mzXwraVojnK8Irp
        9tJ0oQXuY4X2C0Y/jJACEhxxhTboP00co9ejFbYi/8Qco6BFKaOOj05YZIZBtxwKau3
        7AshDGb/pRyV59NIPCMmfhgvyzXdo+Apc9Ral6quuty392PPRXQTcwxvX8nhYcDFmzN
        jp9/Wfh1q5vX4AhgEeBZnBI0ZtcA2MSxXI4755BZMT+ndmGsGcJLcVMBQnT0/yLisXR
        DhywylX+mA==
Date:   Mon, 5 Oct 2020 20:31:16 +0200 (CEST)
From:   ultracoolguy@tutanota.com
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Alexander Dahl <post@lespocky.de>, Dmurphy <dmurphy@ti.com>,
        Marek Behun <kabel@blackhole.sk>,
        Linux Leds <linux-leds@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
Message-ID: <MIu12FE--3-2@tutanota.com>
In-Reply-To: <MIu0jNf--3-2@tutanota.com>
References: <20201005141334.36d9441a@blackhole.sk> <MIt2NiS--3-2@tutanota.com> <3c5fce56-8604-a7d5-1017-8a075f67061e@ti.com> <MItBqjy--3-2@tutanota.com> <966c3f39-1310-dd60-6f33-0d9464ed2ff1@ti.com> <MItOR9Z--3-2@tutanota.com> <20201005164808.slrtmsvmw4pvwppm@falbala.internal.home.lespocky.de> <MItjEho--3-2@tutanota.com> <20201005173227.GA6431@duo.ucw.cz> <MIu0jNf--3-2@tutanota.com>
Subject: Re: [PATCH] leds: lm3697: Fix out-of-bound access
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Otherwise everything works great :)

(And sorry for sending two emails)


Oct 5, 2020, 18:29 by ultracoolguy@tutanota.com:

> This:=20
>
> led->num_banks =3D count;=20
>
> Has to be below devm_kzalloc. Else, it's NULL.
> Oct 5, 2020, 17:32 by pavel@ucw.cz:
>
>> Hi!
>>
>>> Agh. I added the Signed-off-by in an earlier non-published version of t=
he commit, but forgot to add it back. But that doesn't really excuses me.
>>>
>>> I attached the (hopefully) final version of this patch.=C2=A0 Pavel, I'=
ll send the struct rename separately after I submit this.=20
>>>
>>
>> Thanks, I applied it with ... some tweaks. I hope I did not break it,
>> and would not mind testing.
>>
>> Best regards,
>> Pavel
>>
>>
>> --=20
>> (english) http://www.livejournal.com/~pavelmachek
>> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/=
blog.html
>>
>
>

