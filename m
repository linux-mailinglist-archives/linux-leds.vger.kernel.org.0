Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84321297B99
	for <lists+linux-leds@lfdr.de>; Sat, 24 Oct 2020 11:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1760414AbgJXJQQ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 24 Oct 2020 05:16:16 -0400
Received: from mail.z3ntu.xyz ([128.199.32.197]:46378 "EHLO mail.z3ntu.xyz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1760386AbgJXJQP (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 24 Oct 2020 05:16:15 -0400
Received: by mail.z3ntu.xyz (Postfix, from userid 182)
        id AA36AC4702; Sat, 24 Oct 2020 09:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1603530972; bh=5SuihgmgabgUXEHeC4PFw/puchuVoQxuo5K5HIN+X5k=;
        h=From:To:Subject:Date:In-Reply-To:References;
        b=C6AplMd9pjWw4nL9fgNnpaDb4Z+S31ozDdS81wM9tD8Q7Jjk26iaLd0sTWGXMfik7
         jCZVNnIk5SDQ97/GTbmPuwnWX9N+JHhSCMjQljBLc7nfOWhl0nED/jGgR26DJMP3B/
         uMvl1hRdD7QnxVk8NXp+LlF+GTGqxastMk5T4s2U=
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on arch-vps
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FROM_SUSPICIOUS_NTLD,
        PDS_OTHER_BAD_TLD,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.4
Received: from g550jk.localnet (80-110-125-173.cgn.dynamic.surfer.at [80.110.125.173])
        by mail.z3ntu.xyz (Postfix) with ESMTPSA id 3C307C46FC;
        Sat, 24 Oct 2020 09:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
        t=1603530967; bh=5SuihgmgabgUXEHeC4PFw/puchuVoQxuo5K5HIN+X5k=;
        h=From:To:Subject:Date:In-Reply-To:References;
        b=wHR7nFQbZYILzMNmN+nii2Va+65bsv+BK+m+fJg7OY3OYpGbO5N4GLsOuO1ozr2eX
         tJ+QWtKpgXQzROFHCD52TuQqT6JKX6hkjmv085Rg9f/pMIEDm3kK4lKdoroQ4ZIoyW
         mMj0y7MBhqg9gM9bw7bR8nG5BxDGU3aJuDRyCHkI=
From:   Luca Weiss <luca@z3ntu.xyz>
To:     Alexander Dahl <post@lespocky.de>, Luca Weiss <luca@z3ntu.xyz>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        bjorn.andersson@linaro.org
Subject: Re: Clarification regarding multicolor leds
Date:   Sat, 24 Oct 2020 11:16:06 +0200
Message-ID: <10310099.4WBubqx7bp@g550jk>
In-Reply-To: <20201024064238.ahnojlj6b7r3eszn@falbala.internal.home.lespocky.de>
References: <24145961.oFyDssk0vh@g550jk> <20201024064238.ahnojlj6b7r3eszn@falbala.internal.home.lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Alex,

On Samstag, 24. Oktober 2020 08:42:38 CEST Alexander Dahl wrote:
> Hello Luca,
> 
> On Sat, Oct 24, 2020 at 12:48:42AM +0200, Luca Weiss wrote:
> > I'm currently experimenting with the qcom lpg[0] which is a driver for the
> > rgb notification led found on e.g. Snapdragon 801 devices (and many
> > more), specifically my example is about the Fairphone 2
> > (msm8974-fairphone-fp2).
> Great to hear someone is interested in mainline support for Fairphone.
> I just bought a used FP2 on ebay. :-)
> 
> > [0]
> > https://lore.kernel.org/lkml/20201021201224.3430546-1-bjorn.andersson@lin
> > aro.org/> 
> > My dts is looking like the following (abbreviated):
> >     [in lpg node]
> >     multi-led {
> >     
> >         color = <LED_COLOR_ID_MULTI>;
> >         function = LED_FUNCTION_STATUS;
> >         ....
> >     
> >     };
> > 
> > I'm comparing this to the PinePhone where the leds are defined as follows:
> >     [in gpio-leds node]
> >     blue {
> >     
> >         function = LED_FUNCTION_INDICATOR;
> >         color = <LED_COLOR_ID_BLUE>;
> >     
> >     };
> >     
> >     green {
> >     
> >         function = LED_FUNCTION_INDICATOR;
> >         color = <LED_COLOR_ID_GREEN>;
> >     
> >     };
> >     
> >     red {
> >     
> >         function = LED_FUNCTION_INDICATOR;
> >         color = <LED_COLOR_ID_RED>;
> >     
> >     };
> > 
> > (sidenote: the LED_FUNCTION_INDICATOR should probably also be
> > LED_FUNCTION_STATUS there; the dts was made before the better descriptions
> > for the defines have been added)
> > 
> > This gets the following directories created in /sys/class/leds/:
> >     blue:indicator
> >     green:indicator
> >     red:indicator
> 
> That's right.  From Linux point of view these behave like three
> independent LEDs.  It's fully up to userspace to handle this.

