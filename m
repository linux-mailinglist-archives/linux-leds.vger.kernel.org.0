Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E478D31F19F
	for <lists+linux-leds@lfdr.de>; Thu, 18 Feb 2021 22:21:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbhBRVVx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 18 Feb 2021 16:21:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:54038 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229620AbhBRVVx (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 18 Feb 2021 16:21:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2F87664E28;
        Thu, 18 Feb 2021 21:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1613683272;
        bh=F38hwkHyfKSDu2J+PLX7hPwqasvhF04vGCChBgLQGDc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WoskCoMRyncdDNKyKiJnbJFJnRxU+IPWTXvy8jcc6dJ5ckyjLGQYGR+stdl1Jib4n
         Q+inxNsiXKWsA3/RgqUT69xJwoSghVJgQIqiXpL+zNu9sfLHcC3pmQWbOiAFsOqqdZ
         l7nK5/KucCpvDMk27TlKkgak7YKeSR8bWSLXgYkw=
Date:   Thu, 18 Feb 2021 22:21:07 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Pavel Machek <pavel@ucw.cz>, kernel@pengutronix.de,
        Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-serial@vger.kernel.org, Jiri Slaby <jslaby@suse.com>,
        linux-leds@vger.kernel.org, Dan Murphy <dmurphy@ti.com>
Subject: Re: [PATCH v11] leds: trigger: implement a tty trigger
Message-ID: <YC7aQ7LKjr+ZRo8w@kroah.com>
References: <20201218104246.591315-1-u.kleine-koenig@pengutronix.de>
 <20201218104246.591315-4-u.kleine-koenig@pengutronix.de>
 <X/8cwD51DYhzRdDO@kroah.com>
 <20210113173018.bq2fkea2o3yp6rf6@pengutronix.de>
 <X/89NHn4oJFC7GjM@kroah.com>
 <20210218133352.GA13628@duo.ucw.cz>
 <20210218211948.4jwhtkhg72kaxx5n@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210218211948.4jwhtkhg72kaxx5n@pengutronix.de>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Feb 18, 2021 at 10:19:48PM +0100, Uwe Kleine-König wrote:
> Hello Pavel,
> 
> On Thu, Feb 18, 2021 at 02:33:52PM +0100, Pavel Machek wrote:
> > > > > so that I can queue it up?
> > > > 
> > > > Oh, so you are LED maintainer now? My congratulations.
> > > > (Honestly, do you plan to apply this without their ack? Not that I'm
> > > > against you doing that, I'm happy if I can archive this patch series as
> > > > done, but I'm a bit surprised.)
> > > 
> > > It's drug on for so long now, the infrastructure that this driver needs
> > > has now bee merged, so I see no reason why this driver can't be taken
> > > now.  I offered up a "any objections?" in the past, and have gotten
> > > none, so I will take that for quiet acceptance :)
> > 
> > Thanks for taking the infrastructure patches, but please drop this
> > one.
> 
> Given it is already part of Greg's pull request I wonder if we need an
> incremental patch instead?

An incremental patch is easier, thanks, I can't "drop" a patch already
in my public tree.

greg k-h
