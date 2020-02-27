Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4FC71717B6
	for <lists+linux-leds@lfdr.de>; Thu, 27 Feb 2020 13:43:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728998AbgB0Mnd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 27 Feb 2020 07:43:33 -0500
Received: from mail.kernel.org ([198.145.29.99]:40558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728977AbgB0Mnd (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 27 Feb 2020 07:43:33 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5449724695;
        Thu, 27 Feb 2020 12:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582807411;
        bh=YziCh5RfRjGRbrEFqGpPxtb+NAbvdYamyvPjRGczxG0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pNjU2Ahi4rlB1blPiCQmcukYcXPdWue3UzZRh8NOCawRsvTTPA+TB4ourbXemwswi
         +Zb32Y6KjD9zTFWGNWGlRFT0CHHpqHqZOb/HUWVDO0jVn/bBcSYGD8Kd8Ve+H9TTTB
         lShd613bsGATtZwE7hYkoF74Vp+9gpbVrbYHdRbE=
Date:   Thu, 27 Feb 2020 13:43:29 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Pavel Machek <pavel@denx.de>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v17 00/17] Multi Color LED Framework
Message-ID: <20200227124329.GA994747@kroah.com>
References: <20200127150032.31350-1-dmurphy@ti.com>
 <42d9687b-b488-22cf-0e9a-ff635b2094e3@ti.com>
 <20200225101940.GB16252@amd>
 <be76fdac-9d32-b9b2-c01d-3aa315b14463@gmail.com>
 <20200226125903.GA2800@duo.ucw.cz>
 <20f6bdd5-e899-aead-8c35-1c3a3d09145f@gmail.com>
 <20200227105808.GA27003@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200227105808.GA27003@duo.ucw.cz>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Feb 27, 2020 at 11:58:08AM +0100, Pavel Machek wrote:
> Hi, Jacek!
> 
> (and thanks for doing this).
> 
> > We have here long lasting discussion related to LED multicolor class
> > sysfs interface design. We went through several iterations and worked
> > out the solution with individual file per each color sub-LED in the
> > color directory as shown below:
> > 
> > /sys/class/leds/<led>/colors/<color>_intensity
> > 
> > This is in line with one-value-per-file sysfs rule, that is being
> > frequently highlighted, and we even had not so long ago a patch
> > for led cpu trigger solving the problem caused by this rule not
> > being adhered to.
> 
> Yep. One of the problems is that it is nice to change all the hardware
> channels at once to produce color (it is often on i2c -- and slow), so
> current proposals use "interesting" kind of latching.
> 
> > Now we have the voice below bringing to attention another caveat
> > from sysfs documentation:
> > 
> > "it is socially acceptable to express an array of values of the same
> > type"
> > 
> > and proposing the interface in the form of two files:
> > 
> > channel_intensity (file containing array of u32's)
> > channel_names (usually containing "red green blue")
> 
> And thus I want to have it in one file, so it is naturaly atomic. RGB
> leds with 3 channels are common; I have not user yet, but there are
> RGBW with 4 channels (and some more exotic stuff). I don't expect to
> have more than 5 channels.

Writing 3 or 4 or 5 numbers all at once in a single sysfs file to
represent a single output should be fine.

thanks,

greg k-h
