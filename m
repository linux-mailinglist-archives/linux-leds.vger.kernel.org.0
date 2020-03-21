Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD2518E3D2
	for <lists+linux-leds@lfdr.de>; Sat, 21 Mar 2020 19:55:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727224AbgCUSzV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 21 Mar 2020 14:55:21 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:51899 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727015AbgCUSzU (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 21 Mar 2020 14:55:20 -0400
Received: by mail-wm1-f66.google.com with SMTP id c187so9992669wme.1
        for <linux-leds@vger.kernel.org>; Sat, 21 Mar 2020 11:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=NVez25h8GjYvE6vhiUTIuWIqsNnT5tt1WKiWJBFTnYA=;
        b=GzC4FWSXxsJbccihHyBRwHmslBh15jepqnKscvMvsZOUXhtwTZod6B9i/NWr2aqAam
         N2xi3lKjM0bLvZWF97qdgMAiqishtTan0AI8wb0PxDmhEc87Xv/LzrfDygLSfzr9R7Wc
         A0MY1OL5+Jl+OnKUkqr8SC5M6uETcDOQ8MtUVbaT+5wpn7tdA638dArp4d0pzPZ04iAM
         ATIqRUI7T/XChNr0kYKea2qPdfs0z706UkYVqas5L7LE9u9iWK0LW/sX00DqzvD8EyFR
         7MjrnSswxxtpt/3bI7yZ4jtNhZSDusZjlCqbvl5+b9raZGQ4dS3aBM7lkv+Pjwuq0a5j
         zdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=NVez25h8GjYvE6vhiUTIuWIqsNnT5tt1WKiWJBFTnYA=;
        b=FInk2fHx5unOzsjPzlZHi2LpC8Q5Wx9IHBdZ4Lw+PKfuU+r6aqLATzvC6p2uRYrIhR
         7FadwYbWkgfiKCxqi/gkgyNioL/ilwVcMkU1bdut04hcVnQ/HYjDdCpFCeq9+fcGS8GF
         S0PZjN2nWegBb6DZzRATWxIu8oAKftvF/eh2vtw+orMeqQs9JL3D2WICEpAkLBYOWIjQ
         5UCQWj7o/MLq1dHRtiz/EaS/ET66STK7Vk3tLs4Rr/m7DrRPAd3e5jaTi+gpmgzjP/Zk
         soAO7ZnTI+URVGaS1ETJq0n9PfKeUwWduvyjSiPudDbR3Kd4ovenlEB2A/YcRyUTF72K
         sMdw==
X-Gm-Message-State: ANhLgQ3dQ8Qhf+XBuJ4jYBvGmvoGTWv0I6B5PngCwkp/VTbBsb99Fdk+
        rocx1n9U1Id7yczoC8WbUwEb2DiU
X-Google-Smtp-Source: ADFU+vt0/Kk+6jFfNGTGjcPOjyhJ/32a5nlxynYIVxW8lWlgiqETlxRZoL7zQ5GonpdSWRpWKzhieg==
X-Received: by 2002:a1c:acc8:: with SMTP id v191mr18382676wme.185.1584816917785;
        Sat, 21 Mar 2020 11:55:17 -0700 (PDT)
Received: from [192.168.1.23] (affj62.neoplus.adsl.tpnet.pl. [95.49.139.62])
        by smtp.gmail.com with ESMTPSA id q4sm16429312wmj.1.2020.03.21.11.55.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2020 11:55:17 -0700 (PDT)
Subject: Re: [PATCH RFC leds-next] leds: initial support for Turris Omnia LEDs
To:     =?UTF-8?Q?Marek_Beh=c3=ban?= <marek.behun@nic.cz>,
        linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>
References: <20200319181604.2425-1-marek.behun@nic.cz>
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <0279d61f-6366-02cf-3d65-93d76e52de93@gmail.com>
Date:   Sat, 21 Mar 2020 19:55:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200319181604.2425-1-marek.behun@nic.cz>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Marek,

Thank you for the patch.

On 3/19/20 7:16 PM, Marek Behún wrote:
> This adds basic support for LEDs on the front side of CZ.NIC's Turris
> Omnia router.
> 
> There are 12 RGB LEDs. The controller supports HW triggering mode for
> the LEDs, but this driver does not support it yet, and sets all the LEDs
> into SW mode upon probe.
> 
> The user can either group all three channels of one RGB LED into one LED
> classdev, or expose each channel as an individual LED classdev. This is
> done by utilizing the 'led-sources' and 'color' DT properties.
> 
> In the following example the first RGB LED is exposed as one LED
> classdev with color WHITE, and the second RGB LED is exposed as three
> classdevs, one per each channel:
> 	led@0 {
> 		reg = <0>;
> 		led-sources = <0 1 2>;
> 		color = <LED_COLOR_ID_WHITE>;
> 	};
> 
> 	led@1,0 {
> 		reg = <1>;
> 		led-sources = <3>;
> 		color = <LED_COLOR_ID_RED>;
> 	};
> 
> 	led@1,1 {
> 		reg = <1>;
> 		led-sources = <4>;
> 		color = <LED_COLOR_ID_GREEN>;
> 	};
> 
> 	led@1,2 {
> 		reg = <1>;
> 		led-sources = <5>;
> 		color = <LED_COLOR_ID_BLUE>;
> 	};
> 
> I am not comfortable with the 'reg' property being same for multiple
> nodes. Perhaps the 'reg' property shouldn't be used, since the
> information needed by the driver can be deduced from the 'led-sources'.

I agree. You can name the sub-nodes like led0,led1,led2 etc.
reg is convenient if each sub-node refers to single iout, but
in this case it is unnecessary complication. You can infer the
reg in dt parser basing on led-sources.

And we need these bindings in a separate patch adding a new file
in Documentation/devicetree/bindings/leds.

You should also mention what are the allowed led-sources
configurations, i.e. I presume that only groups of (0,1,2),
(2,3,4) etc. are allowed, or a single iout per child node.

[...]
> +static int omnia_leds_probe(struct i2c_client *client,
> +			    const struct i2c_device_id *id)
> +{
> +	struct device *dev = &client->dev;
> +	struct device_node *np = dev->of_node, *child;
> +	struct omnia_leds *leds;
> +	int ret, count;
> +
> +	count = of_get_available_child_count(np);
> +	if (!count) {
> +		dev_err(dev, "LEDs are not defined in device tree!\n");
> +		return -ENODEV;
> +	} else if (count > 3 * OMNIA_BOARD_LEDS) {
> +		dev_err(dev, "Too many LEDs defined in device tree!\n");
> +		return -EINVAL;
> +	}
> +
> +	leds = devm_kzalloc(dev, sizeof(*leds) + count * sizeof(leds->leds[0]),
> +			    GFP_KERNEL);
> +	if (!leds)
> +		return -ENOMEM;
> +
> +	leds->client = client;
> +	i2c_set_clientdata(client, leds);
> +
> +	mutex_init(&leds->lock);
> +
> +	for_each_available_child_of_node(np, child) {
> +		ret = omnia_led_register(leds, &child->fwnode);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int omnia_leds_remove(struct i2c_client *client)
> +{
> +	u8 buf[OMNIA_CMD_LED_COLOR_LEN];
> +
> +	/* put all LEDs into default (HW triggered) mode */
> +	i2c_smbus_write_byte_data(client, CMD_LED_MODE,
> +				  CMD_LED_MODE_LED(OMNIA_BOARD_LEDS));
> +
> +	/* set all LEDs color to [255, 255, 255] */
> +	buf[OMNIA_CMD] = CMD_LED_COLOR;
> +	buf[OMNIA_CMD_LED_COLOR_LED] = OMNIA_BOARD_LEDS;
> +	buf[OMNIA_CMD_LED_COLOR_R] = 255;
> +	buf[OMNIA_CMD_LED_COLOR_G] = 255;
> +	buf[OMNIA_CMD_LED_COLOR_B] = 255;

What is the rationale behind setting all LEDs to max_brighntess
on driver removal?

-- 
Best regards,
Jacek Anaszewski
