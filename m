Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51B1421C847
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2020 11:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728354AbgGLJcB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 12 Jul 2020 05:32:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:44566 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728341AbgGLJcA (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 12 Jul 2020 05:32:00 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 72F7720720;
        Sun, 12 Jul 2020 09:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594546320;
        bh=QbBUjOO2ONnvgGnMB4P8D8RHlpRM3HwBtK8P2s+FuHo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DIOaCGD1+bjKJDJVKTV/O8HAFx/9ay39kyDx/3wyN+HoGE6tTP/yDj48Mz9D1nOrY
         NcF/EMHdvhav34JEa8FoC9yPWjPHQsDxtCoSjNQlNiqv7SRq9ZqLOhXXE9qhdYIrbY
         PvQ8mAXR4UcmxQWkXeaZKzzcDZQuy0ybtVVu0ClU=
Date:   Sun, 12 Jul 2020 11:31:55 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Pavel Machek <pavel@denx.de>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Jiri Slaby <jslaby@suse.com>,
        kernel@pengutronix.de, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v7 3/3] leds: trigger: implement a tty trigger
Message-ID: <20200712093155.GA179963@kroah.com>
References: <20200707165958.16522-1-u.kleine-koenig@pengutronix.de>
 <20200707165958.16522-4-u.kleine-koenig@pengutronix.de>
 <20200712082453.GI8295@amd>
 <20200712084352.GA175558@kroah.com>
 <20200712085059.GA13495@amd>
 <20200712090217.GA177304@kroah.com>
 <20200712090731.GB13495@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200712090731.GB13495@amd>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Sun, Jul 12, 2020 at 11:07:31AM +0200, Pavel Machek wrote:
> On Sun 2020-07-12 11:02:17, Greg Kroah-Hartman wrote:
> > On Sun, Jul 12, 2020 at 10:50:59AM +0200, Pavel Machek wrote:
> > > On Sun 2020-07-12 10:43:52, Greg Kroah-Hartman wrote:
> > > > On Sun, Jul 12, 2020 at 10:24:53AM +0200, Pavel Machek wrote:
> > > > > > +++ b/drivers/leds/trigger/ledtrig-tty.c
> > > > > > @@ -0,0 +1,192 @@
> > > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > 
> > > > > 2.0+ is preffered.
> > > > 
> > > > No it is not, that's up to the developer.
> > > 
> > > For code I maintain, yes it is.
> > 
> > That's up to the developer of the code, not the maintainer, as the
> > maintainer is not the copyright holder of it.  For new files, it is up
> > to the author of that code.  No maintainer should impose a license rule
> > like this on their subsystem, that's just not ok at all.  The only
> > "rule" is that it is compatible with GPLv2, nothing else.
> 
> No, see for example device tree rules.

Note, I don't agree with that rule, and if you have noticed, it's not
really enforced.

> Plus, IIRC it was you who asked the developer to "doublecheck with
> their legal" when you seen GPL-2.0+.  You can't really prevent me from
> doing the same.

Asking to verify that a specific license is what they really want it to
be and they know the ramifications of it is NOT the same as saying "For
code in the subsystem I maintain it has to be GPLv2+".

thanks,

greg k-h
