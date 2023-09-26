Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF7C57AEDC1
	for <lists+linux-leds@lfdr.de>; Tue, 26 Sep 2023 15:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbjIZNKw (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 26 Sep 2023 09:10:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234789AbjIZNKu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 26 Sep 2023 09:10:50 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCD2E10E
        for <linux-leds@vger.kernel.org>; Tue, 26 Sep 2023 06:10:43 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-405361bb9f7so88238385e9.2
        for <linux-leds@vger.kernel.org>; Tue, 26 Sep 2023 06:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695733842; x=1696338642; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gUb8ILoSgQFCLFSqMOXdU7OSCDKaDGHaYb2wQZ5A7J8=;
        b=XynLUSsP+m2kqkkoUMuXe2Gxvl37narI78SLbxBtHplKza8Q5BXwE5TnbWOSK1iVnP
         G8V5H6TBaNKdyRRCGVE2sivsBv7Pnjh0zyIlXoZBtR2S4Xepe5/b04p4l524cjZhu9zy
         KLJ6T1ugbCZyRU2nsCQdcBXf9r4nKEsEOA3QdJm/2b0lvp5LpM/ZNsooyzv0vJlQjhz/
         FgxweQ733/Bn4bROQY5qaeGTju+zvOwdPJpYWhAMcopZL+HltwMHeDFONOjh58PlkCeW
         KbHpYA6mH4StKYXJk9nHX83DISi3skSYgN3XaHQBkxxGvRLzUAWRsl/yhfEFfUo0No14
         dUhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695733842; x=1696338642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gUb8ILoSgQFCLFSqMOXdU7OSCDKaDGHaYb2wQZ5A7J8=;
        b=uLGG5pX5uk6w7TXyBfgGXKW/n/e9hS1yZsLjII2rYJHCCdJWcYmTOjX9akpXaTqHH6
         XxNRPkahshqP6KBNglJ/9DL6ZkhD6b+UZW41KruEzIkPXMUncjvQSoPdSujpQzrf+BV4
         88ueOyZhe+8NxES3kXu+lzyRD0TGb3N9cl1KVoCOXiVRPbllbZw12vIOLuAhgq20F2Oe
         mMxJjT68Nm8I4C3lgCkHfLQ2VSLGw/t+CYb6KzYd5LJc2LJ9YxXawVwlrF15XBC93BDz
         ofZf7PX/cBody2YOXS4hA3gDs3TclNCu0KbXSgMk1Urbr+3L4pZPj/Bs2Mo29uoNLKSK
         6+gA==
X-Gm-Message-State: AOJu0YyknWj7dMWeWtp9w2duyBL21V5MjGDndVIBgFEPv9wnEOQdL/wa
        4DWRM2ImgdzsIkWguFCgfWRcuw==
X-Google-Smtp-Source: AGHT+IGeSiQ3WveeVgUpyC7fww+V4WeYYuKrHSsckzOgpEr82JSyPAjlpUwHyvObx/ZUX2OzY5V6rg==
X-Received: by 2002:a05:600c:2489:b0:405:3dbc:8821 with SMTP id 9-20020a05600c248900b004053dbc8821mr8955020wms.22.1695733842083;
        Tue, 26 Sep 2023 06:10:42 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id j13-20020adfd20d000000b003232c2109cbsm4788764wrh.7.2023.09.26.06.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 06:10:41 -0700 (PDT)
Date:   Tue, 26 Sep 2023 14:10:39 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Flavio Suligoi <f.suligoi@asem.it>
Cc:     Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Helge Deller <deller@gmx.de>, Pavel Machek <pavel@ucw.cz>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] backlight: mp3309c: Add support for MPS MP3309C
Message-ID: <20230926131039.GC4356@aspen.lan>
References: <20230925122609.78849-1-f.suligoi@asem.it>
 <20230925122609.78849-2-f.suligoi@asem.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230925122609.78849-2-f.suligoi@asem.it>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Mon, Sep 25, 2023 at 02:26:09PM +0200, Flavio Suligoi wrote:
> diff --git a/drivers/video/backlight/mp3309c.c b/drivers/video/backlight/mp3309c.c
> new file mode 100644
> index 000000000000..923ac7f7b291
> --- /dev/null
> +++ b/drivers/video/backlight/mp3309c.c
> @@ -0,0 +1,398 @@
> ...
> +static int mp3309c_bl_update_status(struct backlight_device *bl)
> +{
> +	struct mp3309c_chip *chip = bl_get_data(bl);
> +	int brightness = backlight_get_brightness(bl);
> +	struct pwm_state pwmstate;
> +	unsigned int analog_val, bits_val;
> +	int i, ret;
> +
> +	if (chip->pdata->dimming_mode == DIMMING_PWM) {
> +		/*
> +		 * PWM dimming mode
> +		 */
> +		pwm_get_state(chip->pwmd, &pwmstate);
> +		pwm_set_relative_duty_cycle(&pwmstate, brightness,
> +					    chip->pdata->max_brightness);
> +		pwmstate.enabled = true;
> +		ret = pwm_apply_state(chip->pwmd, &pwmstate);
> +		if (ret)
> +			return ret;
> +
> +		switch (chip->pdata->status) {
> +		case FIRST_POWER_ON:
> +		case BACKLIGHT_OFF:
> +			/*
> +			 * After 20ms of low pwm signal level, the chip turns
> +			   off automatically. In this case, before enabling the
> +			   chip again, we must wait about 10ms for pwm signal to
> +			   stabilize.
> +			 */
> +			if (brightness > 0) {
> +				msleep(10);
> +				mp3309c_enable_device(chip);
> +				chip->pdata->status = BACKLIGHT_ON;
> +			} else {
> +				chip->pdata->status = BACKLIGHT_OFF;
> +			}
> +			break;
> +		case BACKLIGHT_ON:
> +			if (brightness == 0)
> +				chip->pdata->status = BACKLIGHT_OFF;
> +			break;
> +		}
> +	} else {
> +		/*
> +		 * Analog dimming (by I2C command) dimming mode
> +		 *
> +		 * The first time, before setting brightness, we must enable the
> +		 * device
> +		 */
> +		if (chip->pdata->status == FIRST_POWER_ON)
> +			mp3309c_enable_device(chip);
> +
> +		/*
> +		 * Dimming mode I2C command
> +		 *
> +		 * The 5 bits of the dimming analog value D4..D0 is allocated
> +		 * in the I2C register #0, in the following way:
> +		 *
> +		 *     +--+--+--+--+--+--+--+--+
> +		 *     |EN|D0|D1|D2|D3|D4|XX|XX|
> +		 *     +--+--+--+--+--+--+--+--+
> +		 */
> +		analog_val = DIV_ROUND_UP(ANALOG_MAX_VAL * brightness,
> +					  chip->pdata->max_brightness);

Sorry to only notice after sharing a Reviewed-by:[1] but...

Scaling brightness here isn't right. When running in I2C dimming mode then
max_brightness *must* be 31 or lower, meaning the value in brightness can
be applied directly to the hardware without scaling.

Quoting the DT binding docs about how max-brightness should be
interpretted:

  Normally the maximum brightness is determined by the hardware and this
  property is not required. This property is used to put a software
  limit on the brightness apart from what the driver says, as it could
  happen that a LED can be made so bright that it gets damaged or causes
  damage due to restrictions in a specific system, such as mounting
  conditions.


Daniel.


[1] I remember checking if this code could overflow the field but I was
    so distracted by that I ended up missing the obvious!
