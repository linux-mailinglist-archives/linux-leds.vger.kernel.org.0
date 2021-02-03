Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BBB6D30E0D8
	for <lists+linux-leds@lfdr.de>; Wed,  3 Feb 2021 18:23:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232185AbhBCRXC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 3 Feb 2021 12:23:02 -0500
Received: from mail.nic.cz ([217.31.204.67]:43150 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232087AbhBCRWV (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Wed, 3 Feb 2021 12:22:21 -0500
Received: from localhost (unknown [IPv6:2a0e:b107:ae1:0:3e97:eff:fe61:c680])
        by mail.nic.cz (Postfix) with ESMTPSA id C0EA01420D5;
        Wed,  3 Feb 2021 18:21:37 +0100 (CET)
Date:   Wed, 3 Feb 2021 18:21:37 +0100
From:   Marek Behun <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Sven Schuchmann <schuchmann@schleissheimer.de>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] leds: lp50xx: add setting of default intensity from
 DT
Message-ID: <20210203182137.339f8470@nic.cz>
In-Reply-To: <20210203163555.GA23019@duo.ucw.cz>
References: <20210119105312.2636-1-schuchmann@schleissheimer.de>
        <20210203142940.GB12369@duo.ucw.cz>
        <DB8P190MB06348FC85033135BFC3EF5C4D9B49@DB8P190MB0634.EURP190.PROD.OUTLOOK.COM>
        <20210203163555.GA23019@duo.ucw.cz>
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WELCOMELIST,USER_IN_WHITELIST shortcircuit=ham
        autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 3 Feb 2021 17:35:55 +0100
Pavel Machek <pavel@ucw.cz> wrote:

> On Wed 2021-02-03 15:39:59, Sven Schuchmann wrote:
> > Hello Pavel,
> >   
> > > > In order to use a multicolor-led together with a trigger
> > > > from DT the led needs to have an intensity set to see something.
> > > > The trigger changes the brightness of the led but if there
> > > > is no intensity we actually see nothing.
> > > >
> > > > This patch adds the ability to set the default intensity
> > > > of each led so that it is turned on from DT.  
> > > 
> > > Do we need this to be configurable from device tree? Can we just set
> > > it to max or something?
> > > 
> > > Aha, this basically sets the initial color for LEDs the monochromatic
> > > triggers, right?  
> > 
> > Let me try to explain in other words: I have one RGB-LED
> > which consists of 3 Colors. Each of the three colors (Red, Green, Blue) you have
> > to define in the DT. For example this is my setup for one RGB-LED which I wanted
> > to show the heartbeat in Red (half intensity):
> > 
> >                                 multi-led@3 {
> >                                         #address-cells = <1>;
> >                                         #size-cells = <0>;
> >                                         reg = <0x3>;
> >                                         color = <LED_COLOR_ID_RGB>;
> > 
> >                                         linux,default-trigger = "heartbeat";
> >                                         function = LED_FUNCTION_HEARTBEAT;
> > 
> >                                         led-9 {
> >                                                 color = <LED_COLOR_ID_RED>;
> >                                                 default-intensity = <100>;
> >                                         };
> > 
> >                                         led-10 {
> >                                                 color = <LED_COLOR_ID_GREEN>;
> >                                         };
> > 
> >                                         led-11 {
> >                                                 color = <LED_COLOR_ID_BLUE>;
> >                                         };
> >                                 };
> > 
> > If I would not have the default-intensity I would actually see nothing,
> > since the intensity (which goes from 0-255) of each led is initialized with 0.
> > 
> > I hope I could clarify this a little more?  
> 
> Yes, sounds reasonable. Could we get default intensity of 100% on all
> channels if nothing else is specified?
> 
> Or maybe simply "if intensity is not specified, start with 100%, and
> use explicit =0 if other color is expected".
> 
> Best regards,
> 								Pavel

Is the property default-intensity documented in DT bindings?

Wouldn't it be better if the property was used in the multi-led node
instead of the channel node? I.e.
  multi-led@3 {
    color = <LED_COLOR_ID_RGB>;
    default-intensity = <100 0 0>;
  };
