Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44D41105972
	for <lists+linux-leds@lfdr.de>; Thu, 21 Nov 2019 19:22:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726333AbfKUSWd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 21 Nov 2019 13:22:33 -0500
Received: from muru.com ([72.249.23.125]:43210 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726279AbfKUSWc (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 21 Nov 2019 13:22:32 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A48D880DB;
        Thu, 21 Nov 2019 18:23:08 +0000 (UTC)
Date:   Thu, 21 Nov 2019 10:22:28 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Jean-Jacques Hiblot <jjhiblot@ti.com>, jacek.anaszewski@gmail.com,
        pavel@ucw.cz, sre@kernel.org, mark.rutland@arm.com,
        lee.jones@linaro.org, daniel.thompson@linaro.org, dmurphy@ti.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v10 5/6] dt-bindings: backlight: Add led-backlight binding
Message-ID: <20191121182228.GO43123@atomide.com>
References: <20191009085127.22843-1-jjhiblot@ti.com>
 <20191009085127.22843-6-jjhiblot@ti.com>
 <20191009193523.GA7094@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009193523.GA7094@bogus>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi,

* Rob Herring <robh@kernel.org> [700101 00:00]:
> On Wed, Oct 09, 2019 at 10:51:26AM +0200, Jean-Jacques Hiblot wrote:
> > Add DT binding for led-backlight.
...
> > new file mode 100644
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
...

> > +  default-brightness:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: Default brightness level on boot.
> 
> It's not clear that this is an index when 'brightness-levels' is present 
> and absolute level when not. I wonder if we've been consistent on that?

Yeah.. And should we use "default-brightness-level" here like we do
in the kernel now?

Sorry if I've missed some discussion on this before..

> > +      brightness-levels = <0 4 8 16 32 64 128 255>;

What we're using for droid4 with an earlier version of this
patch set for the brightness-levels is generated backwards
with:

$ for i in 0 1 2 3 4 5 6 7; do echo "255 - ${i} * (256 / 8)" | bc; done

This produces the following range that seem to behave nicely:

brightness-levels = <31 63 95 127 159 191 223 255>;

Of course depends on the backing hardware, this is with
leds_lm3532 on droid4. But I think also the current example
in the binding might be from Pavel also for droid4?

If so, you might want to update the range :)

Regards,

Tony

