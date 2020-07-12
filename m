Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 907BF21CC10
	for <lists+linux-leds@lfdr.de>; Mon, 13 Jul 2020 01:16:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728845AbgGLXPs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 12 Jul 2020 19:15:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728617AbgGLXPr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 12 Jul 2020 19:15:47 -0400
X-Greylist: delayed 7544 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 12 Jul 2020 16:15:47 PDT
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80E66C061794;
        Sun, 12 Jul 2020 16:15:47 -0700 (PDT)
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id 400AA13F657;
        Mon, 13 Jul 2020 01:15:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1594595745; bh=a+el10ZHHG0H2equijCDFaZPRdBBA7n9Ne/c/r1f2V4=;
        h=Date:From:To;
        b=MYtHsD7V5T6iBMB/TjB/gxbpI8qNixefeNOZWiOQe+kf1pc5xoJQ8hd3dYPqaJLPh
         67uU3bbb+/4dLe+0iCelvxb3b/HPiK4VYUPHU8UC5irGTQkj8eKZo/xW8wuhKT8Qcj
         +rs3m0MU17c5Vll1eZDZahsfOKVbXtteKd41CyB8=
Date:   Mon, 13 Jul 2020 01:15:44 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     =?UTF-8?B?T25kxZllag==?= Jirman <megous@megous.com>
Cc:     Pavel Machek <pavel@ucw.cz>, linux-kernel@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>,
        "open list:LED SUBSYSTEM" <linux-leds@vger.kernel.org>
Subject: Re: [PATCH RFC] leds: Add support for per-LED device triggers
Message-ID: <20200713011544.0adc51f1@nic.cz>
In-Reply-To: <20200712223821.742ljr4qxdrx3aqv@core.my.home>
References: <20200702144712.1994685-1-megous@megous.com>
        <20200711100409.GA18901@amd>
        <20200711210111.5ysijhexgyzyr7u7@core.my.home>
        <20200712072554.GC4721@duo.ucw.cz>
        <20200712134911.r3lig4hgyqhmslth@core.my.home>
        <20200712191111.GA20592@amd>
        <20200712223821.742ljr4qxdrx3aqv@core.my.home>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WHITELIST shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 13 Jul 2020 00:38:21 +0200
Ond=C5=99ej Jirman <megous@megous.com> wrote:

> Hello,
>=20
> On Sun, Jul 12, 2020 at 09:11:11PM +0200, Pavel Machek wrote:
> > Hi!
> >  =20
>=20
> [....]
>=20
> >  		}
> > diff --git a/include/linux/leds.h b/include/linux/leds.h
> > index 2451962d1ec5..cba52714558f 100644
> > --- a/include/linux/leds.h
> > +++ b/include/linux/leds.h
> > @@ -57,6 +57,10 @@ struct led_init_data {
> >  	bool devname_mandatory;
> >  };
> > =20
> > +struct led_hw_trigger_type {
> > +	int dummy;
> > +}
> > +
> >  struct led_classdev {
> >  	const char		*name;
> >  	enum led_brightness	 brightness;
> > @@ -150,6 +154,8 @@ struct led_classdev {
> > =20
> >  	/* Ensures consistent access to the LED Flash Class device */
> >  	struct mutex		led_access;
> > +
> > +	struct led_hw_trigger_type *trigger_type;
> >  };
> > =20
> >  /**
> > @@ -345,6 +351,9 @@ struct led_trigger {
> >  	int		(*activate)(struct led_classdev *led_cdev);
> >  	void		(*deactivate)(struct led_classdev *led_cdev);
> > =20
> > +	/* LED-private triggers have this set. */
> > +	struct led_hw_trigger_type *trigger_type;
> > +
> >  	/* LEDs under control by this trigger (for simple triggers) */
> >  	rwlock_t	  leddev_list_lock;
> >  	struct list_head  led_cdevs; =20
>=20
> So after trying to use this, this seems to disallow the use of multiple HW
> triggers per LED. That's fine by me, because using one HW sysfs configured
> trigger per LED that use case is my proposal, but is it desireable in gen=
eral?

Why? If you register one LED and several triggers, all sharing the same
trigger_type pointer, I think it should work.

Marek
