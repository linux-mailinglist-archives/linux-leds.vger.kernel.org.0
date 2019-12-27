Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 81F3512B471
	for <lists+linux-leds@lfdr.de>; Fri, 27 Dec 2019 13:17:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbfL0MRE (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 27 Dec 2019 07:17:04 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:60900 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726053AbfL0MRE (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 27 Dec 2019 07:17:04 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 5C2E4FB03;
        Fri, 27 Dec 2019 13:17:02 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id TI76RAkMDfvm; Fri, 27 Dec 2019 13:17:01 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id 9B10049799; Fri, 27 Dec 2019 13:17:00 +0100 (CET)
Date:   Fri, 27 Dec 2019 13:17:00 +0100
From:   Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt: bindings: lm3692x: Add ti,ovp-microvolt
 property
Message-ID: <20191227121700.GA18032@bogon.m.sigxcpu.org>
References: <cover.1577271823.git.agx@sigxcpu.org>
 <f45e30f43b7d20ac14f93309a006249fdb351ddd.1577271823.git.agx@sigxcpu.org>
 <20191226100615.GA4033@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191226100615.GA4033@amd>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,
On Thu, Dec 26, 2019 at 11:06:15AM +0100, Pavel Machek wrote:
> On Wed 2019-12-25 12:07:14, Guido Günther wrote:
> > This allows to set the overvoltage protection to 17V, 21V, 25V or 29V.
> > 
> > Signed-off-by: Guido Günther <agx@sigxcpu.org>
> 
> Acked-by: Pavel	 Machek <pavel@ucw.cz>

Thanks!

> I will need Rob's Ack.
> 
> > @@ -44,6 +48,7 @@ led-controller@36 {
> >  
> >  	enable-gpios = <&gpio1 28 GPIO_ACTIVE_HIGH>;
> >  	vled-supply = <&vbatt>;
> > +	ti,ovp-microvolt = <25000000>;
> 
> Wed often put the default values here.

Makes sense, thanks.
 -- Guido

> 									Pavel
> -- 
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html


