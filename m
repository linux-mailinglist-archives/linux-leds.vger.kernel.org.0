Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1EC0123363
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2019 18:21:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbfLQRVG (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Dec 2019 12:21:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:58286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726191AbfLQRVG (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 17 Dec 2019 12:21:06 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6490F21582;
        Tue, 17 Dec 2019 17:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576603265;
        bh=M03ToXVlhxaSn1s14N+p+KZe5B0/dADmOYgSMKETlNs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TkHRnpSBunkxmidMGP8NjEIv8AikT24N46ZYxcKbI4BtwHE2DzWKFve1hoVg3Wv/b
         vsDrp9eWvubSOm7EOKqAcUc3RPmDSRKRz30qa6fOxYorMrW5N3969gi2Nl+FVi/bZk
         +mxUJFk5EMHhzhywXR7RMzyAtUP5HQH1xTQgJjPM=
Date:   Tue, 17 Dec 2019 18:21:02 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Jiri Slaby <jslaby@suse.com>, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v3 3/3] leds: trigger: implement a tty trigger
Message-ID: <20191217172102.GB3829986@kroah.com>
References: <20191217150736.1479-1-u.kleine-koenig@pengutronix.de>
 <20191217150736.1479-4-u.kleine-koenig@pengutronix.de>
 <20191217152724.GA3667595@kroah.com>
 <20191217162313.5n3v7va5nw5lxloh@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191217162313.5n3v7va5nw5lxloh@pengutronix.de>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, Dec 17, 2019 at 05:23:13PM +0100, Uwe Kleine-König wrote:
> On Tue, Dec 17, 2019 at 04:27:24PM +0100, Greg Kroah-Hartman wrote:
> > On Tue, Dec 17, 2019 at 04:07:36PM +0100, Uwe Kleine-König wrote:
> > > Usage is as follows:
> > > 
> > > 	myled=ledname
> > > 	tty=ttyS0
> > > 
> > > 	echo tty > /sys/class/leds/$myled/trigger
> > > 	cat /sys/class/tty/$tty/dev > /sys/class/leds/$myled/dev
> > 
> > Is this the correct instructions?  Aren't you looking for a major/minor
> > number instead in your sysfs file?
> 
> This is correct, yes, at least it works as intended on my machine.
> 
> /sys/class/tty/$tty/dev produces $major:$minor and that's what the
> led-trigger consumes.

Ugh, nevermind, I totally read that wrong, I was thinking "echo" instead
of cat.  My fault, what you wrote is correct.  Should that be documented
somewhere in a Documentation/ABI/ file so that people know how to use
this new sysfs file?  How are led triggers documented?

thanks,

greg k-h
