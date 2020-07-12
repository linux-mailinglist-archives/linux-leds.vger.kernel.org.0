Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E1C3321C993
	for <lists+linux-leds@lfdr.de>; Sun, 12 Jul 2020 15:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728886AbgGLNtO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 12 Jul 2020 09:49:14 -0400
Received: from vps.xff.cz ([195.181.215.36]:55000 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728861AbgGLNtO (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 12 Jul 2020 09:49:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1594561752; bh=XvLcOxUWR9hqFcJloysEBIdGyf9K07fFo/kigqU6iic=;
        h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
        b=sFk1Nqx9YZy3QbA+VLrwwPKmXDszKuOWpY1PlORUBzNlAQRMRGSXHnxvyBIF12nbN
         aBHd+8/m9Tbah/Hw0K/iZht8n9rB0jPDahT1rHNNw9awM/JNySNZ4OZ/lVjAvGoSz3
         f/ieb8aHXWNRgzInQ8amSkDLXK1zX3ed2BmeaITE=
Date:   Sun, 12 Jul 2020 15:49:11 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>,
        marek.behun@nic.cz
Subject: Re: [PATCH RFC] leds: Add support for per-LED device triggers
Message-ID: <20200712134911.r3lig4hgyqhmslth@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>,
        marek.behun@nic.cz
References: <20200702144712.1994685-1-megous@megous.com>
 <20200711100409.GA18901@amd>
 <20200711210111.5ysijhexgyzyr7u7@core.my.home>
 <20200712072554.GC4721@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200712072554.GC4721@duo.ucw.cz>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello,

On Sun, Jul 12, 2020 at 09:25:54AM +0200, Pavel Machek wrote:
> On Sat 2020-07-11 23:01:11, Ondřej Jirman wrote:
> > Hello Pavel,
> > 
> > On Sat, Jul 11, 2020 at 12:04:09PM +0200, Pavel Machek wrote:
> > > Hi!
> > > 
> > > > Some LED controllers may come with an internal HW triggering mechanism
> > > > for the LED and an ability to switch between user control of the LED,
> > > > or the internal control. One such example is AXP20X PMIC, that allows
> > > > wither for user control of the LED, or for internal control based on
> > > > the state of the battery charger.
> > > > 
> > > > Add support for registering per-LED device trigger.
> > > > 
> > > > Names of private triggers need to be globally unique, but may clash
> > > > with other private triggers. This is enforced during trigger
> > > > registration. Developers can register private triggers just like
> > > > the normal triggers, by setting private_led to a classdev
> > > > of the LED the trigger is associated with.
> > > 
> > > What about this? Should address Marek's concerns about resource use...
> > 
> > What concerns? Marek's concerns seem to be about case where we register
> > a trigger for (each led * self-working configuration) which I admit
> > can be quite a lot of triggers if there are many functions. But that's
> > not my proposal.
> > 
> > My proposal is to only register on trigger per LED at most. So on my
> > system that's 1 extra trigger and on Marek's system that'd be 48 new
> > triggers. Neither seems like a meaningful problem from resource
> > use perspective.
> 
> So.. 48 triggers on Marek's systems means I'll not apply your patch.
> 
> Please take a look at my version, it is as simple and avoids that
> problem.

I would, but I don't see your version linked or mentioned in this thread.

thank you and regards,
	o.

> If it works for you, you can submit it properly and I'll likely accept
> it.
> 
> Best regards,
> 									Pavel
> -- 
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html


