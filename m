Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6AFD3E4CB3
	for <lists+linux-leds@lfdr.de>; Mon,  9 Aug 2021 21:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235742AbhHITHt (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 9 Aug 2021 15:07:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:41904 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235246AbhHITHt (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 9 Aug 2021 15:07:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E5EC361040;
        Mon,  9 Aug 2021 19:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628536048;
        bh=dQLZBpWmjY9hF80ib8i/Bo1GvGxr7yInqT/ZPREo94U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gJGBxEID1am/fcjOi5RGO5uFDE15kZBlWJ5shTR3yNpJIinQU/t7TshNpc/56g7q8
         7AWpkG8R4MMyNz3PtrMfzlclrD0PHuOVv6pXdztpk33xYPBfCUDbV8MYNMxLfeU3ov
         SOTq0is9yl9aAOb3+xq6m4lR4W1LVc9QDUPBmTJ6rT6GW+126+KDCuNvxnJlHK7g4c
         rRJKN2WR8wb3xbOMMkGn3+NkWmWStHzigAriRJXTFq6YczUcOIGPMNWapF9ftRsR8+
         Syvkzs98bFThjc7oqef5wpKh9pLLZLsAGexKHn6QG/QFgMy3cpehsU3yayKgUYX/TA
         7THDrUkH7Zrtw==
Received: by pali.im (Postfix)
        id 5C6C8C7C; Mon,  9 Aug 2021 21:07:25 +0200 (CEST)
Date:   Mon, 9 Aug 2021 21:07:25 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Cc:     Ian Pilcher <arequipeno@gmail.com>, linux-block@vger.kernel.org,
        linux-leds@vger.kernel.org, axboe@kernel.dk, pavel@ucw.cz,
        linux-kernel@vger.kernel.org, kernelnewbies@kernelnewbies.org
Subject: Re: [RFC PATCH v2 00/10] Add configurable block device LED triggers
Message-ID: <20210809190725.6jq2npa5kmruf6n7@pali>
References: <20210809033217.1113444-1-arequipeno@gmail.com>
 <20210809205633.4300bbea@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210809205633.4300bbea@thinkpad>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Monday 09 August 2021 20:56:33 Marek Behún wrote:
> Hello Ian,
> 
> thank you for your proposal. Some comments below:
> 
> On Sun,  8 Aug 2021 22:32:07 -0500
> Ian Pilcher <arequipeno@gmail.com> wrote:
> 
> > One thing that has not changed is that associations between block
> > devices and LEDs are still set via an attribute on the device, rather
> > than the LED.  This is much simpler, as the device attribute only has
> > to handle a single value (the name of the associated LED), rather than
> > potentially handling multiple device names.
> 
> It may be simpler, but it is in contrast to how the netdev trigger
> works, which already is in upstream for many years. I really think we
> should try to have similar sysfs ABIs here. (I understand that the
> netdev trigger is currently unable to handle multiple network
> interfaces - but it is possible to extend it so.)
> 
> > I have modeled the interface for the /sys/block/<DEVICE>/led
> > attribute on the sysfs interface used for selecting a trigger.  All
> > available LEDs (all LEDs associated with the blkdev trigger) are
> > shown when the attribute is read, with the currently selected LED
> > enclosed in square brackets ([]).
> 
> I think it is reasonable to be able to set something like this:
>   led0 : blink on activity on any of [sda, sdb, sdc]
>   led1 : blink on activity on sda
>   led2 : blink on activity on sdb
>   led3 : blink on activity on sdc
> 
> If I am reading your code correctly, it looks that only one LED can be
> configured for a block device. Is this true? If so, then the above
> configuration cannot be set.
> 
> Also you are blinking the LED on any request to the block device. I
> would rather expect to be able to set the LED to blink on read and on
> write. (And possibly on other functions, like discard, or critical
> temperature, or error, ...) I would like to know what other people
> think about this.

Hello!

HP EliteBook laptops had dedicated LED for some kind of error and
encryption indication. And there is kernel acpi/wmi driver which can
control this LED. I do not know if recent HP laptops still have these
LEDs, but I would suggest to design API in a way that would allow to use
these dedicated LEDs for their original "vendor" purpose.

I'm mentioning it just because this functionality and design is already
on existing production mainstream laptops, and not something imaginary.

If Linux distributions are still cooperating with laptop vendors and
doing "official" Linux preloads then they may be interested in having
"native" LED functionality support in kernel.
