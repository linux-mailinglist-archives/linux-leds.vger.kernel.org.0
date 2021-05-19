Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F37B838930D
	for <lists+linux-leds@lfdr.de>; Wed, 19 May 2021 17:55:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346919AbhESP4b (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 May 2021 11:56:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:47778 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348078AbhESP42 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 19 May 2021 11:56:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BD32E611C2;
        Wed, 19 May 2021 15:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621439709;
        bh=FNORY5DBoHv91GsAYUPkB7clBXbWQdgXxlJpMEVxCV4=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=NyzdHH9l4zf8rZGW7ygTiV/En3ujZnBA6pRQrQSKLLMnJkk6E1LCvOgT3umzTfROO
         v4LJ+YnYGH12lZLRFFwE5zCeKHZZ3A2xeTYGZ8ZUDp1tXLP4wuiNK8mfdW6k1lof0B
         8+FGvQts1qm3MR/rzoJtZhgkJBDAzm0/H/S7DzgUCbhdO6nd3eI/kyrDZDS9k2FOI1
         xLKfXyxpd5YtrF84qOYYNNRkqnK15C/KoycOUH//pNIqXehCAUJ4WvPWR5NJKSGOq2
         Qm8bYXYYmLSQh5eX67ssSweHgmKckMmBhe56ESl/IeTPvG5IflhYqx9EMbqM39gQ8b
         24SYD1SKthGyQ==
Date:   Wed, 19 May 2021 17:55:03 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Pavel Machek <pavel@ucw.cz>, gregkh@linuxfoundation.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org
Subject: Re: [PATCH v2 16/17] leds: leds-nuc: add support for changing the
 ethernet type indicator
Message-ID: <20210519175503.567e6ecc@thinkpad>
In-Reply-To: <20210519162413.4feeab02@coco.lan>
References: <cover.1621349813.git.mchehab+huawei@kernel.org>
        <792598f4a1a3219b6517057c92559b0f0a95b419.1621349814.git.mchehab+huawei@kernel.org>
        <20210519100253.49b155e9@thinkpad>
        <20210519121812.4285b3ea@coco.lan>
        <20210519141102.0161a9d9@thinkpad>
        <20210519162413.4feeab02@coco.lan>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 19 May 2021 16:24:13 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> On other words, if no extra care is taken, it could have bad side 
> effects at the machine's performance and affect system's latency,
> eventually resulting on things like audio clicks and pops, if some
> audio is playing while such calls keep happening.

In general we want for every LED that is registered into kernel as a LED
classdev to be possible to control the brightness by software. If the
hardware supports it, it should be available. There is a _blocking
.brightness_set_blocking callback for LEDs which may block when setting
brightness.
But even if we did not want to support software control, the transparent
trigger offloading is still relevant. See below.

> So, IMO, there's very little sense on trying to re-implement the
> already existing hardware-controlled events via software emulation.

We have a misunderstanding here, probably because of my bad
explanation, I will try to clarify.

> Sorry, but I guess I missed something here. Are you meaning to use
> the code under "ledtrig-netdev.c" or something else? 
> 
> The code at ledtrig-netdev.c allocates a trigger data, initializes a
> spin lock, initializes a delayed work, registers a notifier, sets a 
> trigger interval, etc. It is perfectly fine for software-controlled
> LEDs, but none of those will ever be used by the NUC driver, 
> if it only implements HW blinking for the Ethernet interfaces
> (and, as said before, there's little sense emulating it via software
> on such devices).

The idea of transparent offloading of LED triggers to HW (if HW
supports it) is to have a consistent and unified interface.

Currently we have a driver (leds-ns2 I think) which allows putting the
LED into HW controlled mode (to blink on SATA disk activity). This is
done by writing 1 into /sys/class/leds/<LED>/sata.

In your proposal you are creating several sysfs files:
  indicator
  hdd_default (notice difference from "sata" sysfs file in leds-ns2
               driver)
  ethernet_type

So the problem here is that this API is not unified. This is different
from how leds-ns2 driver does this, and both of these solutions are
wrong, because they are not extendable.

The correct way to do this is via LED triggers, i.e. if I want a LED to
blink on network activity, then I should use netdev trigger and nothing
else. The netdev trigger should determine whether the underlying LED
driver can set the LED to blink on network activity in HW. If HW
supports it, netdev trigger should use this, otherwise netdev trigger
should blink the LED in software.

Currently the netdev trigger does the blinking in software only
(code in "ledtrig-netdev.c" file). There is a WIP to add the necessary
support for the netdev trigger to have the ability to offload blinking
to HW. I will try to respin this WIP and send patches for review.

Once netdev trigger supports this feature, you can implement your
driver in this way. You can even make your driver depend on netdev
trigger and set the specific LED into netdev triggering by default, and
even forbidding anything else. But this is the corrent way to do this,
instead of creating new sysfs API that is non-extendable.

I am sorry that I did not explain this thoroughly in previous mails.
Hopefully this explanation is better.

Marek

PS: This is relevant for disk activity as well.
