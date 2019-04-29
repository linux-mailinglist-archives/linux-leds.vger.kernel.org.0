Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2346EA96
	for <lists+linux-leds@lfdr.de>; Mon, 29 Apr 2019 21:02:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729015AbfD2TCY (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Apr 2019 15:02:24 -0400
Received: from mail.nic.cz ([217.31.204.67]:49418 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726725AbfD2TCX (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 29 Apr 2019 15:02:23 -0400
Received: from localhost (unknown [172.20.6.125])
        by mail.nic.cz (Postfix) with ESMTPS id BD1006362B;
        Mon, 29 Apr 2019 21:02:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1556564541; bh=fplkcg5APpopU88tbHaqV1JakGpbhFa508n7lAyI+DE=;
        h=Date:From:To;
        b=POn4fho1mCx22bK9klQdhgRoCx/mnwlgrjM+5Ezh+cprgMH8Fy3Mv4LMxzlk0S6lT
         HE5sazz4Ym/F9cwdnikTdHqw3eZcVP8I7m3IEcPcQxv4W+wrzSYFMR7AWdQrCd1JII
         ELYbSWj+0ahArbC97b7J9iSUr9HBX4BeVHG0+1GY=
Date:   Mon, 29 Apr 2019 21:02:21 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc:     Pavel Machek <pavel@ucw.cz>, Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-leds@vger.kernel.org
Subject: Re: linux-next: Tree for Apr 29 (drivers/leds/leds-turris-omnia)
Message-ID: <20190429210221.6e6c207e@nic.cz>
In-Reply-To: <ccf6596b-e645-a9b3-dfab-96ff14e8b70d@metux.net>
References: <20190429190354.0d5e2e93@canb.auug.org.au>
        <d3822785-0683-28df-ffa6-ab679aa27c73@infradead.org>
        <20190429153200.GA11761@amd>
        <20190429173842.06f02852@nic.cz>
        <20190429163753.GA16782@amd>
        <20190429184439.68049050@nic.cz>
        <20190429165319.GB16782@amd>
        <c045db7f-2147-1a58-8d65-8b52fddd932c@metux.net>
        <20190429181245.GA24658@amd>
        <ccf6596b-e645-a9b3-dfab-96ff14e8b70d@metux.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.99.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 29 Apr 2019 20:49:59 +0200
"Enrico Weigelt, metux IT consult" <lkml@metux.net> wrote:

> On 29.04.19 20:12, Pavel Machek wrote:
> 
> >> Is that controller only built-in into some SoCs, or also available
> >> as a separate chip ?  
> > 
> > AFAIU.. separate chip, but runs firmware not likely to be available
> > outside Turris routers.  
> 
> hmm, if it's a separate chip, IMHO it should be selectable, so that
> anybody who puts that chip on his board can directly use it.
> 
> --mtx
> 

The chip is a cortex-m3 or something like that. What makes the LEDs
work in this specific way this driver uses is the firmware on the chip,
and that firmware is specific for Omnia.

It is possible that in the future someone makes a I2C controller
compatible with the API the Omnia firmware provides, but very unlikely.

I think it is reasonable to make the driver depend on MACH_ARMADA_38X
and in the unlikely scenario that someone makes a compatible
controller, the dependency can always be removed.

Marek
situation it is possible to 
