Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F17713827D0
	for <lists+linux-leds@lfdr.de>; Mon, 17 May 2021 11:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235816AbhEQJKd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 17 May 2021 05:10:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:39692 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235734AbhEQJKc (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 17 May 2021 05:10:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 41DC0611C2;
        Mon, 17 May 2021 09:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621242535;
        bh=BRGz+Os9JiMGd3fXuweYLwu0b6U6pfMRs8vms0cIF4E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YuzGYw8ynk+yr0zyDt1Tw3qHniQtoVCQChSHu55WUnSsIdQEpfp8wwSjt5/Wq1aFr
         vMcYJ1luC8jDU+WGxBKnx8CfBA14UIZgbUt2dFLF0DB9yIIJfrVkfdIDXlug7B6OJW
         Yi+sdwd2ctRqyhLWDlPuozfr3xIVCVJFF6T4na80=
Date:   Mon, 17 May 2021 11:08:53 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: Re: [PATCH 00/17] Add an experimental driver for Intel NUC leds
Message-ID: <YKIypSbaft0euIoY@kroah.com>
References: <cover.1621161037.git.mchehab+huawei@kernel.org>
 <YKIm8TNJfXIMFl+W@kroah.com>
 <20210517110258.341da12c@coco.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517110258.341da12c@coco.lan>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, May 17, 2021 at 11:02:58AM +0200, Mauro Carvalho Chehab wrote:
> Em Mon, 17 May 2021 10:18:57 +0200
> Greg KH <gregkh@linuxfoundation.org> escreveu:
> 
> > On Sun, May 16, 2021 at 12:53:28PM +0200, Mauro Carvalho Chehab wrote:
> > > Hi Greg,
> > > 
> > > This series add support for the LEDs found at Intel NUCs since
> > > NUC version 6.
> > > 
> > > On several NUC models, the function of the LEDs are programmable,
> > > which allow them to indicate several different hardware events.
> > > 
> > > They can even be programmed to represent an userspace-driven event.
> > > 
> > > Some models come with single colored or dual-colored LEDs, but
> > > high end models have RGB LEDs.
> > > 
> > > Programming them can ether be done via BIOS or by the OS.
> > > 
> > > There are 3 different API types, and there is already some OOT
> > > drivers that were written to support them, using procfs, each
> > > one using a different (and IMO confusing) API.
> > > 
> > > After looking at the existing drivers and not liking the uAPI
> > > interfaces there, I opted to write a new driver from scratch,
> > > unifying support for all different versions and using sysfs
> > > via the leds class.  
> > 
> > Just do this the "right way" and not add it to staging first.  Just use
> > the existing LED class apis and all should be fine, no need for doing
> > anything unusual here.
> 
> I'm using the standard LED class already (but not triggers), and the
> standard WMI support.
> 
> Still, this API is complex, as it controls the LED behavior even when
> the machine is suspended. I would feel more comfortable if the ABI
> is not set into a stone at the beginning.

code in drivers/staging/ does not mean that you can mess with the
userspace api at will.  It still follows the same "rules" of any other
kernel code when it comes to that.

So just work with the LED developers to come to a valid api that works
properly within that framework please.

thanks,

greg k-h
