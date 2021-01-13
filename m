Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FDE82F5232
	for <lists+linux-leds@lfdr.de>; Wed, 13 Jan 2021 19:35:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728295AbhAMSeD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 13 Jan 2021 13:34:03 -0500
Received: from mail.kernel.org ([198.145.29.99]:40280 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728285AbhAMSeD (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 13 Jan 2021 13:34:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C30B7233ED;
        Wed, 13 Jan 2021 18:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1610562802;
        bh=gVAG2LQDgrcXGsfnLWrxjmYlxvDhqJhA+Xa6vYnElr0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YC/52rQBFyccqFv0pAVWA/24dDITKfuoR52pnFZiB3uPiNZqsmfjftWhbdwSxy9mg
         sulIhq8fWKYPP27srNlyj/RRv/invGgzOLkBt99cQTU9gEaWG6ZTP1dGdKWJsL3oDN
         CWsHEcXl2B6AXtJ+NbV1En7/zM5igjGZNOURs+gk=
Date:   Wed, 13 Jan 2021 19:34:28 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org,
        Johan Hovold <johan@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
        kernel@pengutronix.de, linux-leds@vger.kernel.org,
        Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v11] leds: trigger: implement a tty trigger
Message-ID: <X/89NHn4oJFC7GjM@kroah.com>
References: <20201218104246.591315-1-u.kleine-koenig@pengutronix.de>
 <20201218104246.591315-4-u.kleine-koenig@pengutronix.de>
 <X/8cwD51DYhzRdDO@kroah.com>
 <20210113173018.bq2fkea2o3yp6rf6@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210113173018.bq2fkea2o3yp6rf6@pengutronix.de>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Jan 13, 2021 at 06:30:18PM +0100, Uwe Kleine-König wrote:
> Usage is as follows:
> 
> 	myled=ledname
> 	tty=ttyS0
> 
> 	echo tty > /sys/class/leds/$myled/trigger
> 	echo $tty > /sys/class/leds/$myled/ttyname
> 
> . When this new trigger is active it periodically checks the tty's
> statistics and when it changed since the last check the led is flashed
> once.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
> 
> On Wed, Jan 13, 2021 at 05:16:00PM +0100, Greg Kroah-Hartman wrote:
> > This causes the following build warning with the patch applied:
> > 
> > drivers/leds/trigger/ledtrig-tty.c:19:13: warning: ‘ledtrig_tty_halt’ defined but not used [-Wunused-function]
> >    19 | static void ledtrig_tty_halt(struct ledtrig_tty_data *trigger_data)
> >       |             ^~~~~~~~~~~~~~~~
> > 
> > Can you fix this up and just resend this patch (the other 2 are already
> > in my tree),
> 
> oh indeed. Thanks for catching this and so preventing me still more
> shame when I have to receive a dozen or so patches that fix this :-)
> Droping this function is the only change since v10.
> 
> > so that I can queue it up?
> 
> Oh, so you are LED maintainer now? My congratulations.
> (Honestly, do you plan to apply this without their ack? Not that I'm
> against you doing that, I'm happy if I can archive this patch series as
> done, but I'm a bit surprised.)

It's drug on for so long now, the infrastructure that this driver needs
has now bee merged, so I see no reason why this driver can't be taken
now.  I offered up a "any objections?" in the past, and have gotten
none, so I will take that for quiet acceptance :)

thanks,

greg k-h
