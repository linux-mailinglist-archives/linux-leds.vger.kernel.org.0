Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A63B83388A1
	for <lists+linux-leds@lfdr.de>; Fri, 12 Mar 2021 10:27:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232844AbhCLJ0v convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-leds@lfdr.de>); Fri, 12 Mar 2021 04:26:51 -0500
Received: from lists.nic.cz ([217.31.204.67]:53382 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232933AbhCLJ0X (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Fri, 12 Mar 2021 04:26:23 -0500
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id 5CBFE1408E5;
        Fri, 12 Mar 2021 10:26:21 +0100 (CET)
Date:   Fri, 12 Mar 2021 10:26:20 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH] dt-bindings: leds: leds-gpio: fix & extend node regex
Message-ID: <20210312102620.1307e7de@nic.cz>
In-Reply-To: <f9fc4dce-5b9c-5aff-e317-f2daabb73931@gmail.com>
References: <20210310070025.9150-1-zajec5@gmail.com>
        <20210312084414.7e4822bb@nic.cz>
        <62b556d5-0ebd-0923-69c6-a2fa3ede73b2@gmail.com>
        <20210312092336.5cbd10cb@nic.cz>
        <f9fc4dce-5b9c-5aff-e317-f2daabb73931@gmail.com>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,URIBL_BLOCKED,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri, 12 Mar 2021 10:12:26 +0100
Rafał Miłecki <zajec5@gmail.com> wrote:

> On 12.03.2021 09:23, Marek Behun wrote:
> > On Fri, 12 Mar 2021 08:52:16 +0100
> > Rafał Miłecki <zajec5@gmail.com> wrote:
> >   
> >> On 12.03.2021 08:44, Marek Behun wrote:  
> >>> On Wed, 10 Mar 2021 08:00:25 +0100
> >>> Rafał Miłecki <zajec5@gmail.com> wrote:
> >>>      
> >>>> From: Rafał Miłecki <rafal@milecki.pl>
> >>>>
> >>>> The old regex allowed only 1 character to follow the "led-" prefix which
> >>>> was most likely just an overlook. Fix it and while at it allow dashes in
> >>>> node names. It allows more meaningful names and it helpful e.g. when
> >>>> having the same function name with 2 different colors. For example:
> >>>> 1. led-power-white
> >>>> 2. led-power-blue
> >>>>
> >>>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> >>>> ---
> >>>>    Documentation/devicetree/bindings/leds/leds-gpio.yaml | 2 +-
> >>>>    1 file changed, 1 insertion(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/leds/leds-gpio.yaml b/Documentation/devicetree/bindings/leds/leds-gpio.yaml
> >>>> index 7ad2baeda0b0..ae46a43e480f 100644
> >>>> --- a/Documentation/devicetree/bindings/leds/leds-gpio.yaml
> >>>> +++ b/Documentation/devicetree/bindings/leds/leds-gpio.yaml
> >>>> @@ -21,7 +21,7 @@ properties:
> >>>>    patternProperties:
> >>>>      # The first form is preferred, but fall back to just 'led' anywhere in the
> >>>>      # node name to at least catch some child nodes.
> >>>> -  "(^led-[0-9a-f]$|led)":
> >>>> +  "(^led-[0-9a-f][0-9a-f-]*$|led)":  
> >>>
> >>> Why not use +, like everywhere else?
> >>>     "(^led-[0-9a-f]+$|led)"  
> >>
> >> 1. Your regex doesn't allow dashes. I described that in commit message.  
> > 
> > Ah, I confess I did not read the commit message. My fault.
> >   
> >> 2. If I use one range and +, that will allow unwanted names like "led--power"  
> > 
> > But this can happen anyway. Your regex will match for example
> > "led-deaf------beef".  
> 
> You're right. I probably was overthinking that ;)
> 
> 
> > Moreover you give as an example names
> >    led-power-white
> >    led-power-blue
> > but the regex only allows hexadecimal characters, ie
> >    led-dead-beef
> >    led-1f-3
> > 
> > The idea is that the string after "led-" is a hexadecimal address.
> > Names like
> >    led-power-white
> > shouldn't be used, as far as I understand.  
> 
> Oops!
> 1. My regex was meant to be [0-9][a-z-][0-9][a-z-]+
> 2. I totally missed that nodename should contain hex num and not a name
> 
> My patch is based on bad binding understanding.
> 
> 
> So as I understand it now, the point of led hex number is to enumerate
> nodes. That way we avoid:
> ERROR (duplicate_node_names): /leds/led: Duplicate node name
> 
> 
> I'm just wondering if there is some cleaner solution than using those
> led-0, led-1, led-2, led-3, led-4 (...) names.
> 
> Would that be acceptable to use address with GPIO number? Example:
> 
> leds {
> 	compatible = "gpio-leds";
> 	led@6 {
> 		gpios = <&mpc8572 6 GPIO_ACTIVE_HIGH>;
> 		color = <LED_COLOR_ID_RED>;
> 	};
> 	led@7 {
> 		gpios = <&mpc8572 7 GPIO_ACTIVE_HIGH>;
> 		color = <LED_COLOR_ID_GREEN>;
> 	};
> };

I don't know. This is a question for Rob Herring.
But why is led-0, led-1, led-2 not good enough?
You can still define function via the function property:
 led-7 {
   gpios = <&mpc8572 7 GPIO_ACTIVE_HIGH>;
   color = <LED_COLOR_ID_GREEN>;
   function = LED_FUNCTION_POWER;
 };
