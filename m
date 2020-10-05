Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8E9C283EFC
	for <lists+linux-leds@lfdr.de>; Mon,  5 Oct 2020 20:49:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728361AbgJESsv (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 5 Oct 2020 14:48:51 -0400
Received: from w1.tutanota.de ([81.3.6.162]:39172 "EHLO w1.tutanota.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729183AbgJESsv (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 5 Oct 2020 14:48:51 -0400
Received: from w3.tutanota.de (unknown [192.168.1.164])
        by w1.tutanota.de (Postfix) with ESMTP id 639C4FBF3B0;
        Mon,  5 Oct 2020 18:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1601923729;
        s=s1; d=tutanota.com;
        h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:References:Sender;
        bh=q+ooZJA3U3If6P/okJeFSC6C8LiTNGbu02t0TyCexVI=;
        b=tz9czwny3V/Ye3AOvx387UmTm8Fo8e7KNATRn9WVSaZ1Gaby1xCi2xK0E2Jdf+QI
        3cHs2baMje9bX0wn1z3GmIvoUey19Qzb6vDCRQiSA0Tte9KoRIi19LSYznuhobHV9FT
        dniWEz5eimPWRW1CxtkP4jfaesq0giErTrxduBCwGuPhz9kuePZugtpZwRxe18D/CPf
        T+7uET6UygUfOT3Ns/OA3YGacgqLIf+ii3529kTk3qfGhhsA56PuL2b4F//1qYRuhe5
        o/Sl9J3rBkTXlL5IaQTac0HASAGSeiCDo0foJGIr4JVt/gOU8xXvQB8U9qD8Ph5VW2g
        h6L/0WEoZQ==
Date:   Mon, 5 Oct 2020 20:48:49 +0200 (CEST)
From:   ultracoolguy@tutanota.com
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Alexander Dahl <post@lespocky.de>, Dmurphy <dmurphy@ti.com>,
        Marek Behun <kabel@blackhole.sk>,
        Linux Leds <linux-leds@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
Message-ID: <MIu53JH--3-2@tutanota.com>
In-Reply-To: <20201005183943.GA12622@duo.ucw.cz>
References: <3c5fce56-8604-a7d5-1017-8a075f67061e@ti.com> <MItBqjy--3-2@tutanota.com> <966c3f39-1310-dd60-6f33-0d9464ed2ff1@ti.com> <MItOR9Z--3-2@tutanota.com> <20201005164808.slrtmsvmw4pvwppm@falbala.internal.home.lespocky.de> <MItjEho--3-2@tutanota.com> <20201005173227.GA6431@duo.ucw.cz> <MIu0jNf--3-2@tutanota.com> <MIu12FE--3-2@tutanota.com> <20201005183943.GA12622@duo.ucw.cz>
Subject: Re: [PATCH] leds: lm3697: Fix out-of-bound access
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

>No problem, sorry for breaking your patch. I moved it near other
initializers.

No problem :)

>Question: is it likely that someone will want to use your device with
-stable kernels? Should I mark this for -stable?

To be honest, it's unlikely that someone other than me is interested in my device on -stable. However, if you feel like the patch is simple enough to not cause any problem, then feel free to do so. 

Oct 5, 2020, 18:39 by pavel@ucw.cz:

> On Mon 2020-10-05 20:31:16, ultracoolguy@tutanota.com wrote:
>
>> Otherwise everything works great :)
>>
>> (And sorry for sending two emails)
>>
>
> No problem, sorry for breaking your patch. I moved it near other
> initializers.
>
> Question: is it likely that someone will want to use your device with
> -stable kernels? Should I mark this for -stable?
>
> Thanks and best regards,
>
>  Pavel
> -- 
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
>

