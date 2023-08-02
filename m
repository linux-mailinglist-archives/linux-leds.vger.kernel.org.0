Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED7B976D376
	for <lists+linux-leds@lfdr.de>; Wed,  2 Aug 2023 18:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229926AbjHBQNw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 2 Aug 2023 12:13:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbjHBQNv (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Aug 2023 12:13:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A40CF1995
        for <linux-leds@vger.kernel.org>; Wed,  2 Aug 2023 09:13:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 423AD61A33
        for <linux-leds@vger.kernel.org>; Wed,  2 Aug 2023 16:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D36BCC433C9;
        Wed,  2 Aug 2023 16:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690992829;
        bh=e/Cr1Jt+1knnUyxdfwbmAmYTgQiujLj/7NfqmjQLFNc=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=nGqdwsK5wY3Qyk3Z9QuZUc0zgirYz+aQpdmx9skrGwfloR7q4hpYZdv9Mn/nqhvHG
         uMCOuN0+Rm05Lfis6K9Cwrc9ocFi1/JOr1JeFTmn1XOR0dNbf9Tt66SvYG8o1mT6dn
         iL2FukAsRx82Sr7zmR89nzzFk1tlwkEtJHokN/IGtELCPdMHEeCdqn6LWXw8fI4cOc
         aDBU/R8gxJwQOV0Ltd93Gz92uwaNQwSj0D+klt8lkgLmCnR2zOJXRf/+KNg4E2g6kg
         /N0uDfU2cuvflB0lsH2EQGg6jLZb/ijR+FKXvW5NT7Hu0zbe7VbZEbv4A4WSkSR06E
         +/KqF+uBkfbew==
Date:   Wed, 2 Aug 2023 18:13:45 +0200
From:   Marek =?UTF-8?B?QmVow7pu?= <kabel@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH v3 5/6] leds: turris-omnia: support HW controlled mode
 via private trigger
Message-ID: <20230802181345.59d0b0bb@dellmb>
In-Reply-To: <20230802160748.11208-6-kabel@kernel.org>
References: <20230802160748.11208-1-kabel@kernel.org>
        <20230802160748.11208-6-kabel@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Wed,  2 Aug 2023 18:07:47 +0200
Marek Beh=C3=BAn <kabel@kernel.org> wrote:

> +static int omnia_hwtrig_activate(struct led_classdev *cdev)
> +{
> +	struct led_classdev_mc *mc_cdev =3D lcdev_to_mccdev(cdev);
> +	struct omnia_leds *leds =3D dev_get_drvdata(cdev->dev->parent);
> +	struct omnia_led *led =3D to_omnia_led(mc_cdev);
> +	int err =3D 0;
> +
> +	mutex_lock(&leds->lock);
> +
> +	if (!led->on) {
> +		/*
> +		 * If the LED is off (brightness was set to 0), the last
> +		 * configured color was not necessarily sent to the MCU.
> +		 * Recompute with max_brightness and send if needed.
> +		 */
> +		led_mc_calc_color_components(mc_cdev, cdev->max_brightness);
> +
> +		if (omnia_led_channels_changed(led))
> +			err =3D omnia_led_send_color_cmd(leds->client, led);
> +	}
> +
> +	if (!err) {
> +		/* put the LED into MCU controlled mode */
> +		err =3D omnia_cmd_write(leds->client, CMD_LED_MODE,
> +				      CMD_LED_MODE_LED(led->reg));
> +		if (!err)
> +			led->hwtrig =3D true;
> +	}
> +
> +	mutex_unlock(&leds->lock);
> +
> +	return err;
> +}

Pavel, Lee, here I wanted to ask: can the .activate() method of a LED
trigger sleep? The .brightness_set() method of a LED cannot sleep, and
therefore we have .brightness_set_blocking() method, which schedules
the potentially sleeping call into a work. But there is no such
mechanism for the LED trigger .activate() method.

I looked at the LED core code, and it does not seem to me that
.activate() sleeping would cause issues, besides keeping trigger list
lock locked...

Note that previously none of the LED triggers in drivers/leds/trigger
sleeped in .activate(), but recently the ethernet PHY subsystem was
wired into the netdev trigger, which may cause the .activate() method
to do a PHY transfer, which AFAIK may sleep...

Marek
