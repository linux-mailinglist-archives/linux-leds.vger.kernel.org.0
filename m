Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DA3C1341E6
	for <lists+linux-leds@lfdr.de>; Wed,  8 Jan 2020 13:40:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727892AbgAHMkI convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Wed, 8 Jan 2020 07:40:08 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:39130 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727328AbgAHMkI (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 8 Jan 2020 07:40:08 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id 22CFCFB02;
        Wed,  8 Jan 2020 13:40:04 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id oPyIRY5MccmG; Wed,  8 Jan 2020 13:40:02 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id E318F49D3D; Wed,  8 Jan 2020 13:40:00 +0100 (CET)
Date:   Wed, 8 Jan 2020 13:40:00 +0100
From:   Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: Exponential LED brightness Re: [PATCH v4 0/6] leds: lm3692x:
 Allow to set ovp and brigthness mode
Message-ID: <20200108124000.GA21245@bogon.m.sigxcpu.org>
References: <cover.1578324703.git.agx@sigxcpu.org>
 <20200107133119.GA3825@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20200107133119.GA3825@duo.ucw.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Pavel,
On Tue, Jan 07, 2020 at 02:31:20PM +0100, Pavel Machek wrote:
> Hi!
> 
> > Overvoltage protection and brightness mode are currently hardcoded
> > as 29V and disabled in the driver. Make these configurable via DT.
> > 
> > This v4 moves the exponential brightness mode to the back of the series
> > as per Pavel's request:
> > 
> >   https://lore.kernel.org/linux-next/20200106103233.GA32426@amd/T/#m93270a9bf10b88e060f4e4cf5701c527476de985
> > 
> > The end result is identical and i've tested everything still works when
> > dropping the last to patches and checked compiltion via
> 
> Thank you. Applied 1-4 (with some reformatting of changelog, and
> led->LED).
> 
> Exponential mode:
> 
> We should decide if LEDs should be linear or not. Most LEDs are linear
> now, and we may want to make it part of the API. Additional advantage
> is that linear is "well defined". It is actually quite important for
> RGB LEDs, because you get wrong colors otherwise.
> 
> (Non-linear can have advantages, too... like needing less bits.)
> 
> So, my suggestion is to document LEDs as linear, and leave
> exponential->linear conversion to someone else.

That would mean doing a conversion in the kernel that can be done by the
chip. Would exposing non-linearity like in
/sys/class/backlight/<backlight>/scale be an option?
Cheers,
 -- Guido


> 
> Best regards,
> 
> 									Pavel
> -- 
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html


