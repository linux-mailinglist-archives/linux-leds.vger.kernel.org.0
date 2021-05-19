Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 950BE388DCC
	for <lists+linux-leds@lfdr.de>; Wed, 19 May 2021 14:15:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346454AbhESMQf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 May 2021 08:16:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:45636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345668AbhESMQd (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 19 May 2021 08:16:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 15D9C6109F;
        Wed, 19 May 2021 12:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621426514;
        bh=9/QjJGAOOTAcd0pA3sEBi8ap8/hZmUlOZ4wMjlevqKQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=tPUvNMSxHBiHocvutv5Hk88kt1vFcFGj1WwAKxAptKJhO01bh8kF9SPRYVHJ0M8Sh
         M4iwElpnQiMbx259scuwE62ouRl50ktUmM4ahz3qrdpKctTg0JNDF15Vo9idgaccTI
         GELZKuzEvx6KLOvcIuS/NDZGV436LBfISwmVIcVnFAO4IAZs6eEUIWEk1GYDQ/+9LA
         pcYlkUBzoLgKrGxnMGZROAfPUQtmi5Mz2tqApTcuQQ6RK99wk8Zjk0hGEsHzNMh6Kw
         Kh3nxN1n2k/t4F5lXiEhzYqYpr65eioTtpOSoYrosIagVSkGBzULpV9TjDONoscyFH
         NbSJ8tfDvPhOg==
Date:   Wed, 19 May 2021 14:15:08 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        gregkh@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 00/17] Adding support for controlling the leds found
 on Intel NUC
Message-ID: <20210519141508.6e7a4d56@coco.lan>
In-Reply-To: <20210519111107.GC24621@duo.ucw.cz>
References: <cover.1621349813.git.mchehab+huawei@kernel.org>
        <20210519111107.GC24621@duo.ucw.cz>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Em Wed, 19 May 2021 13:11:07 +0200
Pavel Machek <pavel@ucw.cz> escreveu:

> Hi!
> 
> > Some models come with single colored or dual-colored LEDs, but high end models 
> > have RGB LEDs.
> > 
> > Programming them can ether be done via BIOS or by the OS, however, BIOS settings
> > are limited. So, the vendor offers a Windows application that allows to fully use the
> > functionality provided by the firmware/hardware.  
> 
> I'm not sure why you are submitting v2 in the middle of interface
> discussion.

I'll refrain sending a new version while we're discussing the interface.

> Marek and I are saying the same thing -- this needs to use close to
> existing APIs.

Ok, but I'm not seeing an existing API that provides what those
LEDs need.

> If you want to get something merged quickly, please submit basic
> functionality only (toggling the LED on/off) that completely fits
> existing APIs. We can review that.

If you prefer working this way, I can send an initial patch with
just the very basic. Actually, if you apply just patch 2 of this
series, it will provide support for for just setting the brightness
on NUC8.

However, the main reason why someone (including myself) want this
driver is to allow to dynamically change what hardware event will
be triggering the LED and how, and if suspend will blink or not[1].

Being able to also change the LED color is a plus.

[1] Disabling blink at suspend/hibernate is one of the things that
I use here: as the machine is at my bedroom, I don't want it to be
blinking all night long when the machine is sleeping :-)

Thanks,
Mauro
