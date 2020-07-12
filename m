Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A86321CC21
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2020 01:20:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbgGLXUF (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 12 Jul 2020 19:20:05 -0400
Received: from vps.xff.cz ([195.181.215.36]:60446 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727785AbgGLXUF (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sun, 12 Jul 2020 19:20:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=megous.com; s=mail;
        t=1594596003; bh=hO4xCkjUxhM7rmK+bUGTraRvUyv4jJ7Jl440PsXvssU=;
        h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
        b=i9w/8Hsx1wwhoCwIdcamoOeWQxQP7J0lF6qsjenRYx5M1CPvaTrVn46tnwTtFbUSH
         FyYgRCP2esFHWcjMEsPE5ltIzu3wqcnI51cnOI63CSfJ1yucmA/3bWR+t6+o6g0o0c
         ZQFmxkO9rvi4Gu20iCn4DHMoZcfJh4OMdfSrkegU=
Date:   Mon, 13 Jul 2020 01:20:03 +0200
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>
To:     Marek Behun <marek.behun@nic.cz>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH RFC] leds: Add support for per-LED device triggers
Message-ID: <20200712232003.qpogdep7xp4hfmu5@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megous@megous.com>,
        Marek Behun <marek.behun@nic.cz>, Pavel Machek <pavel@ucw.cz>,
        linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
References: <20200702144712.1994685-1-megous@megous.com>
 <20200711100409.GA18901@amd>
 <20200711210111.5ysijhexgyzyr7u7@core.my.home>
 <20200712072554.GC4721@duo.ucw.cz>
 <20200712134911.r3lig4hgyqhmslth@core.my.home>
 <20200712191111.GA20592@amd>
 <20200712223821.742ljr4qxdrx3aqv@core.my.home>
 <20200713011544.0adc51f1@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200713011544.0adc51f1@nic.cz>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Jul 13, 2020 at 01:15:44AM +0200, Marek Behun wrote:
> On Mon, 13 Jul 2020 00:38:21 +0200
> Ondřej Jirman <megous@megous.com> wrote:
> 
> > Hello,
> > 
> > On Sun, Jul 12, 2020 at 09:11:11PM +0200, Pavel Machek wrote:
> > > Hi!
> > >   
> > 
> > [....]
> > 
> > >  		}
> > > diff --git a/include/linux/leds.h b/include/linux/leds.h
> > > index 2451962d1ec5..cba52714558f 100644
> > > --- a/include/linux/leds.h
> > > +++ b/include/linux/leds.h
> > > @@ -57,6 +57,10 @@ struct led_init_data {
> > >  	bool devname_mandatory;
> > >  };
> > >  
> > > +struct led_hw_trigger_type {
> > > +	int dummy;
> > > +}
> > > +
> > >  struct led_classdev {
> > >  	const char		*name;
> > >  	enum led_brightness	 brightness;
> > > @@ -150,6 +154,8 @@ struct led_classdev {
> > >  
> > >  	/* Ensures consistent access to the LED Flash Class device */
> > >  	struct mutex		led_access;
> > > +
> > > +	struct led_hw_trigger_type *trigger_type;
> > >  };
> > >  
> > >  /**
> > > @@ -345,6 +351,9 @@ struct led_trigger {
> > >  	int		(*activate)(struct led_classdev *led_cdev);
> > >  	void		(*deactivate)(struct led_classdev *led_cdev);
> > >  
> > > +	/* LED-private triggers have this set. */
> > > +	struct led_hw_trigger_type *trigger_type;
> > > +
> > >  	/* LEDs under control by this trigger (for simple triggers) */
> > >  	rwlock_t	  leddev_list_lock;
> > >  	struct list_head  led_cdevs;  
> > 
> > So after trying to use this, this seems to disallow the use of multiple HW
> > triggers per LED. That's fine by me, because using one HW sysfs configured
> > trigger per LED that use case is my proposal, but is it desireable in general?
> 
> Why? If you register one LED and several triggers, all sharing the same
> trigger_type pointer, I think it should work.

Ah, you're right. :)

thanks,
	o.

> Marek
