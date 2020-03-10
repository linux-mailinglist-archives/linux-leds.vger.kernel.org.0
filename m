Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4527180B6C
	for <lists+linux-leds@lfdr.de>; Tue, 10 Mar 2020 23:23:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgCJWXp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 10 Mar 2020 18:23:45 -0400
Received: from mail-proxyout-mua-31.websupport.eu ([37.9.172.181]:47754 "EHLO
        mail-proxyout-mua-31.websupport.eu" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727506AbgCJWXo (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 10 Mar 2020 18:23:44 -0400
Received: from in-2.websupport.sk (unknown [10.10.2.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail-proxyout-mua-31.websupport.eu (Postfix) with ESMTPS id DB4CBC8526;
        Tue, 10 Mar 2020 23:23:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=blackhole.sk;
        s=mail; t=1583879021;
        bh=56TgmM6n4W2PfkWLBEfrAZ1o5/hFKpPcuWqV3Tg79Xc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References;
        b=KmChgfeqgpJ7RHa2l70WnhuYny6FB97w2UXch8KCo5CNdeHu1QcTweUJ+7pcYN5AJ
         vAWfrb2TpRULgmo78J0BbuRRCb6jEXsEgNYBqWWaqLFWttK8amO9YXUsmZTLAZP75G
         dFm8Ni4agys0ldYukTy72ggizwr7Dv4erpgTqt90=
Received: from localhost (otava-0257.koleje.cuni.cz [78.128.181.4])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kabel@blackhole.sk)
        by in-2.websupport.sk (Postfix) with ESMTPSA id 48cV3x2jzMz40XVw;
        Tue, 10 Mar 2020 23:23:41 +0100 (CET)
Date:   Tue, 10 Mar 2020 23:23:40 +0100
From:   Marek Behun <kabel@blackhole.sk>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     linux-leds@vger.kernel.org, Pavel Machek <pavel@ucw.cz>
Subject: Re: turris omnia leds again: question
Message-ID: <20200310232340.763cdaaa@blackhole.sk>
In-Reply-To: <8f481aa4-463c-30cc-df69-d1f630e848a2@gmail.com>
References: <20200310183824.1e4ad91d@blackhole.sk>
        <8f481aa4-463c-30cc-df69-d1f630e848a2@gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Tue, 10 Mar 2020 22:48:09 +0100
Jacek Anaszewski <jacek.anaszewski@gmail.com> wrote:

> Hi Marek,
> 
> On 3/10/20 6:38 PM, Marek Behun wrote:
> > Hi,
> > 
> > I am going to try to send driver for Omnia LEDs again. The last time
> > there was a problem: on 05/01/2019 Jacek wrote:
> >   
> >> I wonder if we're doing right merging this driver in this form.
> >> We break the rule one-led-class-device-per-one-channel. We don't
> >> have LED multi color support yet, so this should support RGB LEDs
> >> in the old manner. Or switch to using LED multi color class.  
> >   
> >> Once we will have LED multi color class, we will be able to add the
> >> support for it to the driver and make the driver configurable to be
> >> able to expose old interface or the LED multi color one.  
> >   
> >> Moreover, the bindings should use led-sources property for grouping
> >> three channels under single LED class device. This is certainly to be
> >> fixed.  
> > 
> > So I am going to try to modify the driver so that each channel creates
> > one LED class device. Do I understand this correctly then, that this
> > way when there are three channels (RGB) on one LED, all the 3 device
> > tree nodes for should have the same reg property, but different
> > led-sources property? Eg:
> > 
> >   led@0,0 {
> >     reg = <0>;
> >     led-sources = <0>;
> >     label = "omnia::heartbeat::red";
> >   };
> > 
> >   led@0,1 {
> >     reg = <0>;
> >     led-sources = <1>;
> >     label = "omnia::heartbeat::green";
> >   };
> > 
> >   led@0,2 {
> >     reg = <0>;
> >     led-sources = <2>;
> >     label = "omnia::heartbeat::blue";
> >   };
> > 
> > Or did I misinterpret the led-sources property?  
> 
> This is what I proposed back then, strangely that message wasn't
> archived by bots, or maybe it resides only in my outbox...
> 
> --------------
> 
> LED sub-node properties:
>  - reg :                Must be from 0x0 to 0xb, since there are 12 RGB
> LEDs on this
>                         controller.
>  - label :              (optional)
>    see Documentation/devicetree/bindings/leds/common.txt
>  - linux,default-trigger : (optional)
>    see Documentation/devicetree/bindings/leds/common.txt
>  - led-sources : Each child node should describe RGB LED it controls,
>                  by listing corresponding iout identifiers:
>         0 - RGB LED 0: red
>         1 - RGB LED 0: green
>         2 - RGB LED 0: blue
>         3 - RGB LED 1: red
>         4 - RGB LED 1: green
>         5 - RGB LED 1: blue
>         6 - RGB LED 2: red
>         7 - RGB LED 2: green
>         8 - RGB LED 2: blue
>         9 - RGB LED 3: red
>         10 - RGB LED 3: green
>         11 - RGB LED 3: blue
>     ... and list all the iouts, maybe other names will be more
>             appropriate for this device, feel free to propose something
> 
> 
> 
> Example:
> 
>         led-controller@2b {
>                 compatible = "cznic,turris-omnia-leds";
>                 reg = <0x2b>;
>                 #address-cells = <1>;
>                 #size-cells = <0>;
> 
>                 led@0 {
>                         reg = <0x0>;
>                         label = "userB";
>                         linux,default-trigger = "heartbeat";
>                         led-sources = <0 1 2>;
>                 };
> 
>                 led@1 {
>                         reg = <0x1>;
>                         label = "userA";
>                         led-sources = <3 4 5>;
>                 };
> 
>                 led@2 {
>                         reg = <0x2>;
>                         label = "pci3";
>                         led-sources = <6 7 8>;
>                 };
> 
>                 led@3 {
>                         reg = <0x3>;
>                         label = "pci2";
>                         led-sources = <9 10 11>;
>                 };
>                 ...
> --------------
> 
> 
> Of course now label should be replaced with color and function
> properties. I've just reviewed that patch set and realized that
> we agreed upon setting max_brightness to 1 for all LEDs, right?
> 

No, there were subsequent patches which added support for
max_brightness = 255.

So the driver will register one LED class device per node, with color
ID = WHITE. Once RGB LED class is merged, the driver can be remade, but
the device tree won't need to be changed.

Marek
