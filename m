Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EDD90754E09
	for <lists+linux-leds@lfdr.de>; Sun, 16 Jul 2023 11:19:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbjGPJTp (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 16 Jul 2023 05:19:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjGPJTn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 16 Jul 2023 05:19:43 -0400
Received: from jabberwock.ucw.cz (jabberwock.ucw.cz [46.255.230.98])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB21BB9
        for <linux-leds@vger.kernel.org>; Sun, 16 Jul 2023 02:19:42 -0700 (PDT)
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 66B8C1C0DC0; Sun, 16 Jul 2023 11:19:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
        t=1689499181;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=KGRnUWSOrF4xbLGBV4fkGSEh84VbSJE45mJ4uNCJAbQ=;
        b=TTvrrknLzpzo7/lockp8w0OtXyNsKK6WrqDDRErOqNV452SM1tp7tZ0AhgWHzY64DNBwyR
        bmbmdgETBAqIkpvdvejCB8yFsLCspyQIOjYfXKZs+ve3PUPt0+BT72Y8PLXLedHu0J935S
        ZDMh3MK0nm7f0j9rwA819W4cTQguQbM=
Date:   Sun, 16 Jul 2023 11:19:40 +0200
From:   Pavel Machek <pavel@ucw.cz>
To:     Marek Beh??n <kabel@kernel.org>
Cc:     linux-leds@vger.kernel.org, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v2 2/3] leds: turris-omnia: initialize multi-intensity to
 full
Message-ID: <20230716091940.GB1182@bug>
References: <20230714085253.13544-1-kabel@kernel.org>
 <20230714085253.13544-3-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230714085253.13544-3-kabel@kernel.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Fri 2023-07-14 10:52:52, Marek Beh??n wrote:
> The default color of each LED before driver probe is (255, 255, 255).
> Initialize multi_intensity to this value, so that it corresponds to the
> reality.
> 
> Signed-off-by: Marek Beh??n <kabel@kernel.org>

Reviewed-by: Pavel Machek <pavel@ucw.cz>

> +++ b/drivers/leds/leds-turris-omnia.c
> @@ -98,10 +98,13 @@ static int omnia_led_register(struct i2c_client *client, struct omnia_led *led,
>  	}
>  
>  	led->subled_info[0].color_index = LED_COLOR_ID_RED;
> +	led->subled_info[0].intensity = 255;
>  	led->subled_info[0].channel = 0;
>  	led->subled_info[1].color_index = LED_COLOR_ID_GREEN;
> +	led->subled_info[1].intensity = 255;
>  	led->subled_info[1].channel = 1;
>  	led->subled_info[2].color_index = LED_COLOR_ID_BLUE;
> +	led->subled_info[2].intensity = 255;
>  	led->subled_info[2].channel = 2;
>  
>  	led->mc_cdev.subled_info = led->subled_info;
> -- 
> 2.41.0

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
