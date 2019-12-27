Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 574D912B4AB
	for <lists+linux-leds@lfdr.de>; Fri, 27 Dec 2019 13:59:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726538AbfL0M7p (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 27 Dec 2019 07:59:45 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:33310 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726377AbfL0M7p (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 27 Dec 2019 07:59:45 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 59BE2FB03;
        Fri, 27 Dec 2019 13:59:42 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id R0-rgRbwKwjQ; Fri, 27 Dec 2019 13:59:40 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id C688E49799; Fri, 27 Dec 2019 13:59:39 +0100 (CET)
Date:   Fri, 27 Dec 2019 13:59:39 +0100
From:   Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] leds: lm3692x: Make sure we don't exceed the
 maximum led current
Message-ID: <20191227125939.GA26392@bogon.m.sigxcpu.org>
References: <cover.1577271823.git.agx@sigxcpu.org>
 <96dad031f3a9ff5bbc311d0ec8768b348b996bcf.1577271823.git.agx@sigxcpu.org>
 <20191226101336.GD4033@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191226101336.GD4033@amd>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,
On Thu, Dec 26, 2019 at 11:13:36AM +0100, Pavel Machek wrote:
> On Wed 2019-12-25 12:07:19, Guido Günther wrote:
> 1;2802;0c> The current is given by the formular from page 12 of
> > https://www.ti.com/lit/ds/symlink/lm36922.pdf. We use this to limit the
> > led's max_brightness using the led-max-microamp DT property.
> > 
> > The formular for the lm36923 is identical according to the data
> sheet.
> 
> formula?
> 
> >  static int lm3692x_probe_dt(struct lm3692x_led *led)
> >  {
> >  	struct fwnode_handle *child = NULL;
> >  	struct led_init_data init_data = {};
> > -	u32 ovp;
> > +	u32 ovp, max_cur;
> >  	bool exp_mode;
> >  	int ret;
> >  
> > @@ -397,6 +416,10 @@ static int lm3692x_probe_dt(struct lm3692x_led *led)
> >  		return ret;
> >  	}
> >  
> > +	fwnode_property_read_u32(child, "led-max-microamp", &max_cur);
> > +	led->led_dev.max_brightness = ret ? LED_FULL :
> > +		lm3692x_max_brightness(led, max_cur);
> > +
> 
> Umm. Should ret come from this fwnode_property_read_u32()?

Argh...i was sure i had that fixed (and tested without setting
led-max-microamp) but it was sitting on another branch. Thanks a lot for
catching that!
 -- Guido

> 
> With that fixed,
> 
> Acked-by: Pavel Machek <pavel@ucw.cz>
> 
> (Feel free to wait for Rob before resending the series, and I guess
> you can merge it with the next one).
> 
> Best regards,
> 									Pavel
> -- 
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html


