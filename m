Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 01AC416432C
	for <lists+linux-leds@lfdr.de>; Wed, 19 Feb 2020 12:19:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726512AbgBSLTU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 19 Feb 2020 06:19:20 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34659 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726469AbgBSLTU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 19 Feb 2020 06:19:20 -0500
Received: by mail-lj1-f193.google.com with SMTP id x7so26626327ljc.1;
        Wed, 19 Feb 2020 03:19:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=YMrisIju2xkaYMsmg7qHjv2/R/a5abS9W6nC/unzPBU=;
        b=ehnJdxh+u1EGVGVOMvpYrAh00iOMtXGjaAfkAtbyLjCtGSAJclGf5fTwgowg0xJpuu
         hxJCknqOR0ZM3goUkZSPbTck8sz1uwP2D/KQEagt0hO+sr5BIIw4hAmnJ2nZbXt2YZrI
         R7VCH9B8n8G7SZ6KNvP70X5wh4PJTlLu4rx56LB1BT5QPj2JIi4390imQU4lh+ZvtTJ+
         AwzxcVRnAshzwrLzBwuU06zi9xDqfGcyCOXGbpmlX+bQKD2vvKULb/fxRFI+P/Y8ztlu
         tR7R2FdmYpxX8/+zajirWyiDLaCmh2XNcWhQNpsDS+qZGflgn62AKeOCmcuYrj6b+flU
         3I/g==
X-Gm-Message-State: APjAAAWOoBfzbw88LXfty8wK5Xd2mt8kHce1uCJfWiSFAr5qQLdNQbaz
        zX6z7aib8qMS9Cp2xhMQT1I=
X-Google-Smtp-Source: APXvYqyhI2csZSzCeIjjdIdhkC51zzAlpSMWZLNoe2xCIua51ifm1VcbOYzx/0tQGr0cT3kjZGExCQ==
X-Received: by 2002:a2e:b04b:: with SMTP id d11mr16004699ljl.248.1582111157513;
        Wed, 19 Feb 2020 03:19:17 -0800 (PST)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.170.18])
        by smtp.gmail.com with ESMTPSA id 11sm1032702lju.103.2020.02.19.03.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 03:19:16 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1j4NNp-0000wX-R8; Wed, 19 Feb 2020 12:19:13 +0100
Date:   Wed, 19 Feb 2020 12:19:13 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Johan Hovold <johan@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v6 4/4] leds: trigger: implement a tty trigger
Message-ID: <20200219111913.GB32540@localhost>
References: <20200213091600.554-1-uwe@kleine-koenig.org>
 <20200213091600.554-5-uwe@kleine-koenig.org>
 <20200219105239.GA32540@localhost>
 <20200219110306.k5jndutalll64esu@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200219110306.k5jndutalll64esu@pengutronix.de>
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, Feb 19, 2020 at 12:03:06PM +0100, Uwe Kleine-König wrote:
> On Wed, Feb 19, 2020 at 11:52:39AM +0100, Johan Hovold wrote:
> > On Thu, Feb 13, 2020 at 10:16:00AM +0100, Uwe Kleine-König wrote:
> > > From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > 
> > > Usage is as follows:
> > > 
> > > 	myled=ledname
> > > 	tty=ttyS0
> > > 
> > > 	echo tty > /sys/class/leds/$myled/trigger
> > > 	cat /sys/class/tty/$tty/dev > /sys/class/leds/$myled/dev
> > > 
> > > . When this new trigger is active it periodically checks the tty's
> > > statistics and when it changed since the last check the led is flashed
> > > once.
> > > 
> > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > > ---
> > 
> > > +static ssize_t dev_store(struct device *dev,
> > > +			 struct device_attribute *attr, const char *buf,
> > > +			 size_t size)
> > > +{
> > > +	struct ledtrig_tty_data *trigger_data = led_trigger_get_drvdata(dev);
> > > +	struct tty_struct *tty;
> > > +	dev_t d;
> > > +	int ret;
> > > +
> > > +	if (size == 0 || (size == 1 && buf[0] == '\n')) {
> > > +		tty = NULL;
> > > +	} else {
> > > +		ret = kstrtodev_t(buf, &d);
> > > +		if (ret < 0)
> > > +			return ret;
> > > +
> > > +		tty = tty_kopen_shared(d);
> > 
> > I really don't have time to look at this, but having the led-trigger
> > keep the port open looks fundamentally broken (consider modem-control
> > signals, power, etc).
> 
> If I understand correctly calling tty_kopen_shared() doesn't open the
> device, just keep it referenced which prevents it to disappear. Unless I
> miss something it doesn't result in the tty's .open() being called.

So tty_kopen_shared() is something you added. Judging from a quick look
it seems you can only attach a trigger to an already open port, but the
trigger will then keep the port open (again, consider modem control,
power).

I'm sorry I don't have time to review this myself, but this probably
needs some more eyes on it before being merged.

Johan