Exactly, that I understand well.

> 
> > But with the multicolor led on the Fairphone 2 only a directory with the
> > name of "multi-led" gets created which I would have expected to be
> > "multicolor:status" instead.
> 
> Obviously it's named after the node label.  If I read
> Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> correctly, that's how it is supposed to be named?
> 

That's from the i read from the documentation as well.

How is user space supposed to get function and/or color from the led? I don't 
see it exposed in user space - apart from the directory name (label) in the 
leds-gpio example.

This is what I get in sysfs for the multicolor led with the lpg driver:

    brightness
    device -> ../../../fc4cf000.spmi:pm8941@1:lpg
    max_brightness
    multi_index
    multi_intensity
    power
    subsystem -> ../../../../../../../../../class/leds
    trigger
    uevent


> > What's further confusing me is that include/dt-bindings/leds/common.h
> > states (reformatted for clarity):
> > 
> > /* For multicolor LEDs */
> > #define LED_COLOR_ID_MULTI	8
> > 
> > /* For multicolor LEDs that can do arbitrary color, so this would include
> > RGBW and similar */
> > #define LED_COLOR_ID_RGB	9
> > 
> > It sounds like these comments are the wrong way around as it says that RGB
> > does RGBW & others while MULTI is normal RGB?
> > 

Based on Pavel's reply my RGB LED should be _ID_RGB.
It would be great if this comment would be clarified because honestly still 
don't know what "arbitrary color" should mean; and add an example to the 
_ID_MULTI one that it only should be used for "strange stuff like Blue-UV 
combination".

> > I have also found this commit[1] while browsing through lkml which seems
> > to
> > validate my suspicions that _ID_RGB should be used normally? This commit
> > seems have been applied early September but hasn't been merged in the
> > 5.10 merge window?
> > 
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git/
> > commit/?h=for-next&id=3d93edc77515c6f51fa9bbbe2185e2ec32bad024
> > 
> > But drivers/leds/led-core.c also states "We want to label LEDs that can
> > produce full range of colors as RGB, not multicolor" - not sure what "full
> > range" means here.
> > 
> > Thanks for reading through my long email and I'd appreciate any
> > clarification on the situation!
> 
> I just read
> https://www.kernel.org/doc/html/latest/leds/leds-class-multicolor.html
> and apart from formatting and inter-doc-link issues due to not used
> markup features, I can understand how it's supposed to be used from
> userspace.
> 

Even in the doc the directory name is "multicolor:status" exposing color & 
function..

Curiously when setting the (deprecated) property "label" to "rgb:status" the 
directory name in sysfs becomes rgb:status - so is it a bug that this doesn't 
happen automatically? Feels like it at least.

I've looked into the code yesterday a bit and found that "struct led_init_data 
*init_data" in led_classdev_register_ext is always passed as NULL for 
multicolor leds from devm_led_classdev_multicolor_register which seems to 
cause this to happen.

> However, multicolor is still quite new, maybe drivers/leds/TODO gives
> some hints?  It seems to me some open issues are already known. ;-)
> 
> HTH & Greets
> Alex

Regards
Luca


