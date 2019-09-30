Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59231C2835
	for <lists+linux-leds@lfdr.de>; Mon, 30 Sep 2019 23:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732567AbfI3VGU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 30 Sep 2019 17:06:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:44074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731010AbfI3VFy (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 30 Sep 2019 17:05:54 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6D627215EA;
        Mon, 30 Sep 2019 17:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569864465;
        bh=TZtp8z/iTZ3ALd9DyToR8MmBnn5V7UEHCdO6Tp9gOrY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cACX88i5rWYAkn/QArZJUsxzmXx+R/sxIaF6POWModAa8oJ057592SKgtO2zbDoXm
         fOBtMji2n2UUmHW8G3mNPunZ8nSjrNaPC2Zxrk2Ys4HpArShmU61dSdo4MbuR/4WFZ
         UsG5F+hmjtxHdjxGiF/e9qVl56qC6B57V/Eg0JZ8=
Date:   Mon, 30 Sep 2019 19:27:43 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Pavel Machek <pavel@denx.de>,
        Guru Das Srinagesh <gurus@codeaurora.org>
Cc:     linux-leds@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-kernel@vger.kernel.org,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: Re: [PATCH 1/2] leds: Add flag to keep trigger always
Message-ID: <20190930172743.GA2409822@kroah.com>
References: <1565398367-11811-1-git-send-email-gurus@codeaurora.org>
 <20190810071322.GA13760@amd>
 <20190930133902.GA2249614@kroah.com>
 <20190930172239.GA26107@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190930172239.GA26107@amd>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Sep 30, 2019 at 07:22:39PM +0200, Pavel Machek wrote:
> On Mon 2019-09-30 15:39:02, Greg KH wrote:
> > On Sat, Aug 10, 2019 at 09:13:22AM +0200, Pavel Machek wrote:
> > > On Fri 2019-08-09 17:52:46, Guru Das Srinagesh wrote:
> > > > From: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
> > > > 
> > > > Commit 0013b23d66a2768f5babbb0ea9f03ab067a990d8 ("leds: disable triggers
> > > > on brightness set") removes the trigger on an LED class device when
> > > > brightness is set to 0. However, there are some LED class devices which
> > > > need the trigger not to be removed. In a use case like camera flash,
> > > > camera flash driver passes in a trigger device to LED class driver. If
> > > > the trigger is removed when the brightness is set to 0, this will affect
> > > > the clients using those triggers. Hence add a flag to always keep the
> > > > trigger even when brightness is set to 0.
> > > 
> > > No.
> > > 
> > > Yes, it would affect those clients. Don't do it, then. It is
> > > root-only operation.
> > 
> > I don't understand.  The original commit broke userspace operations.
> > Shouldn't it be reverted, or fixed this way in order to have userspace
> > work properly again?
> 
> So, what it is exactly that is not working? :-). Yes, root can
> disconnect LED from v4l2 interface; he can also connect it
> back. Documentation says that happens.
> 
> Yes, root can do stupid things.
> 
> Commit 0013b23d66a2768f5babbb0ea9f03ab067a990d8 is from 2008. I'd
> prefer we did not apply it in 2008, but...

Ah, my fault, I thought this was a new commit.

Guru, what are you doing here that this is required all of a sudden?  No
other kernel seems to need these changes, what is different in your
Android userspace that requires this patch series?

thanks,

greg k-h
