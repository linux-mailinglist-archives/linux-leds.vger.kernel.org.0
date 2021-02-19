Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41B6F31F77E
	for <lists+linux-leds@lfdr.de>; Fri, 19 Feb 2021 11:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbhBSKmf (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 19 Feb 2021 05:42:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:55554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229826AbhBSKmc (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 19 Feb 2021 05:42:32 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8CFAB64E43;
        Fri, 19 Feb 2021 10:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1613731312;
        bh=4KLb7O861o6oipBM32Ldo3c2DIISyocwqtvPmZ9YE9s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=z9TMITgG+ESKmS+y8iRyz9uMvA200PiLSvzCxH6DB3GThm9Rhb2I0rtjmIf1KQ8Bn
         kKD2NkDAQMA8tZ9HZEIoOMUuyzrW1kdnW5OwFnn4pQ6SUrSK/fqTjQD8CJ0ooKXKuo
         QWRX8dxKsRnO6vyL+WY8rJCr9ru91YTLMu48Pg9w=
Date:   Fri, 19 Feb 2021 11:41:49 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Pavel Machek <pavel@ucw.cz>, kernel@pengutronix.de,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH 2/2] leds: trigger/tty: Use led_set_brightness_sync()
 from workqueue
Message-ID: <YC+V7bkdq1SAPYs9@kroah.com>
References: <20210219082955.5007-1-u.kleine-koenig@pengutronix.de>
 <20210219082955.5007-2-u.kleine-koenig@pengutronix.de>
 <20210219094632.GB5641@duo.ucw.cz>
 <20210219095254.ky33qlb3cvy5btpe@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210219095254.ky33qlb3cvy5btpe@pengutronix.de>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, Feb 19, 2021 at 10:52:54AM +0100, Uwe Kleine-König wrote:
> On Fri, Feb 19, 2021 at 10:46:32AM +0100, Pavel Machek wrote:
> > On Fri 2021-02-19 09:29:55, Uwe Kleine-König wrote:
> > > led_set_brightness() involves scheduling a workqueue. As here the led's
> > > brightness setting is done in context of the trigger's workqueue this is
> > > unjustified overhead and it's more sensible to use
> > > led_set_brightness_sync().
> > 
> > Acked-by: Pavel Machek <pavel@ucw.cz>
> 
> Who is expected to pick these two up? I assume Greg as the commit that
> is fixed here is only in his try for now?

I will do so once Linus takes my existing pull request, don't worry,
they will make it into 5.12-final.

thanks,

greg k-h
