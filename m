Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD1FF22EB15
	for <lists+linux-leds@lfdr.de>; Mon, 27 Jul 2020 13:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728199AbgG0LVs (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 27 Jul 2020 07:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726324AbgG0LVs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Jul 2020 07:21:48 -0400
Received: from mail.nic.cz (lists.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9F42C061794
        for <linux-leds@vger.kernel.org>; Mon, 27 Jul 2020 04:21:47 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTPSA id 2DFF3140AF5;
        Mon, 27 Jul 2020 13:21:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1595848905; bh=hGe9sQsPz3syvKssPT6fvb7JFcpDqe8w+vx9ccQ37EU=;
        h=Date:From:To;
        b=nJUvOMiMN5loeUJhWY62FH3m1TTOuRdtTqtSaHgXjik2nHhswlNt81lbBbkiKqJGn
         xWs3LlJje90rptb2eILj3A95DgrP8cmssSCzf7DiCuMi6cZeeDBGJJ87H/aeYstbXl
         T/6Ktkda5O6oCUr4K+UtzwWAWQ1zwEh37HliOB6s=
Date:   Mon, 27 Jul 2020 13:21:44 +0200
From:   Marek =?ISO-8859-1?Q?Beh=FAn?= <marek.behun@nic.cz>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     jacek.anaszewski@gmail.com, dmurphy@ti.com,
        linux-leds@vger.kernel.org
Subject: Re: We have multicolor, but should we turn it into RGB?
Message-ID: <20200727132144.2ba06aea@dellmb.labs.office.nic.cz>
In-Reply-To: <20200727105226.GA17807@amd>
References: <20200727084500.GA15237@amd>
        <20200727114048.32f36c59@dellmb.labs.office.nic.cz>
        <20200727105226.GA17807@amd>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-100.0 required=5.9 tests=SHORTCIRCUIT,
        USER_IN_WHITELIST shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, 27 Jul 2020 12:52:26 +0200
Pavel Machek <pavel@ucw.cz> wrote:

> Hi!
> 
> > > Multicolor is a bit too abstract. Yes, we can have
> > > Green-Magenta-Ultraviolet LED, but so far all the LEDs we support
> > > are RGB, and not even RGB-White or RGB-Yellow variants emerged.
> > > 
> > > Multicolor is not a good fit for RGB LED. It does not really know
> > > about LED color.  In particular, there's no way to make LED
> > > "white".
> > > 
> > > Userspace is interested in knowing "this LED can produce arbitrary
> > > color", which not all multicolor LEDs can.
> > > 
> > > 	Proposal: let's add "rgb" to led_colors in
> > > 	drivers/leds/led-core.c, add corresponding device tree
> > > 	defines, and use that, instead of multicolor for RGB LEDs.
> > > 
> > > 	We really need to do that now; "white" stuff can wait.
> > > 
> > > RGB LEDs are quite common, and it would be good to be able to
> > > turn LED white and to turn it into any arbitrary color. It is
> > > essential that userspace is able to set arbitrary colors, and it
> > > might be good to have that ability from kernel, too... to allow
> > > full-color triggers.
> > > 
> > > Best regads,
> > > 									Pavel
> > >  
> > 
> > I am not against adding RGB if you want to somehow teach the
> > subsystem to mix arbitrary color (either by teaching it color
> > curves or some other way). But I think we shouldn't remove
> > multicolor, and here's the reason why:  
> 
> Something like this?
> 
> diff --git
> a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> index b55e1f1308a4..e820040a09d9 100644 ---
> a/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> +++
> b/Documentation/devicetree/bindings/leds/leds-class-multicolor.yaml
> @@ -25,11 +25,15 @@ patternProperties: description: Represents the
> LEDs that are to be grouped. properties: color:
> -        const: 8  # LED_COLOR_ID_MULTI
> +        minimum: 8  # LED_COLOR_ID_MULTI
> +	maximum: 9  # LED_COLOR_ID_RGB
>          description: |
> -          For multicolor LED support this property should be defined
> as
> +          For non-RGB multicolor LEDs this property should be
> defined as LED_COLOR_ID_MULTI which can be found in
> include/linux/leds/common.h. 
> +	  For LEDs that can display arbitrary color (RGB, RGBW,
> etc), this
> +	  property should be defined as LED_COLOR_ID_RGB.
> +
>      $ref: "common.yaml#"
>  
>      required:
> diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
> index 846248a0693d..a6dce01dbd5e 100644
> --- a/drivers/leds/led-core.c
> +++ b/drivers/leds/led-core.c
> @@ -35,6 +35,7 @@ const char * const led_colors[LED_COLOR_ID_MAX] = {
>  	[LED_COLOR_ID_YELLOW] = "yellow",
>  	[LED_COLOR_ID_IR] = "ir",
>  	[LED_COLOR_ID_MULTI] = "multicolor",
> +	[LED_COLOR_ID_RGB] = "rgb",
>  };
>  EXPORT_SYMBOL_GPL(led_colors);
>  
> diff --git a/drivers/leds/leds-lp55xx-common.c
> b/drivers/leds/leds-lp55xx-common.c index af14e2b2d577..56210f4ad919
> 100644 --- a/drivers/leds/leds-lp55xx-common.c
> +++ b/drivers/leds/leds-lp55xx-common.c
> @@ -638,7 +638,7 @@ static int lp55xx_parse_logical_led(struct
> device_node *np, if (ret)
>  		return ret;
>  
> -	if (led_color == LED_COLOR_ID_MULTI)
> +	if (led_color == LED_COLOR_ID_RGB)
>  		return lp55xx_parse_multi_led(np, cfg, child_number);
>  
>  	ret =  lp55xx_parse_common_child(np, cfg, child_number,
> &chan_nr); diff --git a/drivers/leds/leds-turris-omnia.c
> b/drivers/leds/leds-turris-omnia.c index bb23d8e16614..5c360632170a
> 100644 --- a/drivers/leds/leds-turris-omnia.c
> +++ b/drivers/leds/leds-turris-omnia.c
> @@ -94,15 +94,15 @@ static int omnia_led_register(struct i2c_client
> *client, struct omnia_led *led, dev_warn(dev,
>  			 "Node %pOF: must contain 'reg' property
> with values between 0 and %i\n", np, OMNIA_BOARD_LEDS - 1);
> -		return 0;
> +		return 0; /* FIXME: should return 0/errrno */
>  	}
>  
>  	ret = of_property_read_u32(np, "color", &color);
> -	if (ret || color != LED_COLOR_ID_MULTI) {
> +	if (ret || color != LED_COLOR_ID_RGB) {
>  		dev_warn(dev,
> -			 "Node %pOF: must contain 'color' property
> with value LED_COLOR_ID_MULTI\n",
> +			 "Node %pOF: must contain 'color' property
> with value LED_COLOR_ID_RGB\n", np);
> -		return 0;
> +		return 0; /* FIXME: should return 0/errrno */
>  	}
>  
>  	led->subled_info[0].color_index = LED_COLOR_ID_RED;
> @@ -145,7 +145,7 @@ static int omnia_led_register(struct i2c_client
> *client, struct omnia_led *led, return ret;
>  	}
>  
> -	return 1;
> +	return 1; /* FIXME: should return 0/errrno */
>  }
>  
>  /*
> diff --git a/include/dt-bindings/leds/common.h
> b/include/dt-bindings/leds/common.h index a463ce6a8794..52b619d44ba2
> 100644 --- a/include/dt-bindings/leds/common.h
> +++ b/include/dt-bindings/leds/common.h
> @@ -30,8 +30,10 @@
>  #define LED_COLOR_ID_VIOLET	5
>  #define LED_COLOR_ID_YELLOW	6
>  #define LED_COLOR_ID_IR		7
> -#define LED_COLOR_ID_MULTI	8
> -#define LED_COLOR_ID_MAX	9
> +#define LED_COLOR_ID_MULTI	8	/* For multicolor LEDs */
> +#define LED_COLOR_ID_RGB	9	/* For multicolor LEDs that
> can do arbitrary color,
> +					   so this would include
> RGBW and similar */ +#define LED_COLOR_ID_MAX	10
>  
>  /* Standard LED functions */
>  /* Keyboard LEDs, usually it would be input4::capslock etc. */
> 
> 

Yes, if you want to have RGB as a special case of multicolor so that in
the future we can work on color curves or something, this could work.

Marek
