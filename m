Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB0D21731E9
	for <lists+linux-leds@lfdr.de>; Fri, 28 Feb 2020 08:42:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726969AbgB1Hmj (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 Feb 2020 02:42:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:45010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726740AbgB1Hmj (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 28 Feb 2020 02:42:39 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 12F0A222C2;
        Fri, 28 Feb 2020 07:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582875758;
        bh=XJ6QPUdi3m2xciSdFjFMkiJm9EL5g3qPpuyby8eg0MI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tOH94HOuFmLzXwwRlOC5uW+Anc97ucljeddRAaPkJSZoQ79CqNUM9ce4bhtZs6a7t
         jicvWgA4mvo46NAauEonqDNB1UTRto5qdtx5+SKjMfYPpb5K3OLAvbIWo6FfR8eAfg
         FWHBIRhcCRM2mhdVr65BNthF8qdQ3aPH6I1FAo9E=
Date:   Fri, 28 Feb 2020 08:42:35 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@denx.de>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v17 00/17] Multi Color LED Framework
Message-ID: <20200228074235.GA2900429@kroah.com>
References: <20200127150032.31350-1-dmurphy@ti.com>
 <42d9687b-b488-22cf-0e9a-ff635b2094e3@ti.com>
 <20200225101940.GB16252@amd>
 <be76fdac-9d32-b9b2-c01d-3aa315b14463@gmail.com>
 <20200226125903.GA2800@duo.ucw.cz>
 <20f6bdd5-e899-aead-8c35-1c3a3d09145f@gmail.com>
 <20200227105808.GA27003@duo.ucw.cz>
 <20200227124329.GA994747@kroah.com>
 <4c273c06-5024-b2d4-c656-b165015090be@ti.com>
 <96a31ff6-5ecf-05a7-d61f-2804f2488d1b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <96a31ff6-5ecf-05a7-d61f-2804f2488d1b@gmail.com>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Feb 27, 2020 at 10:22:43PM +0100, Jacek Anaszewski wrote:
> On 2/27/20 2:07 PM, Dan Murphy wrote:
> > Pavel
> > 
> > On 2/27/20 6:43 AM, Greg KH wrote:
> >> On Thu, Feb 27, 2020 at 11:58:08AM +0100, Pavel Machek wrote:
> >>> Hi, Jacek!
> >>>
> >>> (and thanks for doing this).
> >>>
> >>>> We have here long lasting discussion related to LED multicolor class
> >>>> sysfs interface design. We went through several iterations and worked
> >>>> out the solution with individual file per each color sub-LED in the
> >>>> color directory as shown below:
> >>>>
> >>>> /sys/class/leds/<led>/colors/<color>_intensity
> >>>>
> >>>> This is in line with one-value-per-file sysfs rule, that is being
> >>>> frequently highlighted, and we even had not so long ago a patch
> >>>> for led cpu trigger solving the problem caused by this rule not
> >>>> being adhered to.
> >>> Yep. One of the problems is that it is nice to change all the hardware
> >>> channels at once to produce color (it is often on i2c -- and slow), so
> >>> current proposals use "interesting" kind of latching.
> >>>
> >>>> Now we have the voice below bringing to attention another caveat
> >>>> from sysfs documentation:
> >>>>
> >>>> "it is socially acceptable to express an array of values of the same
> >>>> type"
> >>>>
> >>>> and proposing the interface in the form of two files:
> >>>>
> >>>> channel_intensity (file containing array of u32's)
> >>>> channel_names (usually containing "red green blue")
> >>> And thus I want to have it in one file, so it is naturaly atomic. RGB
> >>> leds with 3 channels are common; I have not user yet, but there are
> >>> RGBW with 4 channels (and some more exotic stuff). I don't expect to
> >>> have more than 5 channels.
> > 
> > This is not an accurate statement.  Right now a user can have up to 8
> > channels to cover all the LEDs defined in the LED core
> > 
> > And if the led_colors array expands then this array can expand.
> > 
> > We have no control on how many entries the user will put in their DT so
> > again this number is completely arbitrary.
> 
> I believe that some of mechanisms that were devised for the most
> recent implementation proposal of LED mc class will need
> to be reused for the array approach. E.g. available_colors bitmask
> will make the parsing resistant to duplicates.
> 
> Of course LED multicolor DT node design should be applicable as well
> to the array approach.
> 
> >> Writing 3 or 4 or 5 numbers all at once in a single sysfs file to
> >> represent a single output should be fine.
> >> thanks,
> 
> Thank you for making this clear.
> 
> Effectively, the way to go as I see it now is just moving from
> colors directory to channel_intensity and channel_names files.

Wait, we already have an interface for this and you want to create a
competing one?  Why?  What's wrong with what you have now?

Do you have a pointer to the Documentation/ABI/ entries that you have
now that you feel do not work well?

thanks,

greg k-h
