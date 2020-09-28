Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA1627AC68
	for <lists+linux-leds@lfdr.de>; Mon, 28 Sep 2020 13:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgI1LFN (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 28 Sep 2020 07:05:13 -0400
Received: from mail.thorsis.com ([92.198.35.195]:58959 "EHLO mail.thorsis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726564AbgI1LFN (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 28 Sep 2020 07:05:13 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.thorsis.com (Postfix) with ESMTP id ECF36356D;
        Mon, 28 Sep 2020 13:05:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
        by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id SFeq2_G8OJ3c; Mon, 28 Sep 2020 13:05:11 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
        id C896B36BC; Mon, 28 Sep 2020 13:05:11 +0200 (CEST)
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NO_RECEIVED,
        NO_RELAYS autolearn=unavailable autolearn_force=no version=3.4.2
From:   Alexander Dahl <ada@thorsis.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Alexander Dahl <post@lespocky.de>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        linux-kernel@vger.kernel.org,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Marek =?ISO-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>,
        Denis Osterland-Heim <denis.osterland@diehl.com>
Subject: Re: [PATCH v5 1/3] leds: pwm: Remove platform_data support
Date:   Mon, 28 Sep 2020 13:04:59 +0200
Message-ID: <11962635.BNa8PrgvAO@ada>
In-Reply-To: <20200919094418.GC12294@duo.ucw.cz>
References: <20200919053145.7564-1-post@lespocky.de> <20200919053145.7564-2-post@lespocky.de> <20200919094418.GC12294@duo.ucw.cz>
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hello Pavel,

Am Samstag, 19. September 2020, 11:44:18 CEST schrieb Pavel Machek:
> > Since commit 141f15c66d94 ("leds: pwm: remove header") that platform
> > interface is not usable from outside and there seems to be no in tree
> > user anymore.  All in-tree users of the leds-pwm driver seem to use DT
> > currently.  Getting rid of the old platform interface will allow the
> > leds-pwm driver to switch over from 'devm_led_classdev_register()' to
> > 'devm_led_classdev_register_ext()' later.
> > 
> > @@ -61,6 +56,7 @@ static int led_pwm_set(struct led_classdev *led_cdev,
> > 
> >  	return pwm_apply_state(led_dat->pwm, &led_dat->pwmstate);
> >  
> >  }
> > 
> > +__attribute__((nonnull))
> > 
> >  static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
> >  
> >  		       struct led_pwm *led, struct fwnode_handle *fwnode)
> >  
> >  {
> 
> This normally goes elsewhere -- right? I'd expect:
> 
> 
>   static int led_pwm_add(struct device *dev, struct led_pwm_priv *priv,
>   		       struct led_pwm *led, struct fwnode_handle *fwnode)
> 	  __attribute__((nonnull))

I found both variants in kernel code.  I can live with both variants and have 
no strong preference.

My initial intention to add it was to get a compiler warning in case someone 
does not pass a fwnode here, e.g. when using that old platform_data approach 
(which is supposed to be removed with this patch).  You might call it a self 
check on my own changes.  I can also drop that attribute if you don't want 
that kind of stuff in linux-leds.

Greets
Alex



