Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19F2412A0DA
	for <lists+linux-leds@lfdr.de>; Tue, 24 Dec 2019 12:45:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbfLXLpX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 Dec 2019 06:45:23 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:42376 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726124AbfLXLpX (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Tue, 24 Dec 2019 06:45:23 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id C6B9EFB03;
        Tue, 24 Dec 2019 12:45:20 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id oeGdyga0v2t8; Tue, 24 Dec 2019 12:45:19 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id 12A6640BD8; Tue, 24 Dec 2019 12:45:19 +0100 (CET)
Date:   Tue, 24 Dec 2019 12:45:18 +0100
From:   Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt: bindings: lm3692x: Document new properties
Message-ID: <20191224114518.GA13883@bogon.m.sigxcpu.org>
References: <cover.1576499103.git.agx@sigxcpu.org>
 <35a23315938909c80e7772838e1de0d2d46302f2.1576499103.git.agx@sigxcpu.org>
 <20191221191515.GF32732@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191221191515.GF32732@amd>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,
On Sat, Dec 21, 2019 at 08:15:15PM +0100, Pavel Machek wrote:
> On Mon 2019-12-16 13:28:05, Guido Günther wrote:
> > We allow configuration of brightness mode and over voltage
> > protection.
> > 
> > Signed-off-by: Guido Günther <agx@sigxcpu.org>
> > +++ b/Documentation/devicetree/bindings/leds/leds-lm3692x.txt
> > @@ -18,6 +18,10 @@ Required properties:
> >  Optional properties:
> >  	- enable-gpios : gpio pin to enable/disable the device.
> >  	- vled-supply : LED supply
> > +	- ti,brightness-mapping-exponential: Whether to use exponential
> > +	    brightness mapping
> > +	- ti,overvoltage-volts: Overvoltage protection in Volts, can
> > +	    be 0 (unprotected), 21, 25 or 29V
> >  
> 
> We usually use microvolts in various device tree properties...

Make sense.

> Exponential mapping s not really property of the hardware, is it? Does
> it belong here or somewhere in the backlight binding?

I opted for having it with the hardware since the property can't be
configured per backlight led strip individually.

Cheers,
 -- Guido

> Best regards,
> 									Pavel
> -- 
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html


