Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4564A18ABD3
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2020 05:34:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbgCSEew (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Mar 2020 00:34:52 -0400
Received: from mail-proxyout-mua-31.websupport.eu ([37.9.172.181]:43792 "EHLO
        mail-proxyout-mua-31.websupport.eu" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725747AbgCSEew (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Thu, 19 Mar 2020 00:34:52 -0400
Received: from in-4.websupport.sk (unknown [10.10.2.104])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail-proxyout-mua-31.websupport.eu (Postfix) with ESMTPS id 622A0BCBE4;
        Thu, 19 Mar 2020 05:34:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=blackhole.sk;
        s=mail; t=1584592488;
        bh=9l+VehQwv5jdKK2y+29oltZnoZcGA6E/Y5qxCozFEdQ=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References;
        b=Dl30TD+tekbdX8mcbE0neVii7s8UydS1QSSNdJgFozk+eu7FyvE49JIPhFh/R4Ii6
         jjXyACl4PzXfYtW/CXrSE6g0ZQYRucGtxF2KP5sdQv6SXj7QsgnaOBSjCYBlBEZX8N
         GSuez4UMTN3ezV6oRA8P99GHkhwyuij3HR5muQOU=
Received: from localhost (otava-0257.koleje.cuni.cz [78.128.181.4])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kabel@blackhole.sk)
        by in-4.websupport.sk (Postfix) with ESMTPSA id 48jYwS0hhFz11Lty;
        Thu, 19 Mar 2020 05:34:48 +0100 (CET)
Date:   Thu, 19 Mar 2020 05:34:47 +0100
From:   Marek Behun <kabel@blackhole.sk>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
Subject: Re: turris omnia leds again: question
Message-ID: <20200319053447.2c96cb1f@blackhole.sk>
In-Reply-To: <325ae880-2325-e002-77e9-d853b84c6393@gmail.com>
References: <20200310183824.1e4ad91d@blackhole.sk>
        <8f481aa4-463c-30cc-df69-d1f630e848a2@gmail.com>
        <20200310232340.763cdaaa@blackhole.sk>
        <325ae880-2325-e002-77e9-d853b84c6393@gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed, 11 Mar 2020 11:59:07 +0100
Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:

> On 3/10/20 11:23 PM, Marek Behun wrote:
> > On Tue, 10 Mar 2020 22:48:09 +0100
> > Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:
> >   
> >> Hi Marek,
> >>
> >> On 3/10/20 6:38 PM, Marek Behun wrote:  
> >>> Hi,
> >>>
> >>> I am going to try to send driver for Omnia LEDs again. The last time
> >>> there was a problem: on 05/01/2019 Jacek wrote:
> >>>     
> >>>> I wonder if we're doing right merging this driver in this form.
> >>>> We break the rule one-led-class-device-per-one-channel. We don't
> >>>> have LED multi color support yet, so this should support RGB LEDs
> >>>> in the old manner. Or switch to using LED multi color class.    
> >>>     
> >>>> Once we will have LED multi color class, we will be able to add the
> >>>> support for it to the driver and make the driver configurable to be
> >>>> able to expose old interface or the LED multi color one.    
> >>>     
> >>>> Moreover, the bindings should use led-sources property for grouping
> >>>> three channels under single LED class device. This is certainly to be
> >>>> fixed.    
> >>>
> >>> So I am going to try to modify the driver so that each channel creates
> >>> one LED class device. Do I understand this correctly then, that this
> >>> way when there are three channels (RGB) on one LED, all the 3 device
> >>> tree nodes for should have the same reg property, but different
> >>> led-sources property? Eg:
> >>>
> >>>   led@0,0 {
> >>>     reg = <0>;
> >>>     led-sources = <0>;
> >>>     label = "omnia::heartbeat::red";
> >>>   };
> >>>
> >>>   led@0,1 {
> >>>     reg = <0>;
> >>>     led-sources = <1>;
> >>>     label = "omnia::heartbeat::green";
> >>>   };
> >>>
> >>>   led@0,2 {
> >>>     reg = <0>;
> >>>     led-sources = <2>;
> >>>     label = "omnia::heartbeat::blue";
> >>>   };
> >>>
> >>> Or did I misinterpret the led-sources property?    
> >>
> >> This is what I proposed back then, strangely that message wasn't
> >> archived by bots, or maybe it resides only in my outbox...
> >>
> >> --------------
> >>
> >> LED sub-node properties:
> >>  - reg :                Must be from 0x0 to 0xb, since there are 12 RGB
> >> LEDs on this
> >>                         controller.
> >>  - label :              (optional)
> >>    see Documentation/devicetree/bindings/leds/common.txt
> >>  - linux,default-trigger : (optional)
> >>    see Documentation/devicetree/bindings/leds/common.txt
> >>  - led-sources : Each child node should describe RGB LED it controls,
> >>                  by listing corresponding iout identifiers:
> >>         0 - RGB LED 0: red
> >>         1 - RGB LED 0: green
> >>         2 - RGB LED 0: blue
> >>         3 - RGB LED 1: red
> >>         4 - RGB LED 1: green
> >>         5 - RGB LED 1: blue
> >>         6 - RGB LED 2: red
> >>         7 - RGB LED 2: green
> >>         8 - RGB LED 2: blue
> >>         9 - RGB LED 3: red
> >>         10 - RGB LED 3: green
> >>         11 - RGB LED 3: blue
> >>     ... and list all the iouts, maybe other names will be more
> >>             appropriate for this device, feel free to propose something
> >>
> >>
> >>
> >> Example:
> >>
> >>         led-controller@2b {
> >>                 compatible = "cznic,turris-omnia-leds";
> >>                 reg = <0x2b>;
> >>                 #address-cells = <1>;
> >>                 #size-cells = <0>;
> >>
> >>                 led@0 {
> >>                         reg = <0x0>;
> >>                         label = "userB";
> >>                         linux,default-trigger = "heartbeat";
> >>                         led-sources = <0 1 2>;
> >>                 };
> >>
> >>                 led@1 {
> >>                         reg = <0x1>;
> >>                         label = "userA";
> >>                         led-sources = <3 4 5>;
> >>                 };
> >>
> >>                 led@2 {
> >>                         reg = <0x2>;
> >>                         label = "pci3";
> >>                         led-sources = <6 7 8>;
> >>                 };
> >>
> >>                 led@3 {
> >>                         reg = <0x3>;
> >>                         label = "pci2";
> >>                         led-sources = <9 10 11>;
> >>                 };
> >>                 ...
> >> --------------
> >>
> >>
> >> Of course now label should be replaced with color and function
> >> properties. I've just reviewed that patch set and realized that
> >> we agreed upon setting max_brightness to 1 for all LEDs, right?
> >>  
> > 
> > No, there were subsequent patches which added support for
> > max_brightness = 255.  
> 
> Right.
> 
> > So the driver will register one LED class device per node, with color
> > ID = WHITE. Once RGB LED class is merged, the driver can be remade, but
> > the device tree won't need to be changed.  
> 
> Device Tree will need to be changed to LED mc specific bindings,
> which at current state introduces one more level or nesting
> and LED_COLOR_ID_MULTI for the top level DT node.
> 
> And the driver will need to still support this approach as well
> as the new LED mc class.
> 

Hi Jacek,
I have used the led-sources in such a way that the user can either set
	led-sources = <0 1 2>;
	color = <LED_COLOR_ID_WHITE>;
in which case all three channels will be grouped into one led cdev,
or the user can use just one led-source, for example
	led-sources = <0>;
	color = <LED_COLOR_ID_RED>;
and in this case they can have one led cdev per channel.
Is this acceptable? Or should I just go with the WHITE approach?

In case that this is acceptable I wonder what should be the suggested
device-tree node naming and reg property, when using one led cdev per
channel, for example:
  led@1,0 {
	reg = <1>;
	led-sources = <3>;
	color = <LED_COLOR_ID_RED>;
  };
  led@1,1 {
	reg = <1>;
	led-sources = <4>;
	color = <LED_COLOR_ID_GREEN>;
  };
  led@1,2 {
	reg = <1>;
	led-sources = <5>;
	color = <LED_COLOR_ID_BLUE>;
  };
I don't think different nodes should have the same reg property. Should
in this case the reg property have two values?

Marek
