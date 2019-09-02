Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA47A5C21
	for <lists+linux-leds@lfdr.de>; Mon,  2 Sep 2019 20:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726851AbfIBSML (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 2 Sep 2019 14:12:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:44246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726448AbfIBSML (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 2 Sep 2019 14:12:11 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B999B21744;
        Mon,  2 Sep 2019 18:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567447930;
        bh=4P3J4NkIgc4F6pEAdfjqzloqtIEOSTf5ASuleNu0cAM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fgeQH4rsUyxLMZJAyhEM5CPsVzvwFrK+wReZ0J9ebCLlqVRRuQxSCau7RkWJ1qEcr
         hqFG+/nG4tAdYNJ3ZMWKYQOhzxmNBZ8YmzeapS3+kEeVv2PUHWQM/7ru+YtKo6CafX
         NFkrS6phIZTj+XOh3dZZ6Qgl3mogoelf8F1CdfaM=
Date:   Mon, 2 Sep 2019 20:12:07 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Akinobu Mita <akinobu.mita@gmail.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH] leds: remove PAGE_SIZE limit of
 /sys/class/leds/<led>/trigger
Message-ID: <20190902181207.GA18577@kroah.com>
References: <1567090164-6819-1-git-send-email-akinobu.mita@gmail.com>
 <6ebeedab-4a7f-14ea-d62e-9184e911047f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ebeedab-4a7f-14ea-d62e-9184e911047f@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Sep 01, 2019 at 06:53:34PM +0200, Jacek Anaszewski wrote:
> Hi Akinobu,
> 
> Thank you for the patch.
> 
> I have one nit below but in general it looks good to me.
> I've tested it with 2000 mtd triggers (~14kB file size)
> and it worked flawlessly.
> 
> Still, I would like to have ack from Greg for it.
> 
> Adding Greg on Cc.
> 
> On 8/29/19 4:49 PM, Akinobu Mita wrote:
> > Reading /sys/class/leds/<led>/trigger returns all available LED triggers.
> > However, the size of this file is limited to PAGE_SIZE because of the
> > limitation for sysfs attribute.
> > 
> > Enabling LED CPU trigger on systems with thousands of CPUs easily hits
> > PAGE_SIZE limit, and makes it impossible to see all available LED triggers
> > and which trigger is currently activated.
> > 
> > This converts /sys/class/leds/<led>/trigger to bin attribute and removes
> > the PAGE_SIZE limitation.

But this is NOT a binary file.  A sysfs binary file is used for when the
kernel passes data to or from hardware without any parsing of the data
by the kernel.

You are not doing that here, you are abusing the "one value per file"
rule of sysfs so much that you are forced to work around the limitation
it put in place on purpose to keep you from doing stuff like this.

Please fix this "correctly" by creating a new api that works properly
and just live with the fact that this file will never work correctly and
move everyone to use the new api instead.

Don't keep on abusing the interface by workarounds like this, it is not
ok.

thanks,

greg k-h
